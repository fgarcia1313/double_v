import 'package:get/get.dart';

import 'translations_en.dart';
import 'translations_es.dart';
import 'translations_fr.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': translationsEn,
        'es': translationsEs,
        'fr': translationsFr,
      };
}
