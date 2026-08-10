class InteractionSpec {
  final String interactionId;
  final String lessonId;
  final int pauseAtMs;
  final int? timeoutMs;
  final List<TokenWord> tokens;
  final ValidationRules validation;

  InteractionSpec({
    required this.interactionId,
    required this.lessonId,
    required this.pauseAtMs,
    this.timeoutMs,
    required this.tokens,
    required this.validation,
  });
}

class TokenWord {
  final String id;
  final String role; // Quantity, Adjective, HeadNoun
  final String text;
  
  TokenWord({required this.id, required this.role, required this.text});
}

class ValidationRules {
  final String correctId;
  final int maxAttempts;

  ValidationRules({required this.correctId, required this.maxAttempts});
}