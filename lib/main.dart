import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'question.dart';
import 'widgets/add_question_screen.dart';

const Color limeGreen = Color.fromARGB(255, 43, 255, 0);
const Color fadedBlack = Color.fromARGB(255, 46, 46, 46);
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
      home: QuestionHomePage(),
      routes: <String, WidgetBuilder>{
        '/root': (BuildContext context) => QuestionHomePage(),
        '/addQuestion': (BuildContext context) => const AddQuestionScreen(
              black: black,
              fadedBlack: fadedBlack,
              limeGreen: limeGreen,
            ),
      },
    );
  }
}

class QuestionHomePage extends StatefulWidget {
  final List<Question> questions = [];
  final Map<String, String> availableCategories = Question.availableCategories;

  QuestionHomePage({super.key}) {
    questions.add(Question(
        question: 'Who created C?',
        answer: 'Dennis Ritchie',
        category: availableCategories['coding']!,
        imageURL: 'assets/dennis.jpg',
        hints: ['His name starts with D.', 'His last name starts with R.']));
    questions.add(Question(
        question: 'Abuse of legal power resulted in Aaron Swartz doing what?',
        answer: 'suicide',
        category: availableCategories['coding']!,
        imageURL: 'assets/aaron.jpg',
        hints: ['You can only do it once.', 'He will be dearly missed.']));
    questions.add(Question(
        question:
            'What is the name of the internet\'s most popular source to learn hacking?',
        answer: 'hackthebox',
        category: availableCategories['coding']!,
        imageURL: 'assets/box.png',
        hints: [
          'It\'s a box.',
          'What do you do when you break into someone\'s computer via code?'
        ]));
    questions.add(Question(
        question:
            'When I was a child I saw a symbol that fascinated me. The following symbol was a puzzle used globally to recruit intellectually gifted individuals into an unknown organization, what was the puzzle called?',
        answer: 'cicada3301',
        category: availableCategories['coding']!,
        imageURL: 'assets/cicada3301.jpg',
        hints: [
          'It contains a word and a number as a single word.',
          'The text part is cicada.'
        ]));
    questions.add(Question(
        question:
            'What is the name of this YouTube sensation for all things cyber security?',
        answer: 'david bombal',
        category: availableCategories['coding']!,
        imageURL: 'assets/david.jpg',
        hints: [
          'It\'s a popular male name.',
          'His last name starts with the letters "bom".'
        ]));
    questions.add(Question(
        question: 'What is the hacker "FC" short for "Freaky Clown" known for?',
        answer: 'hacking banks legally',
        category: availableCategories['coding']!,
        imageURL: 'assets/freakyclown.jpg',
        hints: ['He does it legally.', 'We store money there.']));
    questions.add(Question(
        question:
            'What is the name of the hacker who was said to have "saved the ineternet"?',
        answer: 'lance hutchinson',
        category: availableCategories['coding']!,
        imageURL: 'assets/lance.jpg',
        hints: [
          'His first name is also a term used for a long pointed weapon used in jousting.',
          'His last name starts with a H.'
        ]));
    questions.add(Question(
        question: 'What does the hacker\'s handle, "OTW", stand for?',
        answer: 'occupy the web',
        category: availableCategories['coding']!,
        imageURL: 'assets/occupyTheWeb.png',
        hints: ['occupy', 'web']));
    questions.add(Question(
        question:
            'Owen Thor Walker lead a group of hackers and stole millions at what age?',
        answer: '17',
        category: availableCategories['coding']!,
        imageURL: 'assets/owen.jpeg',
        hints: ['He could not be tried as an adult.', 'It\'s after 15.']));
    questions.add(Question(
        question: 'Don\'t talk about it.',
        answer: 'soldierX',
        category: availableCategories['coding']!,
        imageURL: 'assets/soldierx.jpg',
        hints: ['...', '...']));
    questions.add(Question(
        question: 'What symbol is shown below?',
        answer: 'hacker',
        category: availableCategories['coding']!,
        imageURL: 'assets/symbol.png',
        hints: [
          'It\'s for a particular group of people who code.',
          'They can have good, no particular, or bad intensions.'
        ]));
    questions.add(Question(
        question:
            'This Ukrainian hacker was caught by the US, refused healthcare, abused, and given a deal to hack for the government which he refused. He ran a notorious website that specialized in carding and selling other illegal goods. What was the name of the site?',
        answer: 'silk road',
        category: availableCategories['coding']!,
        imageURL: 'assets/vega.jpeg',
        hints: ['A fabric that women love.', 'His hacker handle was Boa.']));
  }

