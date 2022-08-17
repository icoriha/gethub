import 'package:flutter/material.dart';
import 'package:gethub/domain/model/github_repo.dart';

class RepoListTile extends StatelessWidget {
  const RepoListTile(this.repo, {Key? key, this.onTap}) : super(key: key);
  final GitHubRepo repo;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child:
            ListTile(title: Text(repo.name, overflow: TextOverflow.ellipsis)),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        elevation: 8,
        shadowColor: Colors.black38,
      ),
    );
  }
}
