import 'package:ai_story_generator/app.dart';
import 'package:ai_story_generator/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  assert(const String.fromEnvironment('GOOGLE_API_KEY') != "",
      'GOOGLE_API_KEY is not set');
  assert(const String.fromEnvironment('DEEPGRAM_API_KEY') != "",
      'DEEPGRAM_API_KEY is not set');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}
