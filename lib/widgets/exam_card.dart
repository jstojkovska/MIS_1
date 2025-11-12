import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_lab1/models/Exam.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  const ExamCard({super.key, required this.exam});

  final Exam exam;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final bool isPast = exam.timeOfTheExam.isBefore(now);
    final borderColor = isPast ? Colors.red : Colors.green;

    final formattedDate = DateFormat('dd.MM.yyyy').format(exam.timeOfTheExam);
    final formattedTime = DateFormat('HH:mm').format(exam.timeOfTheExam);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/details", arguments: exam);
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor.withOpacity(0.8), width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                exam.nameExam,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 5,
                children: [
                  const Icon(Icons.date_range, size: 18),
                  const SizedBox(width: 4),
                  Text(formattedDate, style: const TextStyle(fontSize: 14)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 5,
                children: [
                  const Icon(Icons.access_time, size: 18),
                  const SizedBox(width: 4),
                  Text(formattedTime, style: const TextStyle(fontSize: 14)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 5,
                children: [
                  const Icon(Icons.room, size: 18),
                  const SizedBox(width: 4),
                  Text(exam.labsExam.join(", ")),
                ],
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: borderColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    isPast ? "Поминат" : "Претстои",
                    style: TextStyle(
                      color: borderColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
