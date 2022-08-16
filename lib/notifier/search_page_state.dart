import 'package:gethub/domain/model/github_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_page_state.freezed.dart';

// reposについて、nullは初期状態を、空配列は検索結果がないことを表す。
@freezed
class SearchPageState with _$SearchPageState {
  const factory SearchPageState({
    @Default(null) List<GitHubRepo>? repos,
    @Default(1) int currentPage,
    @Default(false) bool isLoading,
    @Default(null) String? errorMessage,
  }) = _SearchPageState;
}
