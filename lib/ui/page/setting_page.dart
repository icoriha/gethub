import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gethub/notifier/app_theme_notifier.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(appThemeNotifierProvicer.notifier);
    final appTheme = ref.watch(appThemeNotifierProvicer);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text(l10n.useDeviceMode),
            value: appTheme.isDevice,
            onChanged: (bool _) => notifier.toggleIsDevice(),
          ),
          SwitchListTile(
            title: Text(l10n.darkMode),
            value: appTheme.isDark,
            onChanged: (bool _) => notifier.toggleIsDark(),
          ),
        ],
      ),
    );
  }
}
