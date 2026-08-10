import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @int01Title.
  ///
  /// In tr, this message translates to:
  /// **'İsmin Notası'**
  String get int01Title;

  /// No description provided for @int01Prompt.
  ///
  /// In tr, this message translates to:
  /// **'Grubun merkez ismini seçin.'**
  String get int01Prompt;

  /// No description provided for @int01Submit.
  ///
  /// In tr, this message translates to:
  /// **'Kontrol et'**
  String get int01Submit;

  /// No description provided for @int01TryAgain.
  ///
  /// In tr, this message translates to:
  /// **'Tekrar dene'**
  String get int01TryAgain;

  /// No description provided for @int01Continue.
  ///
  /// In tr, this message translates to:
  /// **'Devam et'**
  String get int01Continue;

  /// No description provided for @int01AttemptsRemaining.
  ///
  /// In tr, this message translates to:
  /// **'Kalan deneme: {count}'**
  String int01AttemptsRemaining(int count);

  /// No description provided for @int01Hint1.
  ///
  /// In tr, this message translates to:
  /// **'İpucu: Sayıyı veya rengi değil, grubun adını düşün.'**
  String get int01Hint1;

  /// No description provided for @int01Hint2.
  ///
  /// In tr, this message translates to:
  /// **'İpucu: ‘Hangi şeyler?’ sorusuna cevap veren kelimeyi seç.'**
  String get int01Hint2;

  /// No description provided for @int01Correct.
  ///
  /// In tr, this message translates to:
  /// **'Doğru. ‘books’ grubun merkez ismidir.'**
  String get int01Correct;

  /// No description provided for @int01Solution.
  ///
  /// In tr, this message translates to:
  /// **'Doğru cevap ‘books’. Şimdi örnek üzerinde devam edelim.'**
  String get int01Solution;

  /// No description provided for @tokenStateDefault.
  ///
  /// In tr, this message translates to:
  /// **'Hazır'**
  String get tokenStateDefault;

  /// No description provided for @tokenStateSelected.
  ///
  /// In tr, this message translates to:
  /// **'Seçildi'**
  String get tokenStateSelected;

  /// No description provided for @tokenStateCorrect.
  ///
  /// In tr, this message translates to:
  /// **'Doğru'**
  String get tokenStateCorrect;

  /// No description provided for @tokenStateIncorrect.
  ///
  /// In tr, this message translates to:
  /// **'Yanlış'**
  String get tokenStateIncorrect;

  /// No description provided for @tokenStateDisabled.
  ///
  /// In tr, this message translates to:
  /// **'Devre dışı'**
  String get tokenStateDisabled;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
