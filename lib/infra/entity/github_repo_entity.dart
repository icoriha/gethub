import 'package:gethub/domain/model/github_repo.dart';
import 'package:gethub/foundation/typedefs.dart';

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

  factory GitHubRepoEntity.fromJson(Json json) {
    final Json owner = json['owner'];
    return GitHubRepoEntity(
      name: json['name'] ?? '',
      ownerAvatarUrl: owner['avatar_url'] ?? '',
      projectLanguage: json['language'] ?? '',
      starsCount: json['stargazers_count'] ?? 0,
      watchersCount: json['watchers_count'] ?? 0,
      forksCount: json['forks_count'] ?? 0,
      openIssuesCount: json['open_issues_count'] ?? 0,
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
