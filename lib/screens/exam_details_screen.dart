import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';
import '../data/mock_exams.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;
  const ExamDetailScreen({super.key, required this.exam});

  String _formatRemaining() {
    final now = DateTime.now();
    if (exam.dateTime.isBefore(now)) return 'Испитот е поминат';

    Duration diff = exam.dateTime.difference(now);
    final days = diff.inDays;
    final hours = diff.inHours - (days * 24);
    return '$days дена, $hours часа';
  }

  @override
  Widget build(BuildContext context) {
    final isPast = exam.dateTime.isBefore(DateTime.now());
    final dfDate = DateFormat('dd.MM.yyyy');
    final dfTime = DateFormat('HH:mm');

    return Scaffold(

      appBar: AppBar(title: const Text('Детали за испит')

      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Chip(
              label: Text(
                exam.subject,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: isPast
                  ? Colors.grey.withOpacity(0.20)
                  : Colors.green.withOpacity(0.20),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            const SizedBox(height: 16),


            Row(
              children: [
                const Icon(Icons.event),
                const SizedBox(width: 8),
                Text('Датум: ${dfDate.format(exam.dateTime)}'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.schedule),
                const SizedBox(width: 8),
                Text('Време: ${dfTime.format(exam.dateTime)}'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.meeting_room),
                const SizedBox(width: 8),
                Expanded(child: Text('Простории: ${exam.rooms.join(', ')}')),
              ],
            ),

            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.hourglass_bottom),
                const SizedBox(width: 8),
                Text(
                  isPast ? 'Преостанато: /' : 'Преостанато: ${_formatRemaining()}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),

            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Chip(
                avatar: Icon(isPast ? Icons.check_circle_outline : Icons.access_time,
                    color: isPast ? Colors.grey : Theme.of(context).colorScheme.primary),
                label: Text(isPast ? 'Поминат' : 'Иден'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
