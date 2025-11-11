import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_lab1/widgets/exam_data.dart';
import 'package:mis_lab1/widgets/exam_title.dart';

import '../models/Exam.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final exam = ModalRoute.of(context)!.settings.arguments as Exam;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(exam.nameExam, style: TextStyle(fontSize: 14)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 50),
              Center(child: ExamTitle(exam: exam)),
              SizedBox(height: 50),
              Center(child: ExamData(exam: exam)),
            ],
          ),
        ),
      ),
    );
  }
}
