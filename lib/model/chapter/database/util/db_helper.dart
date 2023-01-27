import 'package:learnsql/model/chapter/database/model/chapterListModel.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

abstract class DBChapterhelper {
  static Database? _db;
  static int get _version => 1;

  static Future init() async {
    if (_db != null) {
      return;
    }

    try {
      var databasePath = await getDatabasesPath();
      String _path = p.join(databasePath, 'Chapter.db');
      _db = await openDatabase(_path,
          version: _version, onCreate: _onCreate, onUpgrade: _onUpgrade);
    } catch (ex) {
      print(ex);
    }
  }

  static Future _onCreate(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final intType = 'INTEGER NOT NULL';
    final intTypeN = 'INTEGER';
    final boolType = 'BOOLEAN NOT NULL';
    final textTypeN = 'TEXT';

    await db.execute(
      "CREATE TABLE $chapterTable (${ChapterFields.topicId} $idType,${ChapterFields.categoryId} $intType,${ChapterFields.topicName} $textType ,${ChapterFields.isFavourite} $intTypeN,${ChapterFields.categoryName} $textTypeN,${ChapterFields.topicIndex},$intTypeN,${ChapterFields.isRead} $intTypeN,${ChapterFields.totalRead} $intTypeN);",
    );
  }

  static Future _onUpgrade(Database db, int oldVersion, int version) async {
    if (oldVersion > version) {
      //
    }
  }

  static Future<int> insert(
      String chapterTable, chapterListModel chapterModel) async {
    return await _db!.insert(chapterTable, chapterModel.toJson());
  }

  static Future<int> update(
      String chapterTable, chapterListModel chapterModel) async {
    return await _db!.update('chapterTable', chapterModel.toJson(),
        where: 'topicId=?', whereArgs: [ChapterFields.topicId]);
  }

  static Future<int> delete(
      String chapterTable, chapterListModel chapterModel) async {
    return await _db!.delete(chapterTable,
        where: 'topicId=?', whereArgs: [chapterModel.topicId]);
  }

  static Future<int> setfav(int n, int id) async {
    return await _db!.rawUpdate(
        "UPDATE chapterTable SET isFavourite = $n WHERE topicId= $id");
  }

  static Future<List<Map<String, dynamic>>> getfav() async {
    return _db!.rawQuery("SELECT * from chapterTable where isFavourite = 1");
  }

  static Future<int> setread(int n, int id) async {
    return await _db!
        .rawUpdate("UPDATE chapterTable SET isRead = $n WHERE topicId= $id");
  }

  static Future<List<Map<String, dynamic>>> getsingledetail(
      int categoryId) async {
    return _db!
        .rawQuery("SELECT * from chapterTable where categoryId = $categoryId");
  }

  static Future<List<Map<String, dynamic>>> gettotalread(int categoryId) async {
    return _db!
        .rawQuery("SELECT * from chapterTable where categoryId = $categoryId");
  }

  static Future<List<Map<String, dynamic>>> getread(int categoryId) async {
    return _db!.rawQuery(
        "SELECT * from chapterTable where categoryId = $categoryId AND isRead = 1");
  }

  static Future<List<Map<String, dynamic>>> details(String userTable) async {
    return _db!.query(userTable);
  }
}