  @override
  State<QuestionHomePage> createState() => _QuestionHomePageState();
}

class _QuestionHomePageState extends State<QuestionHomePage> {
  int _selectedIndex = 0;
  int _railSelectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAlignment = -1.0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    List<Question> questions = widget.questions;
    return Scaffold(
      backgroundColor: fadedBlack,
      appBar: AppBar(
        backgroundColor: black,
        centerTitle: true,
        title: const Text(
          'Dean\'s 13/37 App',
          style: TextStyle(
            color: limeGreen,
            fontFeatures: <FontFeature>[
              FontFeature.fractions(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: width < 700,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          backgroundColor: black,
          selectedItemColor: limeGreen,
          unselectedItemColor: const Color.fromARGB(255, 44, 143, 48),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Some Option',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.speaker),
              label: 'Other Option',
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          Visibility(
            visible: width >= 700,
            child: Row(
              children: [
                NavigationRail(
                  backgroundColor: black,
                  useIndicator: true,
                  indicatorColor: limeGreen,
                  selectedIndex: _railSelectedIndex,
                  groupAlignment: groupAlignment,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _railSelectedIndex = index;
                      if (index == 0) {
                        Navigator.of(context).pushNamed('/addQuestion');
                      }
                    });
                  },
                  labelType: labelType,
                  destinations: const <NavigationRailDestination>[
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.favorite_border,
                        color: limeGreen,
                      ),
                      selectedIcon: Icon(
                        Icons.favorite,
                        color: black,
                      ),
                      label: Text(
                        'Add Question',
                        style: TextStyle(
                          color: limeGreen,
                        ),
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.bookmark_border,
                        color: limeGreen,
                      ),
                      selectedIcon: Icon(
                        Icons.book,
                        color: black,
                      ),
                      label: Text(
                        'Option 2',
                        style: TextStyle(
                          color: limeGreen,
                        ),
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.star_border,
                        color: limeGreen,
                      ),
                      selectedIcon: Icon(
                        Icons.star,
                        color: black,
                      ),
                      label: Text(
                        'Option 3',
                        style: TextStyle(
                          color: limeGreen,
                        ),
                      ),
                    ),
                  ],
                ),
                const VerticalDivider(
                  thickness: 2,
                  width: 2,
                  color: limeGreen,
                ),
              ],
            ),
          ),
          Expanded(child: QuestionListWidget(questions: questions)),
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            border: Border.all(
              color: limeGreen,
              width: 2,
            )),
        child: FloatingActionButton.extended(
            backgroundColor: black,
            foregroundColor: limeGreen,
            icon: const Icon(Icons.bug_report),
            onPressed: () {
              Navigator.of(context).pushNamed('/addQuestion');
            },
            label: const Text(
              'Add Question',
            )),
      ),
    );
  }
}

class QuestionListWidget extends StatelessWidget {
  const QuestionListWidget({
    super.key,
    required this.questions,
  });

  final List<Question> questions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: questions.length,
      itemBuilder: (BuildContext context, int index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 3),
          child: SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(
              child: GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushNamed('/addQuestion');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: black,
                    border: Border.all(
                      color: limeGreen,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  // height: 100,
                  width: double.infinity,
                  margin: const EdgeInsets.all(
                    10,
                  ),
                  child: Column(
                    children: [
                      Image(
                        height: 150,
                        image: AssetImage(questions[index].imageURL),
                      ),
                      Text(
                        questions[index].question,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: limeGreen),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
