import 'package:gethub/domain/model/github_repo.dart';
import 'package:gethub/infra/api/github_api.dart';

class MockedGitHubApi implements GitHubApi {
  static List<GitHubRepo> repos = [
    GitHubRepo(
      name: 'Flutter App 1',
      ownerAvatarUrl: '',
      projectLanguage: 'Dart',
      starsCount: 1,
      watchersCount: 2,
      forksCount: 3,
      openIssuesCount: 4,
    ),
    GitHubRepo(
      name: 'Flutter App 2',
      ownerAvatarUrl: '',
      projectLanguage: 'Dart',
      starsCount: 10,
      watchersCount: 20,
      forksCount: 30,
      openIssuesCount: 40,
    ),
  ];

  @override
  Future<List<GitHubRepo>> searchRepos(String searchWord,
      {required int targetPage}) async {
    await Future.delayed(const Duration(microseconds: 800));
    return repos;
  }
}
