import 'package:ai_english_int01/ai_english_int01.dart';
import 'package:flutter_test/flutter_test.dart';

import '../support/fixtures.dart';

void main() {
  group('InteractionStateMachine', () {
    test('supports deselection without consuming an attempt', () {
      final InteractionStateMachine machine = InteractionStateMachine(
        spec: buildInteractionSpec(),
      )..trigger();

      machine.select('t1');
      machine.select('t1');

      expect(machine.state.selectedId, isNull);
      expect(machine.state.attemptsUsed, 0);
    });

    test('emits two hints then the solution flow', () {
      final InteractionStateMachine machine = InteractionStateMachine(
        spec: buildInteractionSpec(),
      )..trigger();

      machine.select('t1');
      machine.submit();
      expect(machine.state.flowAction, 'show_hint_1');
      machine.acknowledgeIncorrectFeedback();

      machine.select('t2');
      machine.submit();
      expect(machine.state.flowAction, 'show_hint_2');
      machine.acknowledgeIncorrectFeedback();

      machine.select('t1');
      machine.submit();
      expect(machine.state.phase, InteractionPhase.solution);
      expect(machine.state.flowAction, 'show_solution_and_proceed');
      expect(machine.attemptsRemaining, 0);
    });

    test('resolves a correct answer with the resume action', () {
      final InteractionStateMachine machine = InteractionStateMachine(
        spec: buildInteractionSpec(),
      )..trigger();

      machine.select('t3');
      machine.submit();

      expect(machine.state.phase, InteractionPhase.correctFeedback);
      expect(machine.state.flowAction, 'resume_after_INT-01');
      machine.resolve();
      expect(machine.state.isResolved, isTrue);
    });
  });
}

