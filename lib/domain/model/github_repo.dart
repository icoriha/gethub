class GitHubRepo {
  GitHubRepo({
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
}
