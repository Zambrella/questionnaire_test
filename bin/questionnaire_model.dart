import 'question_model.dart';

class Questionnaire {
  Questionnaire(this.allQuestions, this.userPromoCode) {
    allQuestions.sort((a, b) => a.order.compareTo(b.order));
  }

  /// All questions that are available
  final List<QuestionModel> allQuestions;

  /// List that holds all the questions the user has answered
  final List<QuestionModel> usersQuestions = [];

  /// Promo code of the user
  final String userPromoCode;

  /// Current position in the question list
  int _currentIndex = 0;

  get currentIndex => _currentIndex;

  void questionSubmitted(QuestionModel question) {
    usersQuestions.add(question);
  }

  QuestionModel? getNextQuestion() {
    // Get the next question
    final nextQuestion = allQuestions[_currentIndex++];
    // Check if it is one that depends on a previous answer
    if (nextQuestion.canBeShown(usersQuestions)) {
      return nextQuestion;
    } else {
      return getNextQuestion();
    }
  }
}
