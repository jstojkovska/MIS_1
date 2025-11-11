import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/Exam.dart';

class ExamData extends StatelessWidget {
  const ExamData({super.key, required this.exam});

  final Exam exam;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('dd.MM.yyyy').format(exam.timeOfTheExam);
    final formattedTime = DateFormat('HH:mm').format(exam.timeOfTheExam);

    final isPast = exam.timeOfTheExam.isBefore(now);
    final color = isPast ? Colors.red : Colors.green;

    final difference = exam.timeOfTheExam.difference(now);
    final days = difference.inDays;
    final hours = difference.inHours % 24;

    final infoText = isPast
        ? 'Поминат е датумот за полагање на овој испит'
        : 'Преостанато време до полагање:\n${days} дена, ${hours} часа';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Row(
            children: [
              Icon(Icons.date_range, size: 26, color: color),
              const SizedBox(width: 10),
              Text(
                formattedDate,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.access_time, size: 26, color: color),
              const SizedBox(width: 10),
              Text(
                formattedTime,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.room, size: 26, color: color),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  exam.labsExam.join(", "),
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          const SizedBox(height: 100),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: color, width: 1),
            ),
            padding: const EdgeInsets.all(16),
            child: Text(
              infoText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: color.shade700,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
