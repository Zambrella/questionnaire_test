import 'question_model.dart';
import 'question_option_model.dart';
import 'questionnaire_model.dart';
import 'dart:io';

void main(List<String> arguments) {
  print('Welcome to the questionnaire');

  while (myQuestionnaire.currentIndex <= myQuestionnaire.allQuestions.length) {
    print('Question ${myQuestionnaire.currentIndex + 1}');
    final question = myQuestionnaire.getNextQuestion();
    if (question == null) {
      break;
    }
    print(question);
    final answer = int.parse(stdin.readLineSync()!);
    question.toggleOption(answer);
    myQuestionnaire.questionSubmitted(question);
  }
}

var myQuestionnaire = Questionnaire(
  [
    QuestionModel(
      '111',
      'What is your favourite pudding?',
      [
        QuestionOption(false, "Cake", '901'),
        QuestionOption(false, "Fruit", '902'),
        QuestionOption(false, "Pie", '903'),
      ],
      1,
      false,
      null,
      null,
    ),
    QuestionModel(
      '222',
      'What is your favourite movie?',
      [
        QuestionOption(false, "Matrix", '911'),
        QuestionOption(false, "Lord of the Rings", '912'),
        QuestionOption(false, "Harry Potter", '913'),
      ],
      2,
      false,
      null,
      null,
    ),
    QuestionModel(
      '333',
      'What is your favourite Harry Potter Character',
      [
        QuestionOption(false, "Harry", '921'),
        QuestionOption(false, "Ron", '922'),
        QuestionOption(false, "Hermione", '923'),
      ],
      3,
      false,
      null,
      ['913'],
    ),
    QuestionModel(
      '444',
      'What is your favourite thing about Harry',
      [
        QuestionOption(false, "Glasses", '931'),
        QuestionOption(false, "Scar", '932'),
        QuestionOption(false, "Wand", '933'),
      ],
      4,
      false,
      null,
      ['921'],
    ),
  ],
  'ABC-12345678',
);
