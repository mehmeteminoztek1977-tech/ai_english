import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:ai_english_int01/ai_english_int01.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/lesson_screen.dart';

void main() {
  runApp(const AIEnglishApp());
}

class AIEnglishApp extends StatefulWidget {
  const AIEnglishApp({Key? key}) : super(key: key);

  @override
  State<AIEnglishApp> createState() => _AIEnglishAppState();
}

class _AIEnglishAppState extends State<AIEnglishApp> {
  VideoPlayerController? _videoController;
  InteractionStateStore? _cloudStateStore;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeDependencies();
  }

  Future<void> _initializeDependencies() async {
    // Initialize VideoPlayerController
    final controller = VideoPlayerController.networkUrl(
      Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
      // NOTE: The 'bee.mp4' video is very short (around 5 seconds).
      // For production or if kDebugMode bypass is removed, a video longer than
      // 50 seconds (50000 ms) is required to meet the INT-01 contract's pause point.
    );
    await controller.initialize();
    _videoController = controller;

    // Initialize Cloud State Store (using SharedPreferences as per integration report)
    final prefs = await SharedPreferences.getInstance();
    _cloudStateStore = SharedPreferencesInteractionStateStore(prefs);

    if (mounted) {
      setState(() {
        _isInitialized = true;
      });
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI English',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: _isInitialized
          ? LessonScreen(
              videoController: _videoController!,
              cloudStateStore: _cloudStateStore!,
              autoPlay: true, // Start playing video automatically
              disposeVideoController: true, // This screen owns the controller
              onInt01FlowAction: (action) {
                debugPrint('Lesson Flow Action: $action');
                // Handle flow actions, e.g., navigate away after 'SUCCESS'
              },
            )
          : const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
}