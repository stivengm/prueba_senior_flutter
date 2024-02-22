import 'package:flutter/material.dart';

class TaskDescriptions extends StatelessWidget {
  final String title;
  final String subtitle;
  const TaskDescriptions({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "$title: ",
        style: Theme.of(context).textTheme.headlineMedium!.copyWith( fontSize: 15.0, fontWeight: FontWeight.bold ),
        children: [
          TextSpan(
            text: subtitle,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith( fontSize: 15.0, fontWeight: FontWeight.normal ),
          )
        ]
      )
    );
  }
}