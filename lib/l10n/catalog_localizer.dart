import 'package:flutter/widgets.dart';
import 'package:luxora_ai/l10n/catalog_translations_ru.dart';

String catalogText(BuildContext context, String source) {
  final locale = Localizations.localeOf(context).languageCode;
  if (locale == 'ru') {
    return ruCatalogTranslations[source] ?? source;
  }
  return source;
}
