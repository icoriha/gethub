import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gethub/domain/model/github_repo.dart';
import 'package:gethub/notifier/search_page_notifier.dart';

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
            _SearchBar(controller: _notifier.searchBarTextController),
            _SearchButton(onPressed: () => _notifier.search()),
            pageState.repos == null
                ? const Center(child: Text('検索してください'))
                : _RepoListView(
                    pageState.repos!,
                    scrollController: _scrollController,
                  ),
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
          itemBuilder: (BuildContext context, int i) =>
              SizedBox(child: Text(repos[i].name))),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 56,
        child: TextField(
          autofocus: true,
          controller: controller,
        ),
      ),
    );
  }
}

class _SearchButton extends StatelessWidget {
  const _SearchButton({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: onPressed,
        child: const Text('検索'),
      ),
    );
  }
}
