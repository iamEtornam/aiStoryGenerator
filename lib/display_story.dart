import 'dart:io';

import 'package:ai_story_generator/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deepgram_speech_to_text/deepgram_speech_to_text.dart';
import 'package:expandable_fab_menu/expandable_fab_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

final apiKey = String.fromEnvironment('DEEPGRAM_API_KEY');

class DisplayStory extends StatefulWidget {
  const DisplayStory({super.key, required this.story, required this.category});

  final String story;
  final String category;

  @override
  State<DisplayStory> createState() => _DisplayStoryState();
}

class _DisplayStoryState extends State<DisplayStory> {
  final player = AudioPlayer();

  final deepgramTTS = Deepgram(apiKey, baseQueryParams: {
    'model': 'aura-asteria-en',
    'encoding': "linear16",
    'container': "wav",
  });

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Markdown(
              padding: EdgeInsets.all(16),
              selectable: true,
              data: widget.story,
              styleSheetTheme: MarkdownStyleSheetBaseTheme.platform,
              styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
      floatingActionButton: ExpandableFabMenu(
        animatedIcon: AnimatedIcons.menu_close,
        onPress: () {},
        animatedIconTheme: const IconThemeData(size: 22.0, color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.primary,
        overlayColor: Colors.black,
        overlayOpacity: 0.7,
        children: [
          ExpandableFabMenuItem(
            child: const Icon(Icons.save, color: Colors.white),
            title: "Save story",
            titleColor: Colors.white,
            subtitle: "Save a copy of the story",
            subTitleColor: Colors.white,
            backgroundColor: Colors.amber,
            onTap: () => saveToDataBase(widget.story),
          ),
          ExpandableFabMenuItem(
            child: Icon(!player.playing ? Icons.play_arrow : Icons.stop,
                color: Colors.white),
            title: "Read aloud",
            titleColor: Colors.white,
            subtitle: "Read the story aloud",
            subTitleColor: Colors.white,
            backgroundColor: Colors.green,
            onTap: () => speakFromText(widget.story),
          ),
          ExpandableFabMenuItem(
            child: const Icon(Icons.share, color: Colors.white),
            title: "Share story",
            titleColor: Colors.white,
            subtitle: "Share the story",
            subTitleColor: Colors.white,
            backgroundColor: Colors.blue,
            onTap: () => Share.share(widget.story),
          ),
        ],
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> saveToDataBase(String story) async {
    await db.collection('stories').add({
      'category': widget.category,
      'story': widget.story,
      'publish': false,
      'user_id': FirebaseAuth.instance.currentUser!.uid,
      'created_at': FieldValue.serverTimestamp(),
      'updated_at': FieldValue.serverTimestamp(),
    }).then((value) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Story saved successfully',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
    });
  }

  void speakFromText(String text) async {
    if (player.playing) {
      await player.stop();
      return;
    }

    if (kIsWeb) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Speech synthesis is not supported on web',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      return;
    }
    final res = await deepgramTTS.speakFromText(
      text.trim(),
    );
    int random = DateTime.now().millisecondsSinceEpoch;
    final path = await saveDataToFile("$random.wav", res.data);
    AudioSource source = AudioSource.file(path);
    player.setAudioSource(source);
    await player.play();
  }

  Future<String> getLocalFilePath(String filename) async {
    final appDocDir = await getTemporaryDirectory();
    final appDocPath = appDocDir.path;
    return '$appDocPath/$filename';
  }

  Future<String> saveDataToFile(String filename, Uint8List data) async {
    final path = await getLocalFilePath(filename);
    await File(path).writeAsBytes(data);
    return path;
  }
}
