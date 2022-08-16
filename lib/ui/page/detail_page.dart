import 'package:flutter/material.dart';
import 'package:gethub/domain/model/github_repo.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(this.repo, {Key? key}) : super(key: key);
  final GitHubRepo repo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(repo.name)),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
