/// IsResult : 1
/// Message : "Data Found"
/// ResultList : [{"TopicID":2,"TopicName":"Microsoft SQL Server","TopicWEB":"<h3>Microsoft SQL Server</h3>\r\n<div style=\"width: 100%; margin-left: auto; margin-right: auto;\">\r\n<ul>\r\n<li>Developed in the year 1989.</li>\r\n<li style=\"text-align:justify;\">The language used is Assembly C, Linux, C++ for writing it.</li>\r\n<li style=\"text-align:justify;\">It works on Linux and windows operating system.</li>\r\n<li>Latest updated version came in 2016.</li>\r\n<li style=\"text-align:justify;\">Some of the standout features for the 2016 edition include temporal data support, which makes it possible to track changes made to data over time. </li>\r\n<li style=\"text-align:justify;\">The latest version of Microsoft SQL Server also allows for dynamic data masking, which ensures that only authorized individuals will see sensitive data.</li>\r\n<li><a href=\"https://www.microsoft.com/en-in/sql-server/sql-server-2016\" target=\"_blank\" title=\"Download SQL Server | download sql server management studio\">Download SQL Server</a></li>\r\n</ul>\r\n</div>","CategoryID":2,"isFavorite":0,"LikeCount":6,"DisLikeCount":0,"clapCount":310},{"TopicID":3,"TopicName":"MYSQL","TopicWEB":"<h3>MYSQL</h3>\r\n<div style=\"width: 100%; margin-left: auto; margin-right: auto;\">\r\n<ul>\r\n<li style=\"text-align:justify;\">MySQL is one of the most popular databases for web-based applications. </li>\r\n<li style=\"text-align:justify;\">It’s freeware, but it is frequently updated with features and security improvements. </li>\r\n<li style=\"text-align:justify;\">There are also a variety of paid editions designed for commercial use.</li>\r\n<li>Latest version is 8.</li>\r\n<li style=\"text-align:justify;\">C and C++ languages are used to develope it.</li>\r\n<li>It works on Linux as well as Windows OS.</li>\r\n<li><a href=\"https://www.mysql.com/downloads/\" target=\"_blank\" title=\"Download MYSQL Server | mysql free download\">Download MYSQL</a></li>\r\n</ul>\r\n</div>","CategoryID":2,"isFavorite":0,"LikeCount":8,"DisLikeCount":0,"clapCount":400},{"TopicID":4,"TopicName":"ORACLE","TopicWEB":"<h3>ORACLE</h3>\r\n<div style=\"width: 100%; margin-left: auto; margin-right: auto;\">\r\n<ul>\r\n<li style=\"text-align:justify;\">Oracle database is the most widely used object-relational database management software.</li>\r\n<li style=\"text-align:justify;\">The first version of this database management tool was created in the late 70s, and there are a number of editions of this tool available to meet your organization’s needs. </li>\r\n<li style=\"text-align:justify;\">The latest version of this tool is 12c where c means cloud computing and can be hosted on a single server or multiple servers, and it enables the management of databases holding billions of records.</li>\r\n<li style=\"text-align:justify;\">It supports multiple Windows, UNIX, and Linux versions.</li>\r\n<li><a href=\"https://www.oracle.com/downloads/index.html\" target=\"_blank\" title=\"Download ORACLE | oracle download | oracle sql\">Download ORACLE </a></li>\r\n</ul>\r\n</div>","CategoryID":2,"isFavorite":0,"LikeCount":4,"DisLikeCount":1,"clapCount":36},{"TopicID":5,"TopicName":"POSTGRE SQL","TopicWEB":"<h3>POSTGRE SQL</h3>\r\n<div style=\"width: 100%; margin-left: auto; margin-right: auto;\">\r\n<ul>\r\n<li style=\"text-align:justify;\">PostgreSQL is one of several free popular databases, and it is frequently used for web databases. </li>\r\n<li style=\"text-align:justify;\">It was one of the first database management systems to be developed, and it allows users to manage both structured and unstructured data. </li>\r\n<li style=\"text-align:justify;\">It can also be used on most major platforms, including Linux-based ones, and it’s fairly simple to import information from other database types using the tool.</li>\r\n<li style=\"text-align:justify;\">It’s a more advanced database.Current Version is 9.6.2.</li>\r\n<li style=\"text-align:justify;\">It can be used across Linux and windows operating systems.\r\n</li>\r\n<li><a href=\"https://www.postgresql.org/download/\" target=\"_blank\" title=\"Download POSTGRE SQL | postgresql database | Postgre installation\">Download POSTGRE SQL</a></li>\r\n</ul>\r\n</div>","CategoryID":2,"isFavorite":0,"LikeCount":6,"DisLikeCount":1,"clapCount":9},{"TopicID":6,"TopicName":"SQLITE","TopicWEB":"<h3>SQLITE</h3>\r\n<div style=\"width: 100%; margin-left: auto; margin-right: auto;\">\r\n<ul>\r\n<li>It’s used as a database system for mobiles applications.</li>\r\n<li>It is coded in C language.</li>\r\n<li style=\"text-align:justify;\">It can work on Linux, windows and mac OS.</li>\r\n<li><a href=\"https://www.sqlite.org/download.html\" target=\"_blank\" title=\"Download SQLITE | sqlite manager | sqlite browser | sqlite manager\">Download SQLITE</a></li>\r\n</ul>\r\n</div>","CategoryID":2,"isFavorite":0,"LikeCount":3,"DisLikeCount":0,"clapCount":3},{"TopicID":7,"TopicName":"MONGODB","TopicWEB":"<h3>MONGODB</h3>\r\n<div style=\"width: 100%; margin-left: auto; margin-right: auto;\">\r\n<ul>\r\n<li style=\"text-align:justify;\">It’s a database which can process large data simultaneously and uses internal memory so the data is easily accessible, use of very complex joins is not there, scaling is easily possible. Queries can be easily optimized for output.</li>\r\n<li style=\"text-align:justify;\">It is designed for applications that use both structured and unstructured data. </li>\r\n<li>It’s an open source tool.</li>\r\n<li style=\"text-align:justify;\">MongoDB 3.2 is the latest version, and it features new pluggable storage engines. Documents can also now be validated during updates and inserts, and the text search functions have been improved. A new partial index capability also may allow for improved performance by shrinking the size of indexes.</li>\r\n<li><a href=\"https://www.mongodb.com/download-center\" target=\"_blank\" title=\"\"Download mongodb | mongodb download |mongodb install\">Download MONGODB</a></li>\r\n</ul></div>","CategoryID":2,"isFavorite":0,"LikeCount":2,"DisLikeCount":1,"clapCount":54}]

