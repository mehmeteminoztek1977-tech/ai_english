import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ai_english/main.dart';
import 'package:ai_english/screens/lesson_screen.dart'; // LessonScreen'i bulmak için eklendi
import 'dart:convert'; // For jsonEncode

void main() {
  // Flutter binding'in platform kanalı taklitleri için başlatıldığından emin olun
  TestWidgetsFlutterBinding.ensureInitialized();

  // video_player için MethodChannel'ı taklit et
  const MethodChannel videoPlayerChannel = MethodChannel('flutter.io/videoPlayer');
  videoPlayerChannel.setMockMethodCallHandler((MethodCall methodCall) async {
    switch (methodCall.method) {
      case 'initialize':
        // Başarılı bir başlatmayı ve bazı video özelliklerini simüle et
        return <String, dynamic>{
          'duration': 60000, // Örnek süre milisaniye cinsinden (60 saniye)
          'width': 1280,    // Örnek genişlik
          'height': 720,    // Örnek yükseklik
          'playbackSpeed': 1.0,
          'volume': 1.0,
          'isLooping': false,
        };
      case 'create':
        return {'textureId': 1}; // Video oynatıcı yüzeyi için sahte bir texture ID döndür
      case 'setVolume':
      case 'setPlaybackSpeed':
      case 'play':
      case 'pause':
      case 'seekTo':
      case 'dispose':
        return null; // Bu metodlar genellikle bir değer döndürmez
      default:
        // Beklenmeyen diğer metod çağrıları için bir hata fırlat
        throw MissingPluginException('No mock handler for ${methodCall.method}');
    }
  });

  // shared_preferences için MethodChannel'ı taklit et
  const MethodChannel sharedPreferencesChannel = MethodChannel('plugins.flutter.io/shared_preferences');
  sharedPreferencesChannel.setMockMethodCallHandler((MethodCall methodCall) async {
    if (methodCall.method == 'getAll') {
      return <String, Object>{}; // Başlangıç tercihleri için boş bir harita döndür
    }
    return null;
  });

  // rootBundle için MethodChannel'ı taklit et (LockedLessonContract.loadFromAsset için)
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMessageHandler(
    'flutter/assets',
    (ByteData? message) async {
      if (message == null) {
        return null;
      }
      final String? key = const StringCodec().decodeMessage(message);
      if (key != null && key.endsWith('locked_lesson_contract.json')) {
        final String mockJson = jsonEncode({
          "interaction": {
            "schemaVersion": "1.0.0",
            "interactionId": "INT-01",
            "lessonId": "CORE-E1-W1-L1",
            "trigger": {
              "positionMs": 50000
            },
            "uiConfig": {
              "allowDeselect": true
            },
            "tokens": [
              {"id": "t1", "role": "quantity", "text": "two"},
              {"id": "t2", "role": "adjective", "text": "blue"},
              {"id": "t3", "role": "headNoun", "text": "books"}
            ],
            "validation": {
              "correctId": "t3",
              "maxAttempts": 3,
              "onFirstFail": "HINT_1",
              "onSecondFail": "HINT_2",
              "onThirdFail": "SOLUTION",
              "onCorrect": "SUCCESS"
            },
            "accessibility": {
              "screenReaderLabel": "Select the head noun for two blue books",
              "language": "en"
            }
          },
          "flutter": {
            "designWidth": 1080, "designHeight": 1920, "safeTopPx": 120, "safeBottomPx": 120,
            "minimumTouchTargetDp": 48.0, "resumeAtMs": 50050, "positiveToleranceMs": 50,
            "reducedMotionOpacityMs": 200
          }
        });
        return const Utf8Codec().encode(mockJson).buffer.asByteData();
      }
      return null; // Diğer assetler için null döndür
    },
  );

  testWidgets('AI English smoke test', (WidgetTester tester) async {    
    await tester.pumpWidget(const AIEnglishApp());
    // _AIEnglishAppState'deki asenkron başlatmanın tamamlanmasını bekle
    await tester.pumpAndSettle();

    // AIEnglishApp'in render edildiğini doğrula
    expect(find.byType(AIEnglishApp), findsOneWidget);
    // Başlatmadan sonra LessonScreen'in render edildiğini doğrula
    expect(find.byType(LessonScreen), findsOneWidget);
  });
}