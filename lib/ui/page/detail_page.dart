import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gethub/domain/model/github_repo.dart';
import 'package:gethub/foundation/is_dark_mode.dart';
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

class _RepoDetailCard extends ConsumerWidget {
  const _RepoDetailCard(this.repo, {Key? key}) : super(key: key);

  BoxDecoration _decoration(BuildContext context, bool isDark) => BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(16),
      boxShadow: isDark
          ? null
          : const [
              BoxShadow(
                  color: Colors.black12, blurRadius: 24, offset: Offset(0, 8))
            ]);

  final GitHubRepo repo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark =
        ref.watch(isDarkProvider(MediaQuery.platformBrightnessOf(context)));
    return Container(
      decoration: _decoration(context, isDark),
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
                          style: Theme.of(context).textTheme.headline1,
                          maxLines: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(repo.projectLanguage,
                              style: Theme.of(context).textTheme.headline2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Divider(color: isDark ? Colors.transparent : null),
            ), // LightModeの場合のみDividerが見えるようにする
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Text(label, style: Theme.of(context).textTheme.headline3),
          const SizedBox(height: 2),
          Text(count.toString(), style: Theme.of(context).textTheme.headline4),
        ],
      ),
    );
  }
}
