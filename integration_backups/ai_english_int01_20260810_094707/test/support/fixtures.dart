import 'package:ai_english_int01/ai_english_int01.dart';

InteractionSpec buildInteractionSpec() {
  return InteractionSpec.fromJson(<String, Object?>{
    'schemaVersion': '1.0',
    'interactionId': 'INT-01',
    'lessonId': 'CORE-E1-W1-L1',
    'trigger': <String, Object?>{
      'timeUnit': 'milliseconds',
      'pauseAt': 50000,
      'timeoutMs': null,
    },
    'uiConfig': <String, Object?>{
      'selectionModel': 'single',
      'allowDeselect': true,
    },
    'tokens': <Object?>[
      <String, Object?>{'id': 't1', 'role': 'Quantity', 'text': 'two'},
      <String, Object?>{'id': 't2', 'role': 'Adjective', 'text': 'blue'},
      <String, Object?>{'id': 't3', 'role': 'HeadNoun', 'text': 'books'},
    ],
    'validation': <String, Object?>{
      'correctId': 't3',
      'maxAttempts': 3,
      'onCorrect': 'resume_after_INT-01',
      'onFirstFail': 'show_hint_1',
      'onSecondFail': 'show_hint_2',
      'onThirdFail': 'show_solution_and_proceed',
    },
    'accessibility': <String, Object?>{
      'language': 'tr-TR',
      'screenReaderLabel':
          'Grubun merkez ismini seçin: two, blue, veya books.',
    },
  });
}

