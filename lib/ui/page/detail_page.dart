import 'package:flutter/material.dart';
import 'package:gethub/domain/model/github_repo.dart';
import 'package:quiver/strings.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(this.repo, {Key? key}) : super(key: key);
  final GitHubRepo repo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: _RepoDetailCard(repo),
            ),
          ],
        ),
      ),
    );
  }
}

class _RepoDetailCard extends StatelessWidget {
  const _RepoDetailCard(this.repo, {Key? key}) : super(key: key);

  TextStyle get _projectNameStyle =>
      const TextStyle(fontSize: 24, overflow: TextOverflow.ellipsis);
  TextStyle get _projecLanguageStyle => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black38,
      );

  BoxDecoration get _decoration => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 24, offset: Offset(0, 8))
          ]);

  final GitHubRepo repo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _decoration,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                children: [
                  _Avatar(repo.ownerAvatarUrl),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          repo.name,
                          style: _projectNameStyle,
                          maxLines: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            repo.projectLanguage,
                            style: _projecLanguageStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _CountArea('Star', repo.starsCount),
                  _CountArea('Watcher', repo.watchersCount),
                  _CountArea('Fork', repo.forksCount),
                  _CountArea('Issue', repo.openIssuesCount),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar(this.iconUrl, {Key? key}) : super(key: key);
  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    // ダミーアイコン
    if (isBlank(iconUrl)) return const Icon(Icons.account_circle, size: 64);

    return CircleAvatar(
      radius: 32,
      backgroundImage: NetworkImage(iconUrl),
    );
  }
}

class _CountArea extends StatelessWidget {
  const _CountArea(this.label, this.count, {Key? key}) : super(key: key);
  final String label;
  final int count;

  TextStyle get _labelStyle => const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Colors.black38,
      );

  TextStyle get _countStyle => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Text(label, style: _labelStyle),
          const SizedBox(height: 2),
          Text(count.toString(), style: _countStyle),
        ],
      ),
    );
  }
}
