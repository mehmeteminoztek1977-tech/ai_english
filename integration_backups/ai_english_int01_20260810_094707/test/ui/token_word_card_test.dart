import 'package:ai_english_int01/ai_english_int01.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const TokenWord token = TokenWord(
    id: 't3',
    role: TokenRole.headNoun,
    text: 'books',
  );

  testWidgets('exposes state without relying only on color',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          extensions: <ThemeExtension<dynamic>>[Int01Theme.standard()],
        ),
        home: const Scaffold(
          body: Center(
            child: TokenWordCard(
              token: token,
              state: TokenCardState.correct,
              stateLabel: 'Doğru',
            ),
          ),
        ),
      ),
    );

    expect(find.text('Doğru'), findsOneWidget);
    expect(find.byIcon(Icons.check_circle), findsOneWidget);
    expect(find.bySemanticsLabel('books, HeadNoun, Doğru'), findsOneWidget);
  });

  testWidgets('keeps at least a 48 by 48 dp target',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TokenWordCard(
            token: token,
            state: TokenCardState.defaultState,
            stateLabel: 'Hazır',
            onTap: () {},
          ),
        ),
      ),
    );

    final Size size = tester.getSize(find.byType(InkWell));
    expect(size.width, greaterThanOrEqualTo(48));
    expect(size.height, greaterThanOrEqualTo(48));
  });

  testWidgets('removes transform animation in reduced motion mode',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TokenWordCard(
            token: token,
            state: TokenCardState.selected,
            stateLabel: 'Seçildi',
            reduceMotion: true,
          ),
        ),
      ),
    );

    expect(find.byType(AnimatedScale), findsNothing);
    expect(find.byType(AnimatedOpacity), findsOneWidget);
  });
}

