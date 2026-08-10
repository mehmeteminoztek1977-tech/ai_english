// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get int01Title => 'İsmin Notası';

  @override
  String get int01Prompt => 'Grubun merkez ismini seçin.';

  @override
  String get int01Submit => 'Kontrol et';

  @override
  String get int01TryAgain => 'Tekrar dene';

  @override
  String get int01Continue => 'Devam et';

  @override
  String int01AttemptsRemaining(int count) {
    return 'Kalan deneme: $count';
  }

  @override
  String get int01Hint1 =>
      'İpucu: Sayıyı veya rengi değil, grubun adını düşün.';

  @override
  String get int01Hint2 =>
      'İpucu: ‘Hangi şeyler?’ sorusuna cevap veren kelimeyi seç.';

  @override
  String get int01Correct => 'Doğru. ‘books’ grubun merkez ismidir.';

  @override
  String get int01Solution =>
      'Doğru cevap ‘books’. Şimdi örnek üzerinde devam edelim.';

  @override
  String get tokenStateDefault => 'Hazır';

  @override
  String get tokenStateSelected => 'Seçildi';

  @override
  String get tokenStateCorrect => 'Doğru';

  @override
  String get tokenStateIncorrect => 'Yanlış';

  @override
  String get tokenStateDisabled => 'Devre dışı';
}
