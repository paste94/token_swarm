// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class LocEn extends Loc {
  LocEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Token Swarm';

  @override
  String get pressBtnToAdd => 'Press + button to add a token';

  @override
  String get lastUsed => 'Last used';

  @override
  String get total => 'Total';

  @override
  String get tapped => 'Tapped';

  @override
  String get howManyTokensQuestion => 'How many tokens?';

  @override
  String get howManyTappedQuestion => 'How many tapped?';

  @override
  String get seelctStats => 'Select stats';

  @override
  String get valueCannotBeEmpty => 'Value cannot be empty';

  @override
  String get searchCard => 'Search Card';

  @override
  String get noCardsFound => 'No cards found!';

  @override
  String get attention => 'Attention!';

  @override
  String get noCardsFoundDetails => 'Search did not make any result';

  @override
  String get noInternet => 'No internet!';

  @override
  String get noInternetDetails => 'Please check your internet connection and retry';

  @override
  String get unknownError => 'Unknown error occurred';

  @override
  String get deleteTokenQuestion => 'Delete token?';

  @override
  String get deleteTokenQuestionDetails => 'Do you really want to delete this token?';

  @override
  String get about => 'About';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get confirm => 'Confirm';

  @override
  String get addToken => 'Add new token';

  @override
  String get select => 'Select';

  @override
  String get alwaysOnDisplay => 'Always on display';
}
