import 'dart:convert';

import 'package:flutter/services.dart';

import 'interaction_spec.dart';

class LockedLessonContract {
  const LockedLessonContract({
    required this.schemaVersion,
    required this.contractStatus,
    required this.lessonId,
    required this.motion,
    required this.interaction,
    required this.flutter,
  });

  final String schemaVersion;
  final String contractStatus;
  final String lessonId;
  final ShowTokensMotionSpec motion;
  final InteractionSpec interaction;
  final FlutterContractSpec flutter;

  factory LockedLessonContract.fromJson(Map<String, Object?> json) {
    final LockedLessonContract contract = LockedLessonContract(
      schemaVersion: _string(json, 'schemaVersion'),
      contractStatus: _string(json, 'contractStatus'),
      lessonId: _string(json, 'lessonId'),
      motion: ShowTokensMotionSpec.fromJson(_map(json, 'motion')),
      interaction: InteractionSpec.fromJson(json),
      flutter: FlutterContractSpec.fromJson(_map(json, 'flutter')),
    );
    contract.validateOrThrow();
    return contract;
  }

  static Future<LockedLessonContract> loadFromAsset({
    AssetBundle? bundle,
    String path =
        'packages/ai_english_int01/assets/interactions/CORE-E1-W1-L1_INT-01_v1.0.json',
  }) async {
    final String source = await (bundle ?? rootBundle).loadString(path);
    final Object? decoded = jsonDecode(source);
    if (decoded is! Map<String, Object?>) {
      throw const InteractionSpecException(
        'Locked lesson contract root must be a JSON object',
      );
    }
    return LockedLessonContract.fromJson(decoded);
  }

  void validateOrThrow() {
    if (schemaVersion != '1.0' || contractStatus != 'APPROVED_LOCKED') {
      throw const InteractionSpecException(
        'Only the APPROVED_LOCKED v1.0 contract is accepted',
      );
    }
    if (lessonId != interaction.lessonId) {
      throw const InteractionSpecException(
        'Top-level lessonId must match interaction.lessonId',
      );
    }
    if (motion.frameRate != 30 ||
        flutter.resumeAtMs != interaction.pauseAtMs ||
        flutter.positiveToleranceMs != 50) {
      throw const InteractionSpecException(
        'Locked 30 fps / 50000 ms / +50 ms values changed',
      );
    }
  }
}

class ShowTokensMotionSpec {
  const ShowTokensMotionSpec({
    required this.frameRate,
    required this.easing,
    required this.translateYPx,
    required this.focusPulse,
    required this.haloLeadFrames,
    required this.events,
    required this.completeAtMs,
  });

  final int frameRate;
  final String easing;
  final double translateYPx;
  final List<double> focusPulse;
  final int haloLeadFrames;
  final List<ShowTokenEvent> events;
  final int completeAtMs;

  int get haloLeadMs => (haloLeadFrames * 1000 / frameRate).round();

  factory ShowTokensMotionSpec.fromJson(Map<String, Object?> json) {
    final List<Object?> rawEvents = _list(json, 'events');
    final List<ShowTokenEvent> tokenEvents = <ShowTokenEvent>[];
    int? completeAtMs;
    for (final Object? rawEvent in rawEvents) {
      if (rawEvent is! Map<String, Object?>) {
        throw const InteractionSpecException('motion event must be an object');
      }
      if (rawEvent['state'] == 'COMPLETE') {
        completeAtMs = _int(rawEvent, 'timeMs');
      } else {
        tokenEvents.add(ShowTokenEvent.fromJson(rawEvent));
      }
    }
    return ShowTokensMotionSpec(
      frameRate: _int(json, 'frameRate'),
      easing: _string(json, 'easing'),
      translateYPx: _number(json, 'translateYPx'),
      focusPulse: _list(json, 'focusPulse')
          .map((Object? item) {
            if (item is num) {
              return item.toDouble();
            }
            throw const InteractionSpecException(
              'focusPulse values must be numbers',
            );
          })
          .toList(growable: false),
      haloLeadFrames: _int(json, 'haloLeadFrames'),
      events: List<ShowTokenEvent>.unmodifiable(tokenEvents),
      completeAtMs: completeAtMs ??
          (throw const InteractionSpecException('COMPLETE event is required')),
    );
  }
}

class ShowTokenEvent {
  const ShowTokenEvent({
    required this.timeMs,
    required this.frame,
    required this.role,
    required this.tokenId,
    required this.text,
  });

  final int timeMs;
  final int frame;
  final TokenRole role;
  final String tokenId;
  final String text;

  factory ShowTokenEvent.fromJson(Map<String, Object?> json) {
    return ShowTokenEvent(
      timeMs: _int(json, 'timeMs'),
      frame: _int(json, 'frame'),
      role: TokenRole.parse(json['role']),
      tokenId: _string(json, 'tokenId'),
      text: _string(json, 'text'),
    );
  }
}

class FlutterContractSpec {
  const FlutterContractSpec({
    required this.designWidth,
    required this.designHeight,
    required this.safeTopPx,
    required this.safeBottomPx,
    required this.minimumTouchTargetDp,
    required this.resumeAtMs,
    required this.positiveToleranceMs,
    required this.reducedMotionOpacityMs,
  });

  final int designWidth;
  final int designHeight;
  final int safeTopPx;
  final int safeBottomPx;
  final double minimumTouchTargetDp;
  final int resumeAtMs;
  final int positiveToleranceMs;
  final int reducedMotionOpacityMs;

  factory FlutterContractSpec.fromJson(Map<String, Object?> json) {
    final Map<String, Object?> designSize = _map(json, 'designSize');
    final Map<String, Object?> safeArea = _map(json, 'safeAreaPx');
    final Map<String, Object?> touchTarget =
        _map(json, 'minimumTouchTargetDp');
    final Map<String, Object?> persistence =
        _map(json, 'statePersistence');
    final Map<String, Object?> reducedMotion = _map(json, 'reducedMotion');
    return FlutterContractSpec(
      designWidth: _int(designSize, 'width'),
      designHeight: _int(designSize, 'height'),
      safeTopPx: _int(safeArea, 'top'),
      safeBottomPx: _int(safeArea, 'bottom'),
      minimumTouchTargetDp: _number(touchTarget, 'width'),
      resumeAtMs: _int(persistence, 'resumeAtMs'),
      positiveToleranceMs: _int(persistence, 'positiveToleranceMs'),
      reducedMotionOpacityMs: _int(reducedMotion, 'opacityDurationMs'),
    );
  }
}

Map<String, Object?> _map(Map<String, Object?> json, String key) {
  final Object? value = json[key];
  if (value is Map<String, Object?>) {
    return value;
  }
  throw InteractionSpecException('$key must be an object');
}

List<Object?> _list(Map<String, Object?> json, String key) {
  final Object? value = json[key];
  if (value is List<Object?>) {
    return value;
  }
  throw InteractionSpecException('$key must be an array');
}

String _string(Map<String, Object?> json, String key) {
  final Object? value = json[key];
  if (value is String && value.isNotEmpty) {
    return value;
  }
  throw InteractionSpecException('$key must be a non-empty string');
}

int _int(Map<String, Object?> json, String key) {
  final Object? value = json[key];
  if (value is int) {
    return value;
  }
  throw InteractionSpecException('$key must be an integer');
}

double _number(Map<String, Object?> json, String key) {
  final Object? value = json[key];
  if (value is num) {
    return value.toDouble();
  }
  throw InteractionSpecException('$key must be a number');
}
