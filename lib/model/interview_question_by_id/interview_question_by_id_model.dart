/// IsResult : 1
/// Message : "Data Found"
/// ResultList : [{"Que":"What is DBMS?","Ans":"DBMS or Database Management System is a software application used to access, create, and manage databases.\r\nWith the help of DBMS, you can easily create, retrieve and update data in databases.\r\nA DBMS consists of a group of commands to manipulate the database and acts as an interface between the end-users and the database.\r\nFor Example: MySQL, SQL Server, Oracle, dBASE etc. are popular commercial DBMS used in different applications.","LikeCount":1,"DisLikeCount":4,"clapCount":34}]

class InterviewQuestionByIdModel {
  InterviewQuestionByIdModel({
    num? isResult,
    String? message,
    List<ResultList>? resultList,
  }) {
    _isResult = isResult;
    _message = message;
    _resultList = resultList;
  }

  InterviewQuestionByIdModel.fromJson(dynamic json) {
    _isResult = json['IsResult'];
    _message = json['Message'];
    if (json['ResultList'] != null) {
      _resultList = [];
      json['ResultList'].forEach((v) {
        _resultList?.add(ResultList.fromJson(v));
      });
    }
  }
  num? _isResult;
  String? _message;
  List<ResultList>? _resultList;
  InterviewQuestionByIdModel copyWith({
    num? isResult,
    String? message,
    List<ResultList>? resultList,
  }) =>
      InterviewQuestionByIdModel(
        isResult: isResult ?? _isResult,
        message: message ?? _message,
        resultList: resultList ?? _resultList,
      );
  num? get isResult => _isResult;
  String? get message => _message;
  List<ResultList>? get resultList => _resultList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['IsResult'] = _isResult;
    map['Message'] = _message;
    if (_resultList != null) {
      map['ResultList'] = _resultList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// Que : "What is DBMS?"
/// Ans : "DBMS or Database Management System is a software application used to access, create, and manage databases.\r\nWith the help of DBMS, you can easily create, retrieve and update data in databases.\r\nA DBMS consists of a group of commands to manipulate the database and acts as an interface between the end-users and the database.\r\nFor Example: MySQL, SQL Server, Oracle, dBASE etc. are popular commercial DBMS used in different applications."
/// LikeCount : 1
/// DisLikeCount : 4
/// clapCount : 34

class ResultList {
  ResultList({
    String? que,
    String? ans,
    num? likeCount,
    num? disLikeCount,
    num? clapCount,
  }) {
    _que = que;
    _ans = ans;
    _likeCount = likeCount;
    _disLikeCount = disLikeCount;
    _clapCount = clapCount;
  }

  ResultList.fromJson(dynamic json) {
    _que = json['Que'];
    _ans = json['Ans'];
    _likeCount = json['LikeCount'];
    _disLikeCount = json['DisLikeCount'];
    _clapCount = json['clapCount'];
  }
  String? _que;
  String? _ans;
  num? _likeCount;
  num? _disLikeCount;
  num? _clapCount;
  ResultList copyWith({
    String? que,
    String? ans,
    num? likeCount,
    num? disLikeCount,
    num? clapCount,
  }) =>
      ResultList(
        que: que ?? _que,
        ans: ans ?? _ans,
        likeCount: likeCount ?? _likeCount,
        disLikeCount: disLikeCount ?? _disLikeCount,
        clapCount: clapCount ?? _clapCount,
      );
  String? get que => _que;
  String? get ans => _ans;
  num? get likeCount => _likeCount;
  num? get disLikeCount => _disLikeCount;
  num? get clapCount => _clapCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Que'] = _que;
    map['Ans'] = _ans;
    map['LikeCount'] = _likeCount;
    map['DisLikeCount'] = _disLikeCount;
    map['clapCount'] = _clapCount;
    return map;
  }
}
