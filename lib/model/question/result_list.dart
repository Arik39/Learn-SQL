class QuestionList {
  int? questionID;
  int? levelID;
  String? question;
  String? optionA;
  String? optionB;
  String? optionC;
  String? optionD;
  String? trueOption;
  dynamic? answer;
  dynamic? remarks;

  QuestionList({
    this.questionID,
    this.levelID,
    this.question,
    this.optionA,
    this.optionB,
    this.optionC,
    this.optionD,
    this.trueOption,
    this.answer,
    this.remarks,
  });

  QuestionList.fromJson(dynamic json) {
    questionID = json['QuestionID'];
    levelID = json['LevelID'];
    question = json['Question'];
    optionA = json['OptionA'];
    optionB = json['OptionB'];
    optionC = json['OptionC'];
    optionD = json['OptionD'];
    trueOption = json['TrueOption'];
    answer = json['Answer'];
    remarks = json['Remarks'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['QuestionID'] = questionID;
    map['LevelID'] = levelID;
    map['Question'] = question;
    map['OptionA'] = optionA;
    map['OptionB'] = optionB;
    map['OptionC'] = optionC;
    map['OptionD'] = optionD;
    map['TrueOption'] = trueOption;
    map['Answer'] = answer;
    map['Remarks'] = remarks;
    return map;
  }
}
