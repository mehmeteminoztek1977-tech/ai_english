import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../controller/show_tokens_controller.dart';
import '../model/interaction_spec.dart';
import 'token_word_card.dart';

class ShowTokensRow extends StatelessWidget {
  const ShowTokensRow({
    super.key,
    required this.controller,
    required this.tokens,
    required this.defaultStateLabel,
  });

  final ShowTokensController controller;
  final List<TokenWord> tokens;
  final String defaultStateLabel;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        final bool reduceMotion = MediaQuery.disableAnimationsOf(context);
        return Wrap(
          alignment: WrapAlignment.center,
          spacing: 12,
          runSpacing: 12,
          children: tokens
              .where(
                (TokenWord token) =>
                    controller.state.visibleTokenIds.contains(token.id),
              )
              .map(
                (TokenWord token) => _TokenEntrance(
                  key: ValueKey<String>(token.id),
                  reduceMotion: reduceMotion,
                  translateDistancePx:
                      controller.motion.translateYPx.abs(),
                  maximumScale: controller.motion.focusPulse.reduce(
                    (double first, double second) =>
                        first > second ? first : second,
                  ),
                  child: TokenWordCard(
                    token: token,
                    state: TokenCardState.defaultState,
                    stateLabel: defaultStateLabel,
                    reduceMotion: reduceMotion,
                  ),
                ),
              )
              .toList(growable: false),
        );
      },
    );
  }
}

class _TokenEntrance extends StatelessWidget {
  const _TokenEntrance({
    super.key,
    required this.reduceMotion,
    required this.translateDistancePx,
    required this.maximumScale,
    required this.child,
  });

  final bool reduceMotion;
  final double translateDistancePx;
  final double maximumScale;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (reduceMotion) {
      return TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 200),
        builder: (BuildContext context, double value, Widget? child) {
          return Opacity(opacity: value, child: child);
        },
        child: child,
      );
    }

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 360),
      curve: TokenWordCard.lockedCurve,
      builder: (BuildContext context, double value, Widget? child) {
        final double pulse =
            1 + ((maximumScale - 1) * math.sin(math.pi * value));
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, translateDistancePx * (1 - value)),
            child: Transform.scale(scale: pulse, child: child),
          ),
        );
      },
      child: child,
    );
  }
}
