import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Exam.dart';

class ExamTitle extends StatelessWidget {
  const ExamTitle({super.key, required this.exam});

  final Exam exam;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final bool isPast = exam.timeOfTheExam.isBefore(now);
    final borderColor = isPast ? Colors.red : Colors.green;

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: borderColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        textAlign: TextAlign.center,
        exam.nameExam,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
