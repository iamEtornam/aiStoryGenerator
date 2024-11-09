import 'package:ai_story_generator/home.dart';
import 'package:ai_story_generator/login.dart';
import 'package:ai_story_generator/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme =
        Typography.material2018(platform: defaultTargetPlatform).white.copyWith(
              bodyLarge: const TextStyle(color: Colors.black),
              bodyMedium: const TextStyle(color: Colors.black),
              bodySmall: const TextStyle(
                color: Colors.black,
              ),
              displayLarge: const TextStyle(
                color: Colors.black,
              ),
              displayMedium: const TextStyle(color: Colors.black),
              displaySmall: const TextStyle(color: Colors.black),
              headlineMedium: const TextStyle(color: Colors.black),
              headlineSmall: const TextStyle(color: Colors.black),
              titleLarge: const TextStyle(color: Colors.black),
              titleMedium: const TextStyle(color: Colors.black),
              titleSmall: const TextStyle(color: Colors.black),
              labelSmall: const TextStyle(color: Colors.black),
              labelLarge: const TextStyle(color: Colors.black),
            );
    final MaterialTheme materialTheme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: materialTheme.light(context),
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return Home();
            }
            return Login();
          }),
    );
  }
}
