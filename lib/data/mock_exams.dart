import 'package:intl/intl.dart';
import '../models/exam.dart';

//Statical hardcoded data - 12 Exams

final List<Exam> kExams = [
  Exam(
    subject: 'Вовед во биоинформатиката',
    dateTime: DateTime(2025,11,19,18,0),
    rooms: ['ЛАБ 138','АМФ ФИНКИ'],
  ),
  Exam(
    subject: 'Веројатност и статистика',
    dateTime: DateTime(2024,2,5,15,0),
    rooms: ['ЛАБ 138','АМФ ФИНКИ','АМФ МФ'],
  ),//exceeded exam
  Exam(
    subject: 'Економија за ИКТ инженери',
    dateTime: DateTime(2025,11,21,18,0),
    rooms: ['ЛАБ 2',],
  ),
  Exam(
    subject: 'Дизајн и архитектура на софтвер',
    dateTime: DateTime(2025,11,20,18,0),
    rooms: ['ЛАБ 138','АМФ ФИНКИ'],
  ),
  Exam(
    subject: 'Мобилни информациски системи',
    dateTime: DateTime(2025,12,29,18,0),
    rooms: ['АМФ МФ'],
  ),
  Exam(
    subject: 'Информациска безбедност',
    dateTime: DateTime(2025,12,21,12,0),
    rooms: ['Барака 2.1'],
  ),
  Exam(
    subject: 'Вовед во науката за податоци',
    dateTime: DateTime(2025,11,29,10,0),
    rooms: ['ЛАБ 138','ЛАБ 215','ЛАБ 138'],
  ),
  Exam(
    subject: 'Веб програмирање',
    dateTime: DateTime(2025,11,15,17,0),
    rooms: ['ЛАБ 138','ЛАБ 13'],
  ),
  Exam(
    subject: 'Бази на податоци',
    dateTime: DateTime(2025,8,27,9,0),
    rooms: ['ЛАБ 138','АМФ ФИНКИ','ЛАБ 12','ЛАБ 13'],
  ),//exceeded exam
  Exam(
    subject: 'Софтверски квалитет и тестирање',
    dateTime: DateTime(2025,6,19,18,0),
    rooms: ['ЛАБ 138','ЛАБ 215'],
  ),//exceeded exam
  Exam(
    subject: 'Машинско учење',
    dateTime: DateTime(2026,1,25,16,0),
    rooms: ['ЛАБ 138','АМФ ФИНКИ'],
  ),
  Exam(
    subject: 'Континуирана интеграција и испорака',
    dateTime: DateTime(2026,1,24,15,0),
    rooms: ['ЛАБ 138','АМФ 225'],
  ),
];

//Helper: macedonian format for date and time

String formatDate(DateTime dt) => DateFormat('dd.MM.yyyy').format(dt);
String formatTime(DateTime dt) => DateFormat('HH:mm').format(dt);

