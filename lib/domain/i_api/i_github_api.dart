import 'package:gethub/domain/model/github_repo.dart';

abstract class IGitHubAPI {
  Future<List<GitHubRepo>> searchRepos(String searchWord,
      {required int targetPage});
}
