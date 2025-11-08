import 'package:flutter/material.dart';
import '../data/mock_exams.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_details_screen.dart';

class HomeScreen extends StatelessWidget {
  final String indexNumber;

  const HomeScreen({super.key, required this.indexNumber});

  @override
  Widget build(BuildContext context) {
    // copy and sort in hronological order
    final List<Exam> exams = List.of(kExams)
      ..sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: Text('Распоред за испити - $indexNumber'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 80),
        itemCount: exams.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, i) {
          final exam = exams[i];
          return ExamCard(
            exam: exam,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ExamDetailScreen(exam: exam),
                ),
              );
            },
          );
        },
      ),


      bottomNavigationBar: BottomAppBar(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              const Icon(Icons.list_alt),
              const SizedBox(width: 8),
              const Text('Вкупно испити:'),
              const SizedBox(width: 12),
              Chip(
                label: Text('${exams.length}'),
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              // Legend
              Row(
                children: const [
                  _LegendDot(color: Colors.grey, text: 'поминат'),
                  SizedBox(width: 12),
                  _LegendDot(color: Colors.green, text: 'идeн'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String text;
  const _LegendDot({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
