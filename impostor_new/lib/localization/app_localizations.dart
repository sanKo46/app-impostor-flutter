import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../controllers/language_controller.dart';

class AppLocalizations {
  final String lang;

  AppLocalizations(this.lang);

  // ---- EJEMPLOS DE TRADUCCIONES ----
  String get startGame => _get({
        "es": "Comenzar partida",
        "en": "Start game",
      });

  String get chooseMode => _get({
        "es": "Elegir modo",
        "en": "Choose mode",
      });

  String get player => _get({
        "es": "Jugador",
        "en": "Player",
      });

  String get reveal => _get({
        "es": "Revelar",
        "en": "Reveal",
      });

  String get nextPlayer => _get({
        "es": "Siguiente jugador",
        "en": "Next player",
      });

  String get impostor => _get({
        "es": "¡Eres el impostor!",
        "en": "You are the impostor!",
      });

  String get settings => _get({
        "es": "Configuración",
        "en": "Settings",
      });

  String get language => _get({
        "es": "Idioma",
        "en": "Language",
      });

  String _get(Map<String, String> map) {
    return map[lang] ?? map["es"]!;
  }
}

AppLocalizations t(BuildContext context) {
  final lang = context.watch<LanguageController>().lang;
  return AppLocalizations(lang);
}
