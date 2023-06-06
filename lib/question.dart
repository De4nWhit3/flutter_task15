class Question {
  static Map<String, String> availableCategories = {
    "coding": 'coding',
    "science": 'science',
    "math": 'math'
  };

  final String question;
  final String answer;
  final String category;
  final String imageURL;
  final List<String> hints;

  Question(
      {required this.question,
      required this.answer,
      required this.category,
      required this.imageURL,
      required this.hints});

  (String, String, String, String, List<String>) getAllData() {
    return (question, answer, category, imageURL, hints);
  }

  Map<String, String> getCategories() {
    return availableCategories;
  }
}
