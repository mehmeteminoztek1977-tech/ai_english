import 'package:ai_english_int01/ai_english_int01.dart';
import 'package:flutter_test/flutter_test.dart';

import '../support/fixtures.dart';

void main() {
  group('InteractionSpec', () {
    test('parses the locked INT-01 contract', () {
      final InteractionSpec spec = buildInteractionSpec();

      expect(spec.schemaVersion, '1.0');
      expect(spec.pauseAtMs, 50000);
      expect(spec.tokens.map((TokenWord token) => token.text),
          <String>['two', 'blue', 'books']);
      expect(spec.validation.correctId, 't3');
      expect(spec.validation.maxAttempts, 3);
    });

    test('rejects a missing correct token', () {
      final Map<String, Object?> json = buildInteractionSpec().toJson();
      json['validation'] = <String, Object?>{
        ...(json['validation']! as Map<String, Object?>),
        'correctId': 'missing',
      };

      expect(
        () => InteractionSpec.fromJson(json),
        throwsA(isA<InteractionSpecException>()),
      );
    });
  });
}
