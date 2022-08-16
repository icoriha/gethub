import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

class _Body extends ConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(searchPageNotifierProvider.notifier);
    final pageState = ref.watch(searchPageNotifierProvider);
    return Column(
      children: [
        _SearchBar(controller: notifier.searchTextController),
        _SearchButton(onPressed: () => notifier.search()),
        Expanded(
          child: pageState.when(
            data: (repos) => ListView.builder(
                itemCount: repos.length,
                itemBuilder: (BuildContext context, int i) =>
                    SizedBox(child: Text(repos[i].name))),

            // TODO: ステータスコードに対応したエラーメッセージを表示する
            error: (_, __) => Center(child: Text('エラーが発生しました')),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        )
      ],
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
