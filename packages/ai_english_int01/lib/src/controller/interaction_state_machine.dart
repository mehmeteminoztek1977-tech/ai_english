import '../model/interaction_spec.dart';

enum InteractionPhase {
  idle,
  awaitingSelection,
  incorrectFeedback,
  correctFeedback,
  solution,
  resolved,
}

class InteractionState {
  const InteractionState({
    required this.phase,
    required this.attemptsUsed,
    this.selectedId,
    this.lastSubmittedId,
    this.flowAction,
  });

  const InteractionState.initial()
      : phase = InteractionPhase.idle,
        attemptsUsed = 0,
        selectedId = null,
        lastSubmittedId = null,
        flowAction = null;

  final InteractionPhase phase;
  final int attemptsUsed;
  final String? selectedId;
  final String? lastSubmittedId;
  final String? flowAction;

  bool get isTriggered => phase != InteractionPhase.idle;

  bool get isResolved => phase == InteractionPhase.resolved;

  factory InteractionState.fromJson(Map<String, Object?> json) {
    final Object? phaseValue = json['phase'];
    final InteractionPhase phase = InteractionPhase.values.firstWhere(
      (InteractionPhase item) => item.name == phaseValue,
      orElse: () => throw FormatException('Unknown phase: $phaseValue'),
    );
    final Object? attempts = json['attemptsUsed'];
    if (attempts is! int || attempts < 0) {
      throw const FormatException('attemptsUsed must be non-negative');
    }
    return InteractionState(
      phase: phase,
      attemptsUsed: attempts,
      selectedId: _nullableString(json, 'selectedId'),
      lastSubmittedId: _nullableString(json, 'lastSubmittedId'),
      flowAction: _nullableString(json, 'flowAction'),
    );
  }

  Map<String, Object?> toJson() => <String, Object?>{
        'phase': phase.name,
        'attemptsUsed': attemptsUsed,
        'selectedId': selectedId,
        'lastSubmittedId': lastSubmittedId,
        'flowAction': flowAction,
      };

  InteractionState copyWith({
    InteractionPhase? phase,
    int? attemptsUsed,
    String? selectedId,
    bool clearSelectedId = false,
    String? lastSubmittedId,
    bool clearLastSubmittedId = false,
    String? flowAction,
    bool clearFlowAction = false,
  }) {
    return InteractionState(
      phase: phase ?? this.phase,
      attemptsUsed: attemptsUsed ?? this.attemptsUsed,
      selectedId:
          clearSelectedId ? null : (selectedId ?? this.selectedId),
      lastSubmittedId: clearLastSubmittedId
          ? null
          : (lastSubmittedId ?? this.lastSubmittedId),
      flowAction: clearFlowAction ? null : (flowAction ?? this.flowAction),
    );
  }
}

String? _nullableString(Map<String, Object?> json, String key) {
  final Object? value = json[key];
  if (value == null || value is String) {
    return value as String?;
  }
  throw FormatException('$key must be a string or null');
}

class InteractionStateMachine {
  InteractionStateMachine({
    required this.spec,
    InteractionState initialState = const InteractionState.initial(),
  }) : _state = initialState {
    _validateRestoredState();
  }

  final InteractionSpec spec;
  InteractionState _state;

  InteractionState get state => _state;

  int get attemptsRemaining => spec.validation.maxAttempts - _state.attemptsUsed;

  void trigger() {
    if (_state.phase != InteractionPhase.idle) {
      return;
    }
    _state = const InteractionState(
      phase: InteractionPhase.awaitingSelection,
      attemptsUsed: 0,
    );
  }

  void select(String tokenId) {
    if (_state.phase != InteractionPhase.awaitingSelection) {
      return;
    }
    _requireKnownToken(tokenId);
    if (_state.selectedId == tokenId && spec.uiConfig.allowDeselect) {
      _state = _state.copyWith(clearSelectedId: true);
      return;
    }
    _state = _state.copyWith(selectedId: tokenId);
  }

  void submit() {
    if (_state.phase != InteractionPhase.awaitingSelection ||
        _state.selectedId == null) {
      return;
    }

    final String submittedId = _state.selectedId!;
    final int attempts = _state.attemptsUsed + 1;
    if (submittedId == spec.validation.correctId) {
      _state = InteractionState(
        phase: InteractionPhase.correctFeedback,
        attemptsUsed: attempts,
        selectedId: submittedId,
        lastSubmittedId: submittedId,
        flowAction: spec.validation.onCorrect,
      );
      return;
    }

    if (attempts >= spec.validation.maxAttempts) {
      _state = InteractionState(
        phase: InteractionPhase.solution,
        attemptsUsed: attempts,
        selectedId: submittedId,
        lastSubmittedId: submittedId,
        flowAction: spec.validation.onThirdFail,
      );
      return;
    }

    final String action = attempts == 1
        ? spec.validation.onFirstFail
        : spec.validation.onSecondFail;
    _state = InteractionState(
      phase: InteractionPhase.incorrectFeedback,
      attemptsUsed: attempts,
      selectedId: submittedId,
      lastSubmittedId: submittedId,
      flowAction: action,
    );
  }

  void acknowledgeIncorrectFeedback() {
    if (_state.phase != InteractionPhase.incorrectFeedback) {
      return;
    }
    _state = _state.copyWith(
      phase: InteractionPhase.awaitingSelection,
      clearSelectedId: true,
      clearLastSubmittedId: true,
      clearFlowAction: true,
    );
  }

  void resolve() {
    if (_state.phase != InteractionPhase.correctFeedback &&
        _state.phase != InteractionPhase.solution) {
      return;
    }
    _state = _state.copyWith(
      phase: InteractionPhase.resolved,
      clearSelectedId: true,
    );
  }

  void reset() {
    _state = const InteractionState.initial();
  }

  void _requireKnownToken(String tokenId) {
    if (!spec.tokens.any((TokenWord token) => token.id == tokenId)) {
      throw ArgumentError.value(tokenId, 'tokenId', 'Unknown token');
    }
  }

  void _validateRestoredState() {
    if (_state.attemptsUsed > spec.validation.maxAttempts) {
      throw const FormatException('Restored attempts exceed maxAttempts');
    }
    if (_state.selectedId != null) {
      _requireKnownToken(_state.selectedId!);
    }
    if (_state.lastSubmittedId != null) {
      _requireKnownToken(_state.lastSubmittedId!);
    }
  }
}
