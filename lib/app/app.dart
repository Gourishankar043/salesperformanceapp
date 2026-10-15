
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../core/localization/locale_controller.dart';
import '../core/theme/app_theme.dart';
import '../l10n/generated/app_localizations.dart';
import 'routes/app_routes.dart';
import 'routes/route_names.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final LocaleController _localeController =
      LocaleController.instance;

  @override
  void initState() {
    super.initState();
    _localeController.loadSavedLocale();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _localeController,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (context) =>
          AppLocalizations.of(context)!.appName,
          theme: AppTheme.lightTheme,
          locale: _localeController.locale,
          initialRoute: RouteNames.home,
          onGenerateRoute: AppRoutes.generateRoute,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('de'),
            Locale('fr'),
            Locale('it'),
            Locale('es'),
            Locale('zh'),
            Locale('ja'),
            Locale('ko'),
            Locale('ms'),
            Locale('pt'),
          ],
        );
      },
    );
  }
}
