import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key, required this.controller, this.onSubmitted})
      : super(key: key);
  final TextEditingController controller;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: l10n.searchRepositories,
        counterText: '',
      ),
      textInputAction: TextInputAction.search,
      autofocus: true,
      controller: controller,
      onSubmitted: onSubmitted,
      maxLength: 300,
    );
  }
}
