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
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 7,
        crossAxisSpacing: 7,
        childAspectRatio: 250 / 280,
      ),
      itemCount: widget.examList.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return ExamCard(exam: widget.examList[index]);
      },
    );
  }
}
