import 'package:flutter/material.dart';

enum Hints { one, two, three }

class SingleChoiceWidget extends StatefulWidget {
  final Color limeGreen;
  final Color black;
  const SingleChoiceWidget(
      {super.key, required this.black, required this.limeGreen});

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
          return BorderSide(
            color: widget.limeGreen,
            width: 2,
          );
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed) ||
                states.contains(MaterialState.selected)) {
              return widget.black;
            }
            return widget.limeGreen;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed) ||
                states.contains(MaterialState.selected)) {
              return widget.limeGreen;
            }
            return widget.black;
          },
        ),
      ),
      segments: [
        ButtonSegment<Hints>(
          value: Hints.one,
          label: const Text(
            "One",
          ),
          icon: Icon(
            Icons.one_x_mobiledata,
            color: widget.limeGreen,
          ),
        ),
        ButtonSegment<Hints>(
          value: Hints.two,
          label: const Text(
            "Two",
          ),
          icon: Icon(
            Icons.looks_two,
            color: widget.limeGreen,
          ),
        ),
        ButtonSegment(
          value: Hints.three,
          label: const Text(
            "Three",
          ),
          icon: Icon(
            Icons.three_g_mobiledata,
            color: widget.limeGreen,
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
