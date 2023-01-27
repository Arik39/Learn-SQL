import 'singlePTModel.dart';

String testTable = 'testTableName';

class SinglePracTestL {
  static final String QuizQueID = 'QuizQueID';
  static final String TestID = 'TestID';
  static final String TestName = 'TestName';
  static final String Difficulty = 'Difficulty';
  static final String QuizQue = 'QuizQue';
  static final String QuizA = 'QuizA';
  static final String QuizB = 'QuizB';
  static final String QuizC = 'QuizC';
  static final String QuizD = 'QuizD';
  static final String QuizAns = 'QuizAns';
  static final String isAttempted = 'isAttempted';
  static final String isCorrect = 'isCorrect';
  static final String selectedAns = 'selectedAns';
}

class singlePracticeTestModel extends singlePTModel {
  static String table = "favorite";

  int? QuizQueID;
  int? TestID;
  String? TestName;
  String? Difficulty;
  String? QuizQue;
  String? QuizA;
  String? QuizB;
  String? QuizC;
  String? QuizD;
  String? QuizAns;
  int? isAttempted;
  int? isCorrect;
  String? selectedAns;

  singlePracticeTestModel(
      {this.QuizQueID,
      this.TestID,
      this.TestName,
      this.Difficulty,
      this.QuizQue,
      this.QuizA,
      this.QuizB,
      this.QuizC,
      this.QuizD,
      this.QuizAns,
      this.isAttempted,
      this.isCorrect,
      this.selectedAns});

  static singlePracticeTestModel fromMap(Map<String, dynamic> json) {
    return singlePracticeTestModel(
      QuizQueID: json['QuizQueID'],
      TestID: json['TestID'],
      TestName: json['TestName'],
      Difficulty: json['Difficulty'],
      QuizQue: json['QuizQue'],
      QuizA: json['QuizA'],
      QuizB: json['QuizB'],
      QuizC: json['QuizC'],
      QuizD: json['QuizD'],
      QuizAns: json['QuizAns'],
      isAttempted: json['isAttempted'],
      isCorrect: json['isCorrect'],
      selectedAns: json['selectedAns'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'QuizQueID': QuizQueID,
      'TestID': TestID,
      'TestName': TestName,
      'Difficulty': Difficulty,
      'QuizQue': QuizQue,
      'QuizA': QuizA,
      'QuizB': QuizB,
      'QuizC': QuizC,
      'QuizD': QuizD,
      'QuizAns': QuizAns,
      'isAttempted': isAttempted,
      'isCorrect': isCorrect,
      'selectedAns': selectedAns,
    };

    if (TestID != null) {
      map['TestID'] = TestID;
    }
    return map;
  }
}
