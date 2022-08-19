import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gethub/domain/model/github_repo.dart';
import 'package:gethub/notifier/search_page_notifier.dart';
import 'package:gethub/ui/page/detail_page.dart';
import 'package:gethub/ui/widget/repo_list_tile.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetHub')),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerStatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends ConsumerState<_Body> {
  late ScrollController _scrollController;

  SearchPageNotifier get _notifier =>
      ref.read(searchPageNotifierProvider.notifier);

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        _notifier.onScrollEnd();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pageState = ref.watch(searchPageNotifierProvider);
    return Stack(
      children: [
        Column(
          children: [
            _SearchBar(
              controller: _notifier.searchBarTextController,
              onSubmitted: (_) {
                // 検索キー押下時にリストの先頭に戻しておく
                if (_scrollController.hasClients) {
                  _scrollController.animateTo(0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.linear);
                }
                _notifier.search();
              },
            ),
            (pageState.errorMessage == null)
                ? pageState.repos == null
                    ? const Center(child: Text('検索してください'))
                    : _RepoListView(
                        pageState.repos!,
                        scrollController: _scrollController,
                      )
                : Expanded(child: Center(child: Text(pageState.errorMessage!))),
          ],
        ),
        pageState.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class _RepoListView extends StatelessWidget {
  const _RepoListView(
    this.repos, {
    Key? key,
    required this.scrollController,
  }) : super(key: key);
  final List<GitHubRepo> repos;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        itemCount: repos.length,
        itemBuilder: (BuildContext context, int i) {
          return RepoListTile(
            repos[i],
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DetailPage(repos[i])),
            ),
          );
        },
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key, required this.controller, this.onSubmitted})
      : super(key: key);
  final TextEditingController controller;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 56,
        child: Center(
          child: TextField(
            decoration: const InputDecoration(prefixIcon: Icon(Icons.search)),
            textInputAction: TextInputAction.search,
            autofocus: true,
            controller: controller,
            onSubmitted: onSubmitted,
          ),
        ),
      ),
    );
  }
}
