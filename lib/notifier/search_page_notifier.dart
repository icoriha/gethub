import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gethub/infra/api/github_api.dart';
import 'package:gethub/notifier/search_page_state.dart';

final searchPageNotifierProvider =
    StateNotifierProvider<SearchPageNotifier, SearchPageState>(
        (ref) => SearchPageNotifier(ref.read(gitHubAPIProvider)));

class SearchPageNotifier extends StateNotifier<SearchPageState> {
  SearchPageNotifier(this._gitHubAPI) : super(const SearchPageState());

  final GitHubAPI _gitHubAPI;
  final searchBarTextController = TextEditingController();

  Future<void> search() async {
    state = state.copyWith(isLoading: true);

    try {
      final repos = await _gitHubAPI.searchRepos(
        searchBarTextController.text,
        targetPage: 1,
      );
      state = state.copyWith(repos: repos);
    } on Exception catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> onScrollEnd() async {
    if (state.repos == null) return; // 初期状態ではスクロールしても何もしない
    if (state.repos!.isEmpty) return; // 検索結果が無い場合はスクロールしても何もしない

    state = state.copyWith(isLoading: true);

    try {
      final nextRepos = await _gitHubAPI.searchRepos(
        searchBarTextController.text,
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
}
