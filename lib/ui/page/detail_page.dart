import 'package:flutter/material.dart';
import 'package:gethub/domain/model/github_repo.dart';
import 'package:quiver/strings.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(this.repo, {Key? key}) : super(key: key);
  final GitHubRepo repo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(repo.name, overflow: TextOverflow.ellipsis,)),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _Avatar(repo.ownerAvatarUrl),
              Text(repo.projectLanguage),
              Text('Star: ${repo.starsCount}'),
              Text('Watcher: ${repo.watchersCount}'),
              Text('Fork: ${repo.forksCount}'),
              Text('Issue: ${repo.openIssuesCount}'),
            ],
          ),
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
