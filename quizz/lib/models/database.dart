// ignore_for_file: prefer_const_constructors

import 'option.dart';
import 'question.dart';

class Database {
  static var questions = [
    Question(
      score: 5,
      text: 'Qual a capital do Egito?',
      options: [
        Option(text: 'Casablanca', correct: false),
        Option(text: 'Cairo', correct: true),
        Option(text: 'Luanda', correct: false),
        Option(text: 'Argel', correct: false),
        Option(text: 'Naróbi', correct: false),
      ],
    ),
    Question(
      score: 3,
      text: 'Qual a nota musical identificada por D#',
      options: [
        Option(text: 'Dó sustenido', correct: false),
        Option(text: 'Ré sustenido', correct: true),
        Option(text: 'Sol bemol', correct: false),
        Option(text: 'Si bemol', correct: false),
        Option(text: 'Ré bemol', correct: false),
        Option(text: 'Lá sustenido', correct: false),
      ],
    ),
    Question(
      score: 2,
      text: 'Qual a linguagem de programação utilizada pelo framework Flutter?',
      options: [
        Option(text: 'Dart', correct: true),
        Option(text: 'Flutter', correct: false),
        Option(text: 'Java', correct: false),
        Option(text: 'Javascript', correct: false),
      ],
    ),
    Question(
      score: 8,
      text: 'Quem escreveu o livro 1984?',
      options: [
        Option(text: 'George Orwell', correct: true),
        Option(text: 'Herman Melville', correct: false),
        Option(text: 'Ernest Hemingway', correct: false),
        Option(text: 'Jane Austin', correct: false),
      ],
    ),
    Question(
      score: 6,
      text: 'Quem foi a primeira pessoa a viajar no Espaço?',
      options: [
        Option(text: 'Yuri Gagarin', correct: true),
        Option(text: 'A cadela Laika', correct: false),
        Option(text: 'Neil Armstrong', correct: false),
        Option(text: 'Marcos Pontes', correct: false),
      ],
    ),
    Question(
      score: 1,
      text: 'Que país tem o formato de uma bota?',
      options: [
        Option(text: 'Itália', correct: true),
        Option(text: 'Butão', correct: false),
        Option(text: 'Portugal', correct: false),
        Option(text: 'México', correct: false),
        Option(text: 'Turquia', correct: false),
      ],
    ),
  ];

  static void shuffleData(
      {bool shuffleQuestions = true, bool shuffleOptions = true}) {
    if (shuffleQuestions) {
      questions.shuffle();
    }
    if (shuffleOptions) {
      for (var question in questions) {
        question.options.shuffle();
      }
    }
  }
}
