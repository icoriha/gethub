import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gethub/domain/model/github_repo.dart';
import 'package:gethub/foundation/is_dark_mode.dart';
import 'package:gethub/notifier/search_page_notifier.dart';
import 'package:gethub/ui/page/setting_page.dart';
import 'package:gethub/ui/widget/repo_list_tile.dart';
import 'package:gethub/ui/widget/search_field.dart';
import 'package:quiver/strings.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetHub'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SettingPage()),
            ),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
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
              child: SearchField(
                controller: _notifier.searchFieldTextController,
                onSubmitted: (_) {
                  if (isNotBlank(_notifier.searchFieldTextController.text)) {
                    _resetScroll(); // ???????????????????????????????????????????????????????????????
                    _notifier.search();
                  }
                },
              ),
            ),
            _RepoListView(
              pageState.repos,
              scrollController: _scrollController,
              errorMessage: pageState.errorMessage,
              isDark: ref.watch(
                  isDarkProvider(MediaQuery.platformBrightnessOf(context))),
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
    required this.isDark,
    this.errorMessage,
  }) : super(key: key);
  final List<GitHubRepo>? repos;
  final ScrollController scrollController;
  final String? errorMessage;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    if (errorMessage != null) return _ErrorWidget(errorMessage!); // ??????????????????
    if (repos == null) return const SizedBox.shrink(); // ????????????????????????
    if (repos!.isEmpty) return const _EmptyReposWidget(); // ?????????????????????????????????

    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        itemCount: repos!.length,
        itemBuilder: (BuildContext context, int i) {
          return RepoListTile(
            repos![i],
            isDark: isDark,
          );
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
    final l10n = AppLocalizations.of(context)!;
    final label = (errorMessage.isEmpty) ? l10n.error : errorMessage;
    return Expanded(
        child: Center(
            child: Text(label, style: Theme.of(context).textTheme.bodyText1)));
  }
}

class _EmptyReposWidget extends StatelessWidget {
  const _EmptyReposWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Expanded(
        child: Center(
            child: Text(l10n.noResult,
                style: Theme.of(context).textTheme.bodyText1)));
  }
}
