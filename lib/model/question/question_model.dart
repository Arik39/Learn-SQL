import 'package:learnsql/model/question/result_list.dart';

class QuestionModel {
  int? isResult;
  String? message;
  List<QuestionList>? resultList;

  QuestionModel({
    this.isResult,
    this.message,
    this.resultList,
  });

  QuestionModel.fromJson(dynamic json) {
    isResult = json['IsResult'];
    message = json['Message'];
    if (json['ResultList'] != null) {
      resultList = [];
      json['ResultList'].forEach((v) {
        resultList!.add(QuestionList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['IsResult'] = isResult;
    map['Message'] = message;
    if (resultList != null) {
      map['ResultList'] = resultList!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
