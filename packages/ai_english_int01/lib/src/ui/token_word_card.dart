import 'package:flutter/material.dart';

import '../model/interaction_spec.dart';
import 'int01_theme.dart';

enum TokenCardState {
  defaultState,
  selected,
  correct,
  incorrect,
  disabled,
}

class TokenWordCard extends StatelessWidget {
  const TokenWordCard({
    super.key,
    required this.token,
    required this.state,
    required this.stateLabel,
    this.onTap,
    this.reduceMotion,
  });

  static const Curve lockedCurve = Cubic(0.22, 1, 0.36, 1);

  final TokenWord token;
  final TokenCardState state;
  final String stateLabel;
  final VoidCallback? onTap;
  final bool? reduceMotion;

  @override
  Widget build(BuildContext context) {
    final Int01Theme colors =
        Theme.of(context).extension<Int01Theme>() ?? Int01Theme.standard();
    final bool motionReduced =
        reduceMotion ?? MediaQuery.disableAnimationsOf(context);
    final bool enabled = state != TokenCardState.disabled && onTap != null;
    final _CardVisual visual = _visualFor(colors);

    final Widget content = Semantics(
      button: onTap != null,
      enabled: enabled,
      selected: state == TokenCardState.selected,
      label: '${token.text}, ${token.role.jsonValue}, $stateLabel',
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 48,
          minHeight: 48,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: enabled ? onTap : null,
            borderRadius: BorderRadius.circular(16),
            child: AnimatedContainer(
              duration: motionReduced
                  ? Duration.zero
                  : const Duration(milliseconds: 220),
              curve: lockedCurve,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                color: visual.fill,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: visual.border, width: 2),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: colors.accentFor(token.role),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    token.text,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: visual.foreground,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(width: 12),
                  Icon(visual.icon, size: 18, color: visual.foreground),
                  const SizedBox(width: 6),
                  Text(
                    stateLabel,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: visual.foreground,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    final Widget opacity = AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: state == TokenCardState.disabled ? 0.64 : 1,
      child: content,
    );
    if (motionReduced) {
      return opacity;
    }
    return AnimatedScale(
      duration: const Duration(milliseconds: 220),
      curve: lockedCurve,
      scale: state == TokenCardState.selected ? 1.03 : 1,
      child: opacity,
    );
  }

  _CardVisual _visualFor(Int01Theme colors) => switch (state) {
        TokenCardState.defaultState => _CardVisual(
            fill: colors.surface,
            border: colors.defaultBorder,
            foreground: colors.onSurface,
            icon: Icons.radio_button_unchecked,
          ),
        TokenCardState.selected => _CardVisual(
            fill: colors.selectedFill,
            border: colors.selectedBorder,
            foreground: colors.onSurface,
            icon: Icons.check_circle_outline,
          ),
        TokenCardState.correct => _CardVisual(
            fill: colors.correctFill,
            border: colors.correctBorder,
            foreground: colors.correctBorder,
            icon: Icons.check_circle,
          ),
        TokenCardState.incorrect => _CardVisual(
            fill: colors.incorrectFill,
            border: colors.incorrectBorder,
            foreground: colors.incorrectBorder,
            icon: Icons.cancel,
          ),
        TokenCardState.disabled => _CardVisual(
            fill: colors.disabledFill,
            border: colors.defaultBorder,
            foreground: colors.disabledForeground,
            icon: Icons.block,
          ),
      };
}

class _CardVisual {
  const _CardVisual({
    required this.fill,
    required this.border,
    required this.foreground,
    required this.icon,
  });

  final Color fill;
  final Color border;
  final Color foreground;
  final IconData icon;
}
