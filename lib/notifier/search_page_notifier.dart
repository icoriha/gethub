import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gethub/domain/model/github_repo.dart';
import 'package:gethub/infra/api/github_api.dart';

final searchPageNotifierProvider =
    StateNotifierProvider<SearchPageNotifier, AsyncValue<List<GitHubRepo>>>(
        (ref) => SearchPageNotifier(ref.read(gitHubAPIProvider)));

class SearchPageNotifier extends StateNotifier<AsyncValue<List<GitHubRepo>>> {
  SearchPageNotifier(this._gitHubAPI)
      : super(const AsyncValue.data(<GitHubRepo>[]));

  final GitHubAPI _gitHubAPI;
  final searchBarTextController = TextEditingController();

  Future<void> search() async {
    state = const AsyncLoading();

    try {
      final repos = await _gitHubAPI.searchRepos(searchBarTextController.text);
      state = AsyncData(repos);
    } on Exception catch (e) {
      state = AsyncError(e);
    }
  }

  Future<void> onScrollEnd() async {
    print('Scrolled to end!!');
  }
}
