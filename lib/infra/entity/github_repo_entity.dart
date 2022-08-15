import 'package:gethub/domain/model/github_repo.dart';

class GitHubRepoEntity {
  GitHubRepoEntity({
    required this.name,
    required this.ownerAvatarUrl,
    required this.projectLanguage,
    required this.starsCount,
    required this.watchersCount,
    required this.forksCount,
    required this.openIssuesCount,
  });
  final String name;
  final String ownerAvatarUrl;
  final String projectLanguage;
  final int starsCount;
  final int watchersCount;
  final int forksCount;
  final int openIssuesCount;

  factory GitHubRepoEntity.fromJson(Map<String, Object> json) {
    final owner = json['owner'] as Map<String, Object>;
    return GitHubRepoEntity(
      name: json['name'] as String,
      ownerAvatarUrl: owner['avator_url'] as String,
      projectLanguage: json['language'] as String,
      starsCount: json['stargazers_count'] as int,
      watchersCount: json['watchers_count'] as int,
      forksCount: json['forks_count'] as int,
      openIssuesCount: json['open_issues_count'] as int,
    );
  }

  GitHubRepo toModel() {
    return GitHubRepo(
      name: name,
      ownerAvatarUrl: ownerAvatarUrl,
      projectLanguage: projectLanguage,
      starsCount: starsCount,
      watchersCount: watchersCount,
      forksCount: forksCount,
      openIssuesCount: openIssuesCount,
    );
  }
}
