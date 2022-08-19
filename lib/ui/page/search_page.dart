import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gethub/domain/model/github_repo.dart';
import 'package:gethub/notifier/search_page_notifier.dart';
import 'package:gethub/ui/widget/repo_list_tile.dart';
import 'package:gethub/ui/widget/search_bar.dart';
import 'package:quiver/strings.dart';

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

  void _resetScroll() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
      );
    }
  }

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SearchBar(
                controller: _notifier.searchBarTextController,
                onSubmitted: (_) {
                  if (isNotBlank(_notifier.searchBarTextController.text)) {
                    _resetScroll(); // 検索キー押下時にスクロールを初期位置に戻す
                    _notifier.search();
                  }
                },
              ),
            ),
            _RepoListView(
              pageState.repos,
              scrollController: _scrollController,
              errorMessage: pageState.errorMessage,
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
    this.errorMessage,
  }) : super(key: key);
  final List<GitHubRepo>? repos;
  final ScrollController scrollController;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    if (errorMessage != null) return _ErrorWidget(errorMessage!); // エラーの場合
    if (repos == null) return const SizedBox.shrink(); // 検索前の初期状態
    if (repos!.isEmpty) return const _EmptyReposWidget(); // 検索結果がなかった場合

    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        itemCount: repos!.length,
        itemBuilder: (BuildContext context, int i) {
          return RepoListTile(repos![i]);
        },
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget(this.errorMessage, {Key? key}) : super(key: key);
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    final label =
        (errorMessage.isEmpty) ? 'An Error has occured' : errorMessage;
    return Expanded(child: Center(child: Text(label)));
  }
}

class _EmptyReposWidget extends StatelessWidget {
  const _EmptyReposWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(child: Center(child: Text('検索結果が見つかりませんでした')));
  }
}
