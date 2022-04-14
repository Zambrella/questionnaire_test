class QuestionOption {
  QuestionOption(this.isSelected, this.optionText, this.optionId);

  final String optionId;
  final String optionText;
  bool isSelected;

  @override
  String toString() {
    return optionText;
  }
}
