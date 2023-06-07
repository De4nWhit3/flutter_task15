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
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text(
              'Enter a question:',
              style: TextStyle(color: limeGreen),
            ),
            TextFormField(
              style: const TextStyle(color: limeGreen),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
            ),
            SingleChoiceWidget(
              black: widget.black,
              limeGreen: widget.limeGreen,
            ),
            QuizDropdown(
              black: widget.black,
              limeGreen: widget.limeGreen,
            ),
          ],
        ),
      ),
    );
  }
}
