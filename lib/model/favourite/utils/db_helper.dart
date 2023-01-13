import 'package:learnsql/model/favourite/model/favListModel.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

abstract class DBhelper {
  static Database? _db;
  static int get _version => 1;

  static Future init() async {
    if (_db != null) {
      return;
    }

    try {
      var databasePath = await getDatabasesPath();
      String _path = p.join(databasePath, 'Favourite.db');
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
      "CREATE TABLE $favouriteTable (${FavFields.topicId} $idType,${FavFields.categoryId} $intType,${FavFields.topicName} $textType ,${FavFields.isFavourite} $intTypeN,${FavFields.categoryName} $textTypeN,${FavFields.topicIndex} $intTypeN);",
    );
  }

  static Future _onUpgrade(Database db, int oldVersion, int version) async {
    if (oldVersion > version) {
      //
    }
  }

  static Future<List<Map<String, dynamic>>> query(String a) async {
    String search = '\'%' + a + '%\'';
    return _db!
        .rawQuery('SELECT * FROM favouriteTable where UserName LIKE $search');
  }

  static Future<int> insert(
      String favouriteTable, favListModel favModel) async {
    return await _db!.insert(favouriteTable, favModel.toJson());
  }

  static Future<int> update(
      String favouriteTable, favListModel favModel) async {
    return await _db!.update('favouriteTable', favModel.toJson(),
        where: 'topicId=?', whereArgs: [FavFields.topicId]);
  }

  static Future<int> delete(
      String favouriteTable, favListModel favModel) async {
    return await _db!.delete(favouriteTable,
        where: 'topicId=?', whereArgs: [favModel.topicId]);
  }

  static Future<int> setfav(int n, int id) async {
    return await _db!.rawUpdate(
        "UPDATE favouriteTable SET isFavourite = $n WHERE topicId= $id");
  }

  static Future<List<Map<String, dynamic>>> getfav() async {
    return _db!.rawQuery("SELECT * from favouriteTable where isFavourite = 1");
  }

  static Future<List<Map<String, dynamic>>> details(String userTable) async {
    return _db!.query(userTable);
  }
}
