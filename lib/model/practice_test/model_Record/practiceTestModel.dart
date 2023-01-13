import 'ptModel.dart';

final String practiceTestList = 'practiceTestList';

class PracTestL {
  static final String testName = 'testName';
  static final String testId = 'testId';
  static final String totalQuestion = 'totalQuestion';
  static final String attemptedQuestion = 'attemptedQuestion';
  static final String correctAnswer = 'correctAnswer';
  static final String incorrectAnswer = 'incorrectAnswer';
  static final String notAttemptedQuestion = 'notAttemptedQuestion';
  static final String levelEasy = 'levelEasy';
  static final String levelMedium = 'levelMedium';
  static final String levelHard = 'levelHard';
}

class practiceTestModel extends ptModel {
  static String table = "favorite";
  String? testName;
  int? testId;
  int? totalQuestion;
  int? attemptedQuestion;
  int? correctAnswer;
  int? incorrectAnswer;
  int? notAttemptedQuestion;
  int? levelEasy;
  int? levelMedium;
  int? levelHard;

  practiceTestModel(
      {this.testName,
      this.testId,
      this.totalQuestion,
      this.attemptedQuestion,
      this.correctAnswer,
      this.incorrectAnswer,
      this.notAttemptedQuestion,
      this.levelEasy,
      this.levelMedium,
      this.levelHard});

  static practiceTestModel fromMap(Map<String, dynamic> json) {
    return practiceTestModel(
        testName: json['testName'],
        testId: json['testId'],
        totalQuestion: int.parse(json['totalQuestion']),
        attemptedQuestion: json['attemptedQuestion'],
        correctAnswer: int.parse(json['correctAnswer']),
        incorrectAnswer: json['incorrectAnswer'],
        notAttemptedQuestion: json['notAttemptedQuestion'],
        levelEasy: json['levelEasy'],
        levelMedium: json['levelMedium'],
        levelHard: json['levelHard']);
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'testName': testName,
      'testId': testId,
      'totalQuestion': totalQuestion,
      'attemptedQuestion': attemptedQuestion,
      'correctAnswer': correctAnswer,
      'incorrectAnswer': incorrectAnswer,
      'notAttemptedQuestion': notAttemptedQuestion,
      'levelEasy': levelEasy,
      'levelMedium': levelMedium,
      'levelHard': levelHard,
    };

    if (testId != null) {
      map['topicId'] = testId;
    }
    return map;
  }
}
