import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_it.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of Loc
/// returned by `Loc.of(context)`.
///
/// Applications need to include `Loc.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: Loc.localizationsDelegates,
///   supportedLocales: Loc.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the Loc.supportedLocales
/// property.
abstract class Loc {
  Loc(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static Loc of(BuildContext context) {
    return Localizations.of<Loc>(context, Loc)!;
  }

  static const LocalizationsDelegate<Loc> delegate = _LocDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('it')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Token Swarm'**
  String get appName;

  /// No description provided for @pressBtnToAdd.
  ///
  /// In en, this message translates to:
  /// **'Press + button to add a token'**
  String get pressBtnToAdd;

  /// No description provided for @lastUsed.
  ///
  /// In en, this message translates to:
  /// **'Last used'**
  String get lastUsed;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @tapped.
  ///
  /// In en, this message translates to:
  /// **'Tapped'**
  String get tapped;

  /// No description provided for @howManyTokensQuestion.
  ///
  /// In en, this message translates to:
  /// **'How many tokens?'**
  String get howManyTokensQuestion;

  /// No description provided for @howManyTappedQuestion.
  ///
  /// In en, this message translates to:
  /// **'How many tapped?'**
  String get howManyTappedQuestion;

  /// No description provided for @seelctStats.
  ///
  /// In en, this message translates to:
  /// **'Select stats'**
  String get seelctStats;

  /// No description provided for @valueCannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Value cannot be empty'**
  String get valueCannotBeEmpty;

  /// No description provided for @searchCard.
  ///
  /// In en, this message translates to:
  /// **'Search Card'**
  String get searchCard;

  /// No description provided for @noCardsFound.
  ///
  /// In en, this message translates to:
  /// **'No cards found!'**
  String get noCardsFound;

  /// No description provided for @attention.
  ///
  /// In en, this message translates to:
  /// **'Attention!'**
  String get attention;

  /// No description provided for @noCardsFoundDetails.
  ///
  /// In en, this message translates to:
  /// **'Search did not make any result'**
  String get noCardsFoundDetails;

  /// No description provided for @noInternet.
  ///
  /// In en, this message translates to:
  /// **'No internet!'**
  String get noInternet;

  /// No description provided for @noInternetDetails.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection and retry'**
  String get noInternetDetails;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown error occurred'**
  String get unknownError;

  /// No description provided for @deleteTokenQuestion.
  ///
  /// In en, this message translates to:
  /// **'Delete token?'**
  String get deleteTokenQuestion;

  /// No description provided for @deleteTokenQuestionDetails.
  ///
  /// In en, this message translates to:
  /// **'Do you really want to delete this token?'**
  String get deleteTokenQuestionDetails;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @addToken.
  ///
  /// In en, this message translates to:
  /// **'Add new token'**
  String get addToken;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @alwaysOnDisplay.
  ///
  /// In en, this message translates to:
  /// **'Always on display'**
  String get alwaysOnDisplay;
}

class _LocDelegate extends LocalizationsDelegate<Loc> {
  const _LocDelegate();

  @override
  Future<Loc> load(Locale locale) {
    return SynchronousFuture<Loc>(lookupLoc(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'it'].contains(locale.languageCode);

  @override
  bool shouldReload(_LocDelegate old) => false;
}

Loc lookupLoc(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return LocEn();
    case 'it': return LocIt();
  }

  throw FlutterError(
    'Loc.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
