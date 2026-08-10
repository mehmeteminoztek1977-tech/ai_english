import 'package:flutter/material.dart';

import '../model/interaction_spec.dart';

@immutable
class Int01Theme extends ThemeExtension<Int01Theme> {
  const Int01Theme({
    required this.surface,
    required this.onSurface,
    required this.defaultBorder,
    required this.selectedFill,
    required this.selectedBorder,
    required this.correctFill,
    required this.correctBorder,
    required this.incorrectFill,
    required this.incorrectBorder,
    required this.disabledFill,
    required this.disabledForeground,
    required this.quantityAccent,
    required this.adjectiveAccent,
    required this.headNounAccent,
  });

  factory Int01Theme.standard() => const Int01Theme(
        surface: Color(0xFFFFFBF5),
        onSurface: Color(0xFF24212E),
        defaultBorder: Color(0xFFD8D1C7),
        selectedFill: Color(0xFFF0EBFF),
        selectedBorder: Color(0xFF6F54C9),
        correctFill: Color(0xFFE3F5EA),
        correctBorder: Color(0xFF287A4B),
        incorrectFill: Color(0xFFFFE8E6),
        incorrectBorder: Color(0xFFB43A32),
        disabledFill: Color(0xFFEAE7E2),
        disabledForeground: Color(0xFF77716A),
        quantityAccent: Color(0xFF7A5BC7),
        adjectiveAccent: Color(0xFF2D6FB8),
        headNounAccent: Color(0xFF287A4B),
      );

  final Color surface;
  final Color onSurface;
  final Color defaultBorder;
  final Color selectedFill;
  final Color selectedBorder;
  final Color correctFill;
  final Color correctBorder;
  final Color incorrectFill;
  final Color incorrectBorder;
  final Color disabledFill;
  final Color disabledForeground;
  final Color quantityAccent;
  final Color adjectiveAccent;
  final Color headNounAccent;

  Color accentFor(TokenRole role) => switch (role) {
        TokenRole.quantity => quantityAccent,
        TokenRole.adjective => adjectiveAccent,
        TokenRole.headNoun => headNounAccent,
      };

  @override
  Int01Theme copyWith({
    Color? surface,
    Color? onSurface,
    Color? defaultBorder,
    Color? selectedFill,
    Color? selectedBorder,
    Color? correctFill,
    Color? correctBorder,
    Color? incorrectFill,
    Color? incorrectBorder,
    Color? disabledFill,
    Color? disabledForeground,
    Color? quantityAccent,
    Color? adjectiveAccent,
    Color? headNounAccent,
  }) {
    return Int01Theme(
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      defaultBorder: defaultBorder ?? this.defaultBorder,
      selectedFill: selectedFill ?? this.selectedFill,
      selectedBorder: selectedBorder ?? this.selectedBorder,
      correctFill: correctFill ?? this.correctFill,
      correctBorder: correctBorder ?? this.correctBorder,
      incorrectFill: incorrectFill ?? this.incorrectFill,
      incorrectBorder: incorrectBorder ?? this.incorrectBorder,
      disabledFill: disabledFill ?? this.disabledFill,
      disabledForeground: disabledForeground ?? this.disabledForeground,
      quantityAccent: quantityAccent ?? this.quantityAccent,
      adjectiveAccent: adjectiveAccent ?? this.adjectiveAccent,
      headNounAccent: headNounAccent ?? this.headNounAccent,
    );
  }

  @override
  Int01Theme lerp(covariant Int01Theme? other, double t) {
    if (other == null) {
      return this;
    }
    return Int01Theme(
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      defaultBorder: Color.lerp(defaultBorder, other.defaultBorder, t)!,
      selectedFill: Color.lerp(selectedFill, other.selectedFill, t)!,
      selectedBorder: Color.lerp(selectedBorder, other.selectedBorder, t)!,
      correctFill: Color.lerp(correctFill, other.correctFill, t)!,
      correctBorder: Color.lerp(correctBorder, other.correctBorder, t)!,
      incorrectFill: Color.lerp(incorrectFill, other.incorrectFill, t)!,
      incorrectBorder: Color.lerp(incorrectBorder, other.incorrectBorder, t)!,
      disabledFill: Color.lerp(disabledFill, other.disabledFill, t)!,
      disabledForeground:
          Color.lerp(disabledForeground, other.disabledForeground, t)!,
      quantityAccent: Color.lerp(quantityAccent, other.quantityAccent, t)!,
      adjectiveAccent: Color.lerp(adjectiveAccent, other.adjectiveAccent, t)!,
      headNounAccent: Color.lerp(headNounAccent, other.headNounAccent, t)!,
    );
  }
}

