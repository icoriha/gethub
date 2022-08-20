import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gethub/notifier/app_theme_notifier.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(appThemeNotifierProvicer.notifier);
    final appTheme = ref.watch(appThemeNotifierProvicer);
    return Scaffold(
      appBar: AppBar(title: Text('設定')),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('端末設定のモードを使用'),
            value: appTheme.isDevice,
            onChanged: (bool _) => notifier.toggleIsDevice(),
          ),
          SwitchListTile(
            title: Text('ダークモード'),
            value: appTheme.isDark,
            onChanged: (bool _) => notifier.toggleIsDark(),
          ),
        ],
      ),
    );
  }
}
