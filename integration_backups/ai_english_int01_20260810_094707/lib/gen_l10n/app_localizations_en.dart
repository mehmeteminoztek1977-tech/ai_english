// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get int01Title => 'The Note of the Noun';

  @override
  String get int01Prompt => 'Choose the central noun of the group.';

  @override
  String get int01Submit => 'Check';

  @override
  String get int01TryAgain => 'Try again';

  @override
  String get int01Continue => 'Continue';

  @override
  String int01AttemptsRemaining(int count) {
    return 'Attempts remaining: $count';
  }

  @override
  String get int01Hint1 =>
      'Hint: Think of the group name, not the number or color.';

  @override
  String get int01Hint2 => 'Hint: Choose the word that answers ‘Which things?’';

  @override
  String get int01Correct =>
      'Correct. ‘books’ is the central noun of the group.';

  @override
  String get int01Solution =>
      'The correct answer is ‘books’. Let’s continue with the example.';

  @override
  String get tokenStateDefault => 'Ready';

  @override
  String get tokenStateSelected => 'Selected';

  @override
  String get tokenStateCorrect => 'Correct';

  @override
  String get tokenStateIncorrect => 'Incorrect';

  @override
  String get tokenStateDisabled => 'Disabled';
}
