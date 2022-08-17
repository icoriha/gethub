import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, required this.controller, this.onSubmitted})
      : super(key: key);
  final TextEditingController controller;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: 'リポジトリを検索',
      ),
      textInputAction: TextInputAction.search,
      autofocus: true,
      controller: controller,
      onSubmitted: onSubmitted,
      maxLength: 80,
    );
  }
}
