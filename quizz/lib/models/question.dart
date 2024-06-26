import './option.dart';

class Question {
  final int score;
  final String text;
  final List<Option> options;

  const Question({
    required this.score,
    required this.text,
    required this.options,
  });
}
