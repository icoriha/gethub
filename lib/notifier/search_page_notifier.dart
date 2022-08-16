import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gethub/infra/api/github_api.dart';
import 'package:gethub/notifier/search_page_state.dart';
import 'package:quiver/strings.dart';

final searchPageNotifierProvider =
    StateNotifierProvider<SearchPageNotifier, SearchPageState>(
        (ref) => SearchPageNotifier(ref.read(gitHubAPIProvider)));

class SearchPageNotifier extends StateNotifier<SearchPageState> {
  SearchPageNotifier(this._gitHubAPI) : super(const SearchPageState());

  final GitHubAPI _gitHubAPI;
  final searchBarTextController = TextEditingController();

  Future<void> search() async {
    final searchWord = searchBarTextController.text;
    if (isBlank(searchWord)) {
      // 空文字の場合は検索前の状態に戻す
      await _cleanUp();
      return;
    }

    // 検索が成功した場合でもページは1に戻るためnextPageは初期値に戻しておく
    state = state.copyWith(isLoading: true, nextPage: 2);

    try {
      final repos = await _gitHubAPI.searchRepos(
        searchWord,
        targetPage: 1,
      );
      state = state.copyWith(repos: repos, lastSearchedWord: searchWord);
    } on Exception catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> onScrollEnd() async {
    if (state.isLoading) return; // ローディング中は何もしない
    if (state.repos == null) return; // 初期状態ではスクロールしても何もしない
    if (state.repos!.isEmpty) return; // 検索結果が無い場合はスクロールしても何もしない

    if (isBlank(state.lastSearchedWord)) return; // nullおよび空文字では検索しない
    final lastSearchedWord = state.lastSearchedWord!;

    state = state.copyWith(isLoading: true);

    try {
      final nextRepos = await _gitHubAPI.searchRepos(
        lastSearchedWord,
        targetPage: state.nextPage,
      );
      if (nextRepos.isEmpty) {
        print('すべての検索結果を取得しました');
        return; // 検索結果が無かった場合はリポジトリを追加しない
      }

      state = state.copyWith(
        repos: [...(state.repos!), ...nextRepos],
        nextPage: state.nextPage + 1,
      );
      print('リポジトリを${nextRepos.length}件追加');
    } on Exception catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> _cleanUp() async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(const Duration(seconds: 1)); // UX向上を意図した遅延
    state = const SearchPageState();
    return;
  }
}
