import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'question.dart';

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
        '/addQuestion': (BuildContext context) => const AddQuestionScreen(),
        // '/viewSpecificQuestion':
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
  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: ListView.builder(
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
                      Navigator.of(context).pushNamed('/addQuestion');
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
        ),
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
              style: TextStyle(
                  // color: limeGreen,
                  ),
            )),
      ),
    );
  }
}

class AddQuestionScreen extends StatefulWidget {
  const AddQuestionScreen({super.key});

  @override
  State<AddQuestionScreen> createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text('Enter a question:'),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
            ),
            const SingleChoiceWidget(),
            const QuizDropdown(),
          ],
        ),
      ),
    );
  }
}

enum Hints { one, two, three }

class SingleChoiceWidget extends StatefulWidget {
  const SingleChoiceWidget({super.key});

  @override
  State<SingleChoiceWidget> createState() => _SingleChoiceWidgetState();
}

class _SingleChoiceWidgetState extends State<SingleChoiceWidget> {
  Hints hint = Hints.one;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      style: ButtonStyle(
        side: MaterialStateBorderSide.resolveWith((Set<MaterialState> states) {
          return const BorderSide(
            color: limeGreen,
            width: 2,
          );
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed) ||
                states.contains(MaterialState.selected)) {
              return black;
            }
            return limeGreen;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed) ||
                states.contains(MaterialState.selected)) {
              return limeGreen;
            }
            return black;
          },
        ),
      ),
      segments: const [
        ButtonSegment<Hints>(
          value: Hints.one,
          label: Text(
            "One",
          ),
          icon: Icon(
            Icons.one_x_mobiledata,
            color: limeGreen,
          ),
        ),
        ButtonSegment<Hints>(
          value: Hints.two,
          label: Text(
            "Two",
          ),
          icon: Icon(
            Icons.looks_two,
            color: limeGreen,
          ),
        ),
        ButtonSegment(
          value: Hints.three,
          label: Text(
            "Three",
          ),
          icon: Icon(
            Icons.three_g_mobiledata,
            color: limeGreen,
          ),
        ),
      ],
      selected: <Hints>{hint},
      onSelectionChanged: (Set<Hints> newSelection) {
        setState(() {
          hint = newSelection.first;
        });
      },
    );
  }
}

class QuizDropdown extends StatefulWidget {
  const QuizDropdown({super.key});

  @override
  State<QuizDropdown> createState() => _QuizDropdownState();
}

class _QuizDropdownState extends State<QuizDropdown> {
  List<String> items = Question.availableCategories.keys.toList();
  String selectedValue = Question.availableCategories.keys.toList().first;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: const Row(
          children: [
            Icon(
              Icons.list,
              size: 16,
              color: limeGreen,
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                'Select Item',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: limeGreen,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: limeGreen,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: 160,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: limeGreen,
              width: 2,
            ),
            color: black,
          ),
          elevation: 2,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14,
          iconEnabledColor: limeGreen,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: 200,
            padding: null,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: black,
              border: Border.all(
                color: limeGreen,
                width: 2,
              ),
            ),
            elevation: 8,
            offset: const Offset(-20, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all(6),
              thumbVisibility: MaterialStateProperty.all(true),
            )),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
