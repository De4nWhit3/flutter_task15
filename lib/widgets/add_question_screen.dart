import 'package:assignment_15/main.dart';
import 'package:flutter/material.dart';

import 'quiz_dropdown.dart';
import 'single_choice_widget.dart';

class AddQuestionScreen extends StatefulWidget {
  final Color limeGreen;
  final Color black;
  final Color fadedBlack;
  const AddQuestionScreen(
      {super.key,
      required this.black,
      required this.limeGreen,
      required this.fadedBlack});

  @override
  State<AddQuestionScreen> createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.fadedBlack,
      appBar: AppBar(
        backgroundColor: widget.black,
        foregroundColor: widget.limeGreen,
        title: const Text(
          'Adding a question',
          style: TextStyle(
              // color: limeGreen,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 30,
          right: 30,
          bottom: 20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                'Enter a question:',
                style: TextStyle(color: limeGreen, fontSize: 18),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                style: const TextStyle(color: limeGreen),
                cursorColor: limeGreen,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: black,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: limeGreen,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: limeGreen,
                      width: 2,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'How many hints would you like to add?',
                style: TextStyle(color: limeGreen, fontSize: 18),
              ),
              const SizedBox(
                height: 30,
              ),
              SingleChoiceWidget(
                black: widget.black,
                limeGreen: widget.limeGreen,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'In which category is your question?',
                style: TextStyle(color: limeGreen, fontSize: 18),
              ),
              const SizedBox(
                height: 30,
              ),
              QuizDropdown(
                black: widget.black,
                limeGreen: widget.limeGreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
