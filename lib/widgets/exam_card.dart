import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../data/mock_exams.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({
    super.key,
    required this.exam,
    required this.onTap,
  });

  bool get isPast => exam.dateTime.isBefore(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final Color accent = isPast ? Colors.grey : Theme.of(context).colorScheme.primary;

    return Card(
      elevation: 2,

      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // vertical color strip for status
              Container(
                width: 6,
                height: 64,
                decoration: BoxDecoration(
                  color: accent,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exam.subject,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.event, size: 18),
                        const SizedBox(width: 6),
                        Text('${formatDate(exam.dateTime)}'),
                        const SizedBox(width: 12),
                        const Icon(Icons.schedule, size: 18),
                        const SizedBox(width: 6),
                        Text(formatTime(exam.dateTime)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.meeting_room, size: 18),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(exam.rooms.join(', ')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                isPast ? Icons.check_circle_outline : Icons.arrow_forward_ios,
                size: 20,
                color: isPast ? Colors.grey : Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
