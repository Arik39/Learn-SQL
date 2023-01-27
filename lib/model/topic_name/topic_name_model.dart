/// IsResult : 1
/// Message : "Data Found"
/// ResultList : [{"CategoryID":1,"CategoryName":"Basic Terms"},{"CategoryID":2,"CategoryName":"Tools of SQL"},{"CategoryID":3,"CategoryName":"Components of SQL"},{"CategoryID":4,"CategoryName":"Data types"},{"CategoryID":5,"CategoryName":"Basic Topics"},{"CategoryID":6,"CategoryName":"Advance Topics"},{"CategoryID":7,"CategoryName":"Interview Questions"},{"CategoryID":9,"CategoryName":"Query"}]

class TopicNameModel {
  TopicNameModel({
    num? isResult,
    String? message,
    List<ResultList>? resultList,
  }) {
    _isResult = isResult;
    _message = message;
    _resultList = resultList;
  }

  TopicNameModel.fromJson(dynamic json) {
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
  TopicNameModel copyWith({
    num? isResult,
    String? message,
    List<ResultList>? resultList,
  }) =>
      TopicNameModel(
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

/// CategoryID : 1
/// CategoryName : "Basic Terms"

class ResultList {
  ResultList({
    num? categoryID,
    String? categoryName,
  }) {
    _categoryID = categoryID;
    _categoryName = categoryName;
  }

  ResultList.fromJson(dynamic json) {
    _categoryID = json['CategoryID'];
    _categoryName = json['CategoryName'];
  }
  num? _categoryID;
  String? _categoryName;
  ResultList copyWith({
    num? categoryID,
    String? categoryName,
  }) =>
      ResultList(
        categoryID: categoryID ?? _categoryID,
        categoryName: categoryName ?? _categoryName,
      );
  num? get categoryID => _categoryID;
  String? get categoryName => _categoryName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['CategoryID'] = _categoryID;
    map['CategoryName'] = _categoryName;
    return map;
  }
}
