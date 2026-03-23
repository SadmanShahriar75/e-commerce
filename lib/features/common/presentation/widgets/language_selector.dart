import 'package:crafy_bay/app/providers/language_provider.dart';
import 'package:crafy_bay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(AppLocalizations.of(context)!.changeLanguage),
        DropdownMenu<String>(
          initialSelection: 'en',

          onSelected: (String? language) {
            context.read<LanguageProvider>().changeLocale(Locale(language!));
          },
          dropdownMenuEntries: [
            DropdownMenuEntry(value: 'en', label: 'Engliash'),
            DropdownMenuEntry(value: 'bn', label: 'Bangla'),
          ],
        ),
      ],
    );
  }
}
