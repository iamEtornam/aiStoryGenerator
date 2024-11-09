import 'dart:async';

import 'package:ai_story_generator/display_story.dart';
import 'package:ai_story_generator/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class DisplayQuestions extends StatefulWidget {
  const DisplayQuestions(
      {super.key, required this.questions, required this.quizType});

  final List<Map<String, String>> questions;
  final String quizType;

  @override
  State<DisplayQuestions> createState() => _DisplayQuestionsState();
}

class _DisplayQuestionsState extends State<DisplayQuestions> {
  int currentQuestionIndex = 0;
  Timer? _timer;
  int _timeLeft = 15;
  List<String> selectedChoices = [];
  bool allDone = false;
  String? generatedStory;
  bool isGenerating = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer?.cancel();
    _timeLeft = 15;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _timeLeft--;
        if (_timeLeft <= 0) {
          _timer?.cancel();
          nextQuestion();
        }
      });
    });
  }

  void nextQuestion([String? choice]) async {
    if (choice != null) {
      selectedChoices.add(choice);
    }

    if (currentQuestionIndex < widget.questions.length - 1) {
      currentQuestionIndex++;
      startTimer();
    } else {
      setState(() {
        allDone = true;
        isGenerating = true;
      });
      // All questions answered, generate the story
      await generateStory(context);
    }
  }

  Future<void> generateStory(BuildContext context) async {
    String prompt =
        '''Write a creative and engaging story based on the user’s personality and preferences. The user has selected the following preferences: $selectedChoices. Using these choices as inspiration, craft a story that captures the essence of these preferences and what they reveal about the user.

Begin with an interesting setting that reflects these choices and create a protagonist inspired by these traits. Develop a plot that explores themes or scenarios where these preferences play a key role, showing how they influence the protagonist’s decisions, relationships, and personal journey.

Keep the tone [choose any: lighthearted, mysterious, adventurous, etc.], and aim for a story that feels meaningful or thought-provoking. Make sure the story has a clear beginning, middle, and end, leaving the user with a memorable impression.''';

    try {
      final model = GenerativeModel(
          model: 'gemini-1.5-flash-latest',
          apiKey: String.fromEnvironment('GOOGLE_API_KEY'));

      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);
      if (response.text != null) {
        setState(() {
          generatedStory = response.text;
          isGenerating = false;
        });
        Future.delayed(Duration(seconds: 1), () {
          if (!context.mounted) return;
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => DisplayStory(
                    story: generatedStory!,
                    category: widget.quizType,
                  )));
        });
      }
    } catch (e) {
      setState(() {
        isGenerating = false;
      });
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error generating story: $e'),
        ),
      );
    } finally {
      setState(() {
        isGenerating = false;
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${widget.quizType} Question ${currentQuestionIndex + 1}/${widget.questions.length}'),
      ),
      body: isGenerating
          ? LoadingWidget()
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Text("Time left: $_timeLeft seconds",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.red)),
                    SizedBox(height: 20),
                    Text(
                      '${widget.questions[currentQuestionIndex]['this']} vs ${widget.questions[currentQuestionIndex]['that']}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          children: [
                            questionCard(context,
                                label: widget.questions[currentQuestionIndex]
                                    ['this']!, onTap: () {
                              _timer?.cancel();
                              nextQuestion(widget
                                  .questions[currentQuestionIndex]['this']);
                            }),
                            questionCard(context,
                                label: widget.questions[currentQuestionIndex]
                                    ['that']!, onTap: () {
                              _timer?.cancel();
                              nextQuestion(widget
                                  .questions[currentQuestionIndex]['that']);
                            }),
                          ]),
                    ),
                    SizedBox(height: 20),
                    if (allDone)
                      TextButton(
                          onPressed: () {
                            _timer?.cancel();
                            if (generatedStory == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Story not generated yet'),
                                ),
                              );
                              return;
                            }
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => DisplayStory(
                                          story: generatedStory!,
                                          category: widget.quizType,
                                        )));
                          },
                          child: Text('Generate Story',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary)))
                  ],
                ),
              ),
            ),
    );
  }
}

Widget questionCard(BuildContext context,
    {required String label, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: () {
      HapticFeedback.mediumImpact();
      onTap();
    },
    child: Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ),
  );
}
