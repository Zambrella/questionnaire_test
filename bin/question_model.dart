import 'question_option_model.dart';

class QuestionModel {
  const QuestionModel(
    this.id,
    this.questionText,
    this.options,
    this.order,
    this.isMultiChoice,
    this.codes,
    this.dependsOnOptions,
  );

  /// Id of question
  final String id;

  /// Text of question
  final String questionText;

  /// List of options for the question
  final List<QuestionOption> options;

  /// Order which is should be displayed
  final int order;

  /// If the question allows selecting multiple options
  final bool isMultiChoice;

  /// A list of option ids that this question depends on being selected
  final List<String>? dependsOnOptions;

  /// Show if user has one of these promo-codes
  final List<String>? codes;

  List<QuestionOption> get selectedAnswers {
    return options.where((option) => option.isSelected).toList();
  }

  void toggleOption(int index) {
    if (isMultiChoice) {
      options[index].isSelected = !options[index].isSelected;
    } else {
      for (var option in options) {
        option.isSelected = false;
      }
      options[index].isSelected = true;
    }
  }

  bool canBeShown(List<QuestionModel>? answeredQuestions) {
    // If there are no dependencies then can display the question
    if (dependsOnOptions == null) {
      return true;
    } else {
      final allSelectedAnswersIds = <String>[];
      // Loop through each answered question and get the selected question options
      for (final question in answeredQuestions!) {
        final selectedAnswers = question.selectedAnswers;
        for (final selectedAnswer in selectedAnswers) {
          allSelectedAnswersIds.add(selectedAnswer.optionId);
        }
      }
      // Compare list of question options ids against this object's dependsOnOptions and there is a match, return true.
      return allSelectedAnswersIds.any((element) => dependsOnOptions!.contains(element));
    }
  }

  @override
  String toString() {
    return 'Q: $questionText, Options: $options';
  }
}
