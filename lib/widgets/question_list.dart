import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../question.dart';

class QuestionListWidget extends StatelessWidget {
  final Color limeGreen;
  final Color black;
  const QuestionListWidget({
    super.key,
    required this.questions,
    required this.black,
    required this.limeGreen,
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
                        style: TextStyle(color: limeGreen),
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
