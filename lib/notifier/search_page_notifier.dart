import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gethub/foundation/exceptions.dart';
import 'package:gethub/infra/api/github_api.dart';
import 'package:gethub/notifier/search_page_state.dart';
import 'package:quiver/strings.dart';

final searchPageNotifierProvider =
    StateNotifierProvider<SearchPageNotifier, SearchPageState>(
        (ref) => SearchPageNotifier(
              ref.read(gitHubApiProvider),
              TextEditingController(),
            ));

class SearchPageNotifier extends StateNotifier<SearchPageState> {
  SearchPageNotifier(
    this._gitHubApi,
    this.searchBarTextController,
  ) : super(const SearchPageState());

  final GitHubApi _gitHubApi;
  final TextEditingController searchBarTextController;

  Future<void> search() async {
    final searchWord = searchBarTextController.text;
    if (isBlank(searchWord)) return;

    // 検索が成功した場合でもページは1に戻るためnextPageは初期値に戻しておく
    state = state.copyWith(isLoading: true, nextPage: 2, errorMessage: null);

    try {
      final repos = await _gitHubApi.searchRepos(
        searchWord,
        targetPage: 1,
      );
      state = state.copyWith(repos: repos, lastSearchedWord: searchWord);
    } on HttpResponceException catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } on Exception catch (_) {
      state = state.copyWith(errorMessage: '');
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
      final nextRepos = await _gitHubApi.searchRepos(
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
    } on HttpResponceException catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } on Exception catch (_) {
      state = state.copyWith(errorMessage: '');
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
