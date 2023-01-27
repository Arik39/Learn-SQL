import 'chapterModel.dart';

final String chapterTable = 'chapterTable';

class ChapterFields {
  static final String topicId = 'topicId';
  static final String categoryId = 'categoryId';
  static final String topicName = 'topicName';
  static final String isFavourite = 'isFavourite';
  static final String categoryName = 'categoryName';
  static final String topicIndex = 'topicIndex';
  static final String isRead = 'isRead';
  static final String totalRead = 'totalRead';
}

class chapterListModel extends chapterModel {
  static String table = "favorite";
  int? topicId;
  int? categoryId;
  String? topicName;
  int? isFavourite;
  String? categoryName;
  int? topicIndex;
  int? isRead;
  int? totalRead;

  chapterListModel(
      {this.topicId,
      this.categoryId,
      this.topicName,
      this.isFavourite,
      this.categoryName,
      this.topicIndex,
      this.isRead,
      this.totalRead});

  static chapterListModel fromMap(Map<String, dynamic> json) {
    return chapterListModel(
        topicId: json['topicId'],
        categoryId: json['categoryId'],
        topicName: json['topicName'].toString(),
        isFavourite: json['isFavourite'],
        categoryName: json['categoryName'],
        topicIndex: json['topicIndex'],
        isRead: json['isRead'],
        totalRead: json['totalRead']);
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'topicId': topicId,
      'categoryId': categoryId,
      'topicName': topicName,
      'isFavourite': isFavourite,
      'categoryName': categoryName,
      'topicIndex': topicIndex,
      'isRead': isRead,
      'totalRead': totalRead,
    };

    if (topicId != null) {
      map['topicId'] = topicId;
    }
    return map;
  }
}
