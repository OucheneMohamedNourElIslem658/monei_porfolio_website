import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'hello': 'Hello',
      'message': 'Welcome to GetX',
    },
    'es_ES': {
      'hello': 'Hola',
      'message': 'Bienvenido a GetX',
    },
    'fr_FR': {
      'hello': 'Bonjour',
      'message': 'Bienvenue à GetX',
    },
  };
}

class TranslationsController extends GetxController {
  var currentLocal = Get.locale;

  String get currentLocaleString {
    return '${currentLocal?.languageCode}_${currentLocal?.countryCode}';
  }

  List<String> get supportedLocals {
    final supportedLocals = <String>[];
    for (var key in (CustomTranslations().keys).keys) {
      supportedLocals.add(key);
    }
    return supportedLocals;
  }

  void updateLocal(String? language){
    language ??= "en_US";
    var localeParts = language.split('_');
    var locale = Locale(localeParts[0], localeParts.length > 1 ? localeParts[1] : '');
    Get.updateLocale(locale);
    currentLocal = locale;
    update(["language"]);
  }
}