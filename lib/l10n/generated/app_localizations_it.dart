// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class LocIt extends Loc {
  LocIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'Token Swarm';

  @override
  String get pressBtnToAdd => 'Tocca + per aggiungere un token';

  @override
  String get lastUsed => 'Storico';

  @override
  String get total => 'Totale';

  @override
  String get tapped => 'Tappate';

  @override
  String get howManyTokensQuestion => 'Quanti token?';

  @override
  String get howManyTappedQuestion => 'Quanti tappati?';

  @override
  String get seelctStats => 'Seleziona';

  @override
  String get valueCannotBeEmpty => 'Il valore non può essere vuoto';

  @override
  String get searchCard => 'Cerca';

  @override
  String get noCardsFound => 'Token non trovati';

  @override
  String get attention => 'Attenzione!';

  @override
  String get noCardsFoundDetails => 'Non sono stati trovati token con questo nome';

  @override
  String get noInternet => 'Connessione ad internet non presente';

  @override
  String get noInternetDetails => 'E\' necessario collegarsi a internet per proseguire';

  @override
  String get unknownError => 'Errore sconosciuto';

  @override
  String get deleteTokenQuestion => 'Cancellare il token?';

  @override
  String get deleteTokenQuestionDetails => 'Si desidera eliminare definitivamente il token?';

  @override
  String get about => 'Informazioni';

  @override
  String get cancel => 'Annulla';

  @override
  String get delete => 'Elimina';

  @override
  String get confirm => 'Conferma';

  @override
  String get addToken => 'Aggiungi un nuovo token';

  @override
  String get select => 'Seleziona';

  @override
  String get alwaysOnDisplay => 'Mantieni schermo acceso';
}
