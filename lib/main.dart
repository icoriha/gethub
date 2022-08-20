import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gethub/foundation/app_themes.dart';
import 'package:gethub/notifier/app_theme_notifier.dart';
import 'package:gethub/ui/page/search_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeNotifierProvicer);
    final isDevice = appTheme.isDevice;
    final isDark = appTheme.isDark;

    return MaterialApp(
      title: 'GetHub',
      theme: (!isDevice && isDark) ? AppThemes.dark : AppThemes.light,
      darkTheme: (!isDevice && !isDark) ? AppThemes.light : AppThemes.dark,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ja', ''),
      ],
      home: const SearchPage(),
    );
  }
}
