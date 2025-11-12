import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/Exam.dart';
import '../widgets/exam_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Exam> _examList = [];

  Exam exam1 = Exam(
    nameExam: "Напредно програмирање",
    timeOfTheExam: DateTime(2026, 01, 12, 15, 30),
    labsExam: ["12", "13"],
  );
  Exam exam2 = Exam(
    nameExam: "Мобилни информациски системи",
    timeOfTheExam: DateTime(2026, 01, 25, 11, 30),
    labsExam: ["225", "138", "3"],
  );
  Exam exam3 = Exam(
    nameExam: "Мобилни платформи и програмирање",
    timeOfTheExam: DateTime(2026, 01, 13, 8, 30),
    labsExam: ["200аб"],
  );
  Exam exam4 = Exam(
    nameExam: "Бази на податоци",
    timeOfTheExam: DateTime(2026, 01, 25, 11, 30),
    labsExam: ["225", "138", "13", "12"],
  );
  Exam exam5 = Exam(
    nameExam: "Вовед во науката за податоците",
    timeOfTheExam: DateTime(2026, 01, 29, 12, 30),
    labsExam: ["200аб", "225", "138"],
  );
  Exam exam6 = Exam(
    nameExam: "Веб програмирање",
    timeOfTheExam: DateTime(2026, 01, 25, 17, 30),
    labsExam: ["225", "138"],
  );
  Exam exam7 = Exam(
    nameExam: "Електронска и мобилна трговија",
    timeOfTheExam: DateTime(2025, 06, 12, 8, 30),
    labsExam: ["12", "13", "117"],
  );
  Exam exam8 = Exam(
    nameExam: "Дизајн на интеракција човек-компјутер",
    timeOfTheExam: DateTime(2025, 06, 25, 13, 30),
    labsExam: ["225", "138", "3"],
  );
  Exam exam9 = Exam(
    nameExam: "Основи на веб дизајн",
    timeOfTheExam: DateTime(2025, 06, 12, 15, 30),
    labsExam: ["12", "13"],
  );
  Exam exam10 = Exam(
    nameExam: "Алгоритми и податочни структури",
    timeOfTheExam: DateTime(2025, 07, 04, 11, 30),
    labsExam: ["225", "138", "3"],
  );
  Exam exam11 = Exam(
    nameExam: "Дискретна математика",
    timeOfTheExam: DateTime(2026, 01, 15, 15, 00),
    labsExam: ["12", "13", "225", "138", "3"],
  );
  Exam exam12 = Exam(
    nameExam: "Бизнис статистика",
    timeOfTheExam: DateTime(2026, 01, 14, 14, 50),
    labsExam: ["225", "138", "3"],
  );

  @override
  void initState() {
    super.initState();
    _examList = [
      exam1,
      exam2,
      exam3,
      exam4,
      exam5,
      exam6,
      exam7,
      exam8,
      exam9,
      exam10,
      exam11,
      exam12,
    ];

    _examList.sort((a, b) => a.timeOfTheExam.compareTo(b.timeOfTheExam));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ExamGrid(examList: _examList),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school, color: Colors.black54),
            const SizedBox(width: 8),
            Text(
              "Вкупно испити: ${_examList.length}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