class TopicHeadings {
  TopicHeadings({
      num? isResult, 
      String? message, 
      List<ResultList>? resultList,}){
    _isResult = isResult;
    _message = message;
    _resultList = resultList;
}

  TopicHeadings.fromJson(dynamic json) {
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
TopicHeadings copyWith({  num? isResult,
  String? message,
  List<ResultList>? resultList,
}) => TopicHeadings(  isResult: isResult ?? _isResult,
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

/// TopicID : 2
/// TopicName : "Microsoft SQL Server"
/// TopicWEB : "<h3>Microsoft SQL Server</h3>\r\n<div style=\"width: 100%; margin-left: auto; margin-right: auto;\">\r\n<ul>\r\n<li>Developed in the year 1989.</li>\r\n<li style=\"text-align:justify;\">The language used is Assembly C, Linux, C++ for writing it.</li>\r\n<li style=\"text-align:justify;\">It works on Linux and windows operating system.</li>\r\n<li>Latest updated version came in 2016.</li>\r\n<li style=\"text-align:justify;\">Some of the standout features for the 2016 edition include temporal data support, which makes it possible to track changes made to data over time. </li>\r\n<li style=\"text-align:justify;\">The latest version of Microsoft SQL Server also allows for dynamic data masking, which ensures that only authorized individuals will see sensitive data.</li>\r\n<li><a href=\"https://www.microsoft.com/en-in/sql-server/sql-server-2016\" target=\"_blank\" title=\"Download SQL Server | download sql server management studio\">Download SQL Server</a></li>\r\n</ul>\r\n</div>"
/// CategoryID : 2
/// isFavorite : 0
/// LikeCount : 6
/// DisLikeCount : 0
/// clapCount : 310

class ResultList {
  ResultList({
      num? topicID, 
      String? topicName, 
      String? topicWEB, 
      num? categoryID, 
      num? isFavorite, 
      num? likeCount, 
      num? disLikeCount, 
      num? clapCount,}){
    _topicID = topicID;
    _topicName = topicName;
    _topicWEB = topicWEB;
    _categoryID = categoryID;
    _isFavorite = isFavorite;
    _likeCount = likeCount;
    _disLikeCount = disLikeCount;
    _clapCount = clapCount;
}

  ResultList.fromJson(dynamic json) {
    _topicID = json['TopicID'];
    _topicName = json['TopicName'];
    _topicWEB = json['TopicWEB'];
    _categoryID = json['CategoryID'];
    _isFavorite = json['isFavorite'];
    _likeCount = json['LikeCount'];
    _disLikeCount = json['DisLikeCount'];
    _clapCount = json['clapCount'];
  }
  num? _topicID;
  String? _topicName;
  String? _topicWEB;
  num? _categoryID;
  num? _isFavorite;
  num? _likeCount;
  num? _disLikeCount;
  num? _clapCount;
ResultList copyWith({  num? topicID,
  String? topicName,
  String? topicWEB,
  num? categoryID,
  num? isFavorite,
  num? likeCount,
  num? disLikeCount,
  num? clapCount,
}) => ResultList(  topicID: topicID ?? _topicID,
  topicName: topicName ?? _topicName,
  topicWEB: topicWEB ?? _topicWEB,
  categoryID: categoryID ?? _categoryID,
  isFavorite: isFavorite ?? _isFavorite,
  likeCount: likeCount ?? _likeCount,
  disLikeCount: disLikeCount ?? _disLikeCount,
  clapCount: clapCount ?? _clapCount,
);
  num? get topicID => _topicID;
  String? get topicName => _topicName;
  String? get topicWEB => _topicWEB;
  num? get categoryID => _categoryID;
  num? get isFavorite => _isFavorite;
  num? get likeCount => _likeCount;
  num? get disLikeCount => _disLikeCount;
  num? get clapCount => _clapCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TopicID'] = _topicID;
    map['TopicName'] = _topicName;
    map['TopicWEB'] = _topicWEB;
    map['CategoryID'] = _categoryID;
    map['isFavorite'] = _isFavorite;
    map['LikeCount'] = _likeCount;
    map['DisLikeCount'] = _disLikeCount;
    map['clapCount'] = _clapCount;
    return map;
  }

}