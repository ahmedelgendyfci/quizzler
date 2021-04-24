import 'questions.dart';

class QuizBrain {
  List<Question> _questions = [
    Question(q: 'What is Lorem Ipsum?', a: 'true'),
    Question(q: 'Where can I get some?', a: 'false'),
    Question(q: 'Where does it come from?', a: 'false'),
  ];

  String getQuestionText(int index) {
    return _questions[index].questionText;
  }

  String getQuestionAnswer(int index) {
    return _questions[index].questionAnswer;
  }

  int getQuestionNumbers() {
    return _questions.length;
  }
}
