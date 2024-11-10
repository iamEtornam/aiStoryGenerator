import 'package:ai_story_generator/display_questions.dart';
import 'package:ai_story_generator/display_story.dart';
import 'package:ai_story_generator/login.dart';
import 'package:ai_story_generator/questions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final db = FirebaseFirestore.instance;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ai story generator'),
          actions: [
            IconButton(
                onPressed: () async {
                  FirebaseAuth.instance.signOut().then((_) {
                    if (!context.mounted) return;
                    Navigator.of(context).pushAndRemoveUntil(
                      CupertinoPageRoute(builder: (context) => Login()),
                      (route) => false,
                    );
                  });
                },
                icon: Icon(Icons.logout_rounded))
          ],
        ),
        body: GridView.count(
            padding: EdgeInsets.all(16),
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: [
              homeCard(context, image: 'assets/general.png', label: 'General',
                  onTap: () {
                generalQuestions.shuffle();
                List<Map<String, String>> options =
                    generalQuestions.take(10).toList();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DisplayQuestions(
                              quizType: 'General',
                              questions: options,
                            )));
              }),
              homeCard(context, image: 'assets/food.png', label: 'Food',
                  onTap: () {
                foodQuestions.shuffle();
                List<Map<String, String>> options =
                    foodQuestions.take(10).toList();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DisplayQuestions(
                              quizType: 'Food',
                              questions: options,
                            )));
              }),
              homeCard(context, image: 'assets/deep.png', label: 'Deep',
                  onTap: () {
                deepQuestions.shuffle();
                List<Map<String, String>> options =
                    deepQuestions.take(10).toList();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DisplayQuestions(
                              quizType: 'Deep thought',
                              questions: options,
                            )));
              }),
              homeCard(context, image: 'assets/funny.png', label: 'Funny',
                  onTap: () {
                funnyQuestions.shuffle();
                List<Map<String, String>> options =
                    funnyQuestions.take(10).toList();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DisplayQuestions(
                              quizType: 'Funny',
                              questions: options,
                            )));
              }),
            ]),
        drawer: Drawer(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: db
                    .collection("stories")
                    .where("user_id",
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  final isLoading =
                      snapshot.connectionState == ConnectionState.waiting &&
                          !snapshot.hasData;
                  if (isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final data = (snapshot.data?.docs ?? []);

                  if (data.isEmpty) {
                    return const Center(child: Text("No saved story found"));
                  }

                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DisplayStory(
                                          story: data[index].data()['content'],
                                        ))),
                            title: Text(
                                'Story on ${(data[index].data()['created_at'] as Timestamp).toDate().toString().substring(0, 10)}'));
                      },
                      separatorBuilder: (__, _) => SizedBox(height: 10),
                      itemCount: data.length);
                })));
  }

  Widget homeCard(BuildContext context,
      {required String label,
      required String image,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        onTap();
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
