import 'package:flutter/material.dart';
import 'package:gethub/domain/model/github_repo.dart';
import 'package:gethub/ui/page/detail_page.dart';

class RepoListTile extends StatelessWidget {
  const RepoListTile(this.repo, {Key? key, required this.isDark})
      : super(key: key);
  final GitHubRepo repo;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => DetailPage(repo)),
      ),
      child: Card(
        child:
            ListTile(title: Text(repo.name, overflow: TextOverflow.ellipsis)),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        elevation: 8,
        shadowColor: isDark ? Colors.transparent : Colors.black38,
      ),
    );
  }
}
