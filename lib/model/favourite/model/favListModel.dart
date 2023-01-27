import 'favModel.dart';

final String favouriteTable = 'favouriteTable';

class FavFields {
  static final String topicId = 'topicId';
  static final String categoryId = 'categoryId';
  static final String topicName = 'topicName';
  static final String isFavourite = 'isFavourite';
  static final String categoryName = 'categoryName';
  static final String topicIndex = 'topicIndex';
}

class favListModel extends favModel {
  static String table = "favorite";
  int? topicId;
  int? categoryId;
  String? topicName;
  int? isFavourite;
  String? categoryName;
  int? topicIndex;

  favListModel(
      {this.topicId,
      this.categoryId,
      this.topicName,
      this.isFavourite,
      this.categoryName,
      this.topicIndex});

  static favListModel fromMap(Map<String, dynamic> json) {
    return favListModel(
        topicId: json['topicId'],
        categoryId: json['categoryId'],
        topicName: json['topicName'].toString(),
        isFavourite: json['isFavourite'],
        categoryName: json['categoryName'],
        topicIndex: json['topicIndex']);
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
    };

    if (topicId != null) {
      map['topicId'] = topicId;
    }
    return map;
  }
}
