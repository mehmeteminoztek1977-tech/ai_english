enum TokenRole {
  quantity('Quantity'),
  adjective('Adjective'),
  headNoun('HeadNoun');

  const TokenRole(this.jsonValue);

  final String jsonValue;

  static TokenRole parse(Object? value) {
    return TokenRole.values.firstWhere(
      (TokenRole role) => role.jsonValue == value,
      orElse: () => throw InteractionSpecException(
        'Unsupported token role: $value',
      ),
    );
  }
}

class InteractionSpecException implements Exception {
  const InteractionSpecException(this.message);

  final String message;

  @override
  String toString() => 'InteractionSpecException: $message';
}

class InteractionSpec {
  const InteractionSpec({
    required this.schemaVersion,
    required this.interactionId,
    required this.lessonId,
    required this.trigger,
    required this.uiConfig,
    required this.tokens,
    required this.validation,
    required this.accessibility,
  });

  final String schemaVersion;
  final String interactionId;
  final String lessonId;
  final InteractionTrigger trigger;
  final InteractionUiConfig uiConfig;
  final List<TokenWord> tokens;
  final ValidationRules validation;
  final AccessibilitySpec accessibility;

  factory InteractionSpec.fromJson(Map<String, Object?> json) {
    final Object? nested = json['interaction'];
    final Map<String, Object?> source = nested is Map<String, Object?>
        ? nested
        : json;

    final InteractionSpec spec = InteractionSpec(
      schemaVersion: _requiredString(source, 'schemaVersion'),
      interactionId: _requiredString(source, 'interactionId'),
      lessonId: _requiredString(source, 'lessonId'),
      trigger: InteractionTrigger.fromJson(
        _requiredMap(source, 'trigger'),
      ),
      uiConfig: InteractionUiConfig.fromJson(
        _requiredMap(source, 'uiConfig'),
      ),
      tokens: _requiredList(source, 'tokens')
          .map(
            (Object? item) => TokenWord.fromJson(_asMap(item, 'tokens item')),
          )
          .toList(growable: false),
      validation: ValidationRules.fromJson(
        _requiredMap(source, 'validation'),
      ),
      accessibility: AccessibilitySpec.fromJson(
        _requiredMap(source, 'accessibility'),
      ),
    );
    spec.validateOrThrow();
    return spec;
  }

  int get pauseAtMs => trigger.pauseAtMs;

  int? get timeoutMs => trigger.timeoutMs;

  void validateOrThrow() {
    if (schemaVersion != '1.0') {
      throw InteractionSpecException(
        'schemaVersion must be 1.0, got $schemaVersion',
      );
    }
    if (interactionId.isEmpty || lessonId.isEmpty) {
      throw const InteractionSpecException(
        'interactionId and lessonId must not be empty',
      );
    }
    if (trigger.timeUnit != 'milliseconds' || trigger.pauseAtMs < 0) {
      throw const InteractionSpecException(
        'trigger must use milliseconds and a non-negative pauseAt',
      );
    }
    if (uiConfig.selectionModel != 'single') {
      throw const InteractionSpecException(
        'INT-01 supports only the single selection model',
      );
    }
    if (tokens.isEmpty) {
      throw const InteractionSpecException('tokens must not be empty');
    }

    final Set<String> ids = tokens.map((TokenWord token) => token.id).toSet();
    if (ids.length != tokens.length) {
      throw const InteractionSpecException('token ids must be unique');
    }
    if (!ids.contains(validation.correctId)) {
      throw const InteractionSpecException(
        'validation.correctId must reference an existing token',
      );
    }
    if (validation.maxAttempts <= 0) {
      throw const InteractionSpecException('maxAttempts must be positive');
    }
    if (accessibility.language.isEmpty ||
        accessibility.screenReaderLabel.isEmpty) {
      throw const InteractionSpecException(
        'accessibility language and label are required',
      );
    }
  }

  Map<String, Object?> toJson() => <String, Object?>{
        'schemaVersion': schemaVersion,
        'interactionId': interactionId,
        'lessonId': lessonId,
        'trigger': trigger.toJson(),
        'uiConfig': uiConfig.toJson(),
        'tokens': tokens.map((TokenWord token) => token.toJson()).toList(),
        'validation': validation.toJson(),
        'accessibility': accessibility.toJson(),
      };
}

class InteractionTrigger {
  const InteractionTrigger({
    required this.timeUnit,
    required this.pauseAtMs,
    required this.timeoutMs,
  });

  final String timeUnit;
  final int pauseAtMs;
  final int? timeoutMs;

