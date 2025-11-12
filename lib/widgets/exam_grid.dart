import 'package:flutter/cupertino.dart';
import 'package:mis_lab1/models/Exam.dart';

import 'exam_card.dart';

class ExamGrid extends StatefulWidget {
  const ExamGrid({super.key, required this.examList});

  final List<Exam> examList;

  @override
  State<StatefulWidget> createState() => _ExamGridState();
}

class _ExamGridState extends State<ExamGrid> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.examList.length,
      itemBuilder: (context, index) {
        final exam = widget.examList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
          child: ExamCard(exam: exam),
        );
      },
    );
  }
}
