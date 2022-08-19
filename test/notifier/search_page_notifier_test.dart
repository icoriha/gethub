import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gethub/infra/api/github_api.dart';
import 'package:gethub/notifier/search_page_notifier.dart';
import 'package:gethub/notifier/search_page_state.dart';

import '../infra/api/mocked_github_api.dart';

void main() {
  test('SearchPageNotfierのテスト', () async {
    final _gitHubApiProvider = Provider.autoDispose((ref) => GitHubApi());
    final _searchPageNotifierProvider = StateNotifierProvider(
      (ref) => SearchPageNotifier(
        ref.read(_gitHubApiProvider),
        TextEditingController(text: 'Some word'), // 検索フィールドに文字列を入れておく
      ),
    );

    final container = ProviderContainer(
      overrides: [
        _gitHubApiProvider.overrideWithProvider(
          Provider.autoDispose((ref) => MockedGitHubApi()),
        )
      ],
    );

    final notifier = container.read(_searchPageNotifierProvider.notifier);

    expect(notifier.debugState, const SearchPageState());

    await notifier.search(); // 検索を実行
    expect(notifier.debugState.isLoading, false);

    expect(notifier.debugState.repos != null, true); // 取得できているか
    expect(
      notifier.debugState.repos!.length,
      MockedGitHubApi.repos.length,
    ); // 取得したリポジトリの数は状態に反映されたリポジトリの数と等しいか
    expect(
      notifier.debugState.repos!.first.starsCount,
      MockedGitHubApi.repos.first.starsCount,
    ); // スター数のテスト
    expect(
      notifier.debugState.repos!.last.forksCount,
      MockedGitHubApi.repos.last.forksCount,
    ); // フォーク数のテスト
  });
}