  factory InteractionTrigger.fromJson(Map<String, Object?> json) {
    return InteractionTrigger(
      timeUnit: _requiredString(json, 'timeUnit'),
      pauseAtMs: _requiredInt(json, 'pauseAt'),
      timeoutMs: _nullableInt(json, 'timeoutMs'),
    );
  }

  Map<String, Object?> toJson() => <String, Object?>{
        'timeUnit': timeUnit,
        'pauseAt': pauseAtMs,
        'timeoutMs': timeoutMs,
      };
}

class InteractionUiConfig {
  const InteractionUiConfig({
    required this.selectionModel,
    required this.allowDeselect,
  });

  final String selectionModel;
  final bool allowDeselect;

  factory InteractionUiConfig.fromJson(Map<String, Object?> json) {
    return InteractionUiConfig(
      selectionModel: _requiredString(json, 'selectionModel'),
      allowDeselect: _requiredBool(json, 'allowDeselect'),
    );
  }

  Map<String, Object?> toJson() => <String, Object?>{
        'selectionModel': selectionModel,
        'allowDeselect': allowDeselect,
      };
}

class TokenWord {
  const TokenWord({
    required this.id,
    required this.role,
    required this.text,
  });

  final String id;
  final TokenRole role;
  final String text;

  factory TokenWord.fromJson(Map<String, Object?> json) {
    return TokenWord(
      id: _requiredString(json, 'id'),
      role: TokenRole.parse(json['role']),
      text: _requiredString(json, 'text'),
    );
  }

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'role': role.jsonValue,
        'text': text,
      };
}

class ValidationRules {
  const ValidationRules({
    required this.correctId,
    required this.maxAttempts,
    required this.onCorrect,
    required this.onFirstFail,
    required this.onSecondFail,
    required this.onThirdFail,
  });

  final String correctId;
  final int maxAttempts;
  final String onCorrect;
  final String onFirstFail;
  final String onSecondFail;
  final String onThirdFail;

  factory ValidationRules.fromJson(Map<String, Object?> json) {
    return ValidationRules(
      correctId: _requiredString(json, 'correctId'),
      maxAttempts: _requiredInt(json, 'maxAttempts'),
      onCorrect: _requiredString(json, 'onCorrect'),
      onFirstFail: _requiredString(json, 'onFirstFail'),
      onSecondFail: _requiredString(json, 'onSecondFail'),
      onThirdFail: _requiredString(json, 'onThirdFail'),
    );
  }

  Map<String, Object?> toJson() => <String, Object?>{
        'correctId': correctId,
        'maxAttempts': maxAttempts,
        'onCorrect': onCorrect,
        'onFirstFail': onFirstFail,
        'onSecondFail': onSecondFail,
        'onThirdFail': onThirdFail,
      };
}

class AccessibilitySpec {
  const AccessibilitySpec({
    required this.language,
    required this.screenReaderLabel,
  });

  final String language;
  final String screenReaderLabel;

  factory AccessibilitySpec.fromJson(Map<String, Object?> json) {
    return AccessibilitySpec(
      language: _requiredString(json, 'language'),
      screenReaderLabel: _requiredString(json, 'screenReaderLabel'),
    );
  }

  Map<String, Object?> toJson() => <String, Object?>{
        'language': language,
        'screenReaderLabel': screenReaderLabel,
      };
}

Map<String, Object?> _requiredMap(
  Map<String, Object?> json,
  String key,
) {
  return _asMap(json[key], key);
}

Map<String, Object?> _asMap(Object? value, String name) {
  if (value is Map<String, Object?>) {
    return value;
  }
  throw InteractionSpecException('$name must be a JSON object');
}

List<Object?> _requiredList(Map<String, Object?> json, String key) {
  final Object? value = json[key];
  if (value is List<Object?>) {
    return value;
  }
  throw InteractionSpecException('$key must be a JSON array');
}

String _requiredString(Map<String, Object?> json, String key) {
  final Object? value = json[key];
  if (value is String && value.isNotEmpty) {
    return value;
  }
  throw InteractionSpecException('$key must be a non-empty string');
}

int _requiredInt(Map<String, Object?> json, String key) {
  final Object? value = json[key];
  if (value is int) {
    return value;
  }
  throw InteractionSpecException('$key must be an integer');
}

int? _nullableInt(Map<String, Object?> json, String key) {
  final Object? value = json[key];
  if (value == null || value is int) {
    return value as int?;
  }
  throw InteractionSpecException('$key must be an integer or null');
}

bool _requiredBool(Map<String, Object?> json, String key) {
  final Object? value = json[key];
  if (value is bool) {
    return value;
  }
  throw InteractionSpecException('$key must be a boolean');
}

