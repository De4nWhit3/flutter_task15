import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

const Color limeGreen = Color.fromARGB(255, 43, 255, 0);
const Color fadedBlack = Color.fromARGB(255, 27, 27, 27);
const Color black = Colors.black;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const QuestionHomePage(),
      routes: <String, WidgetBuilder>{
        '/root': (BuildContext context) => const QuestionHomePage(),
        '/addQuestion': (BuildContext context) => const AddQuestionScreen(),
        // '/viewSpecificQuestion':
      },
    );
  }
}

class QuestionHomePage extends StatefulWidget {
  const QuestionHomePage({super.key});

  @override
  State<QuestionHomePage> createState() => _QuestionHomePageState();
}

class _QuestionHomePageState extends State<QuestionHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fadedBlack,
      appBar: AppBar(
        backgroundColor: black,
        centerTitle: true,
        title: const Text(
          'Dean\'s 10/10 App',
          style: TextStyle(
            color: limeGreen,
            fontFeatures: <FontFeature>[
              FontFeature.fractions(),
            ],
          ),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 3),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Container(
                    // color: limeGreen,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: limeGreen,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    height: 100,
                    width: double.infinity,
                    margin: const EdgeInsets.all(
                      10,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: black,
          foregroundColor: limeGreen,
          icon: const Icon(Icons.bug_report),
          onPressed: () {
            Navigator.of(context).pushNamed('/addQuestion');
          },
          label: const Text(
            'Add Question',
            style: TextStyle(
                // color: limeGreen,
                ),
          )),
    );
  }
}

class AddQuestionScreen extends StatelessWidget {
  const AddQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> availableCategories = ["coding", "science", "math"];
    return Scaffold(
      backgroundColor: fadedBlack,
      appBar: AppBar(
        backgroundColor: black,
        foregroundColor: limeGreen,
        title: const Text(
          'Adding a question',
          style: TextStyle(
              // color: limeGreen,
              ),
        ),
      ),
      body: Placeholder(),
    );
  }
}

class Question {
  final String question;
  final String answer;
  final String category;
  final String imageURL;
  final List<String> hints;

  Question(
      {required this.question,
      required this.answer,
      required this.category,
      required this.imageURL,
      required this.hints});

  (String, String, String, String, List<String>) getAllData() {
    return (question, answer, category, imageURL, hints);
  }
}
