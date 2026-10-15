import 'package:flutter/material.dart';

import '../../../../core/localization/locale_controller.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../core/widgets/view_toggle.dart';

class HomeHeader extends StatelessWidget {
  final bool isTeamView;
  final VoidCallback onTeamSelected;
  final VoidCallback onPersonSelected;

  const HomeHeader({
    super.key,
    required this.isTeamView,
    required this.onTeamSelected,
    required this.onPersonSelected,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.homeHeaderHorizontalPadding,
        vertical: AppDimensions.homeHeaderBottomPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PopupMenuButton<String>(
            tooltip: l10n.selectLanguage,
            icon: const Icon(Icons.language),
            onSelected: (languageCode) {
              LocaleController.instance.changeLocale(languageCode);
            },
            itemBuilder: (context) {
              final languages = <String, String>{
                'en': l10n.english,
                'de': l10n.german,
                'fr': l10n.french,
                'it': l10n.italian,
                'es': l10n.spanish,
                'zh': l10n.chinese,
                'ja': l10n.japanese,
                'ko': l10n.korean,
                'ms': l10n.malay,
                'pt': l10n.portuguese,
              };

              return languages.entries.map((entry) {
                return PopupMenuItem<String>(
                  value: entry.key,
                  child: Text(entry.value),
                );
              }).toList();
            },
          ),

          ViewToggle(
            isTeamView: isTeamView,
            onTeamSelected: onTeamSelected,
            onPersonSelected: onPersonSelected,
          ),
        ],
      ),
    );
  }
}