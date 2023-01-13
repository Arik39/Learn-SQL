import 'package:learnsql/model/practice_test/model_SingleTest/SinglePracticeTestModel.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

abstract class DBhelperSPT {
  static Database? _db;
  static Database? _db2;
  static String tableName = '';

  static int get _version => 1;

  static Future init() async {
    try {
      var databasePath = await getDatabasesPath();
      String _path = p.join(databasePath, (tableName + '.db'));
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
      "CREATE TABLE $testTable (${SinglePracTestL.TestName} $textType,${SinglePracTestL.TestID} $idType,${SinglePracTestL.QuizQueID} $intTypeN ,${SinglePracTestL.QuizQue} $textType,${SinglePracTestL.QuizA} $textTypeN,${SinglePracTestL.QuizB} $textTypeN,${SinglePracTestL.QuizC} $textTypeN,${SinglePracTestL.QuizD} $textTypeN,${SinglePracTestL.Difficulty} $textTypeN,${SinglePracTestL.QuizAns} $textTypeN,${SinglePracTestL.isAttempted} $intTypeN,${SinglePracTestL.isCorrect} $intTypeN,${SinglePracTestL.selectedAns} $textTypeN);",
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
        .rawQuery('SELECT * FROM practiceTestList where UserName LIKE $search');
  }

  static Future<int> insert(String practiceTestList,
      singlePracticeTestModel SinglePracTestListModel) async {
    return await _db!
        .insert(practiceTestList, SinglePracTestListModel.toJson());
  }

  static Future<int> update(String practiceTestList,
      singlePracticeTestModel SinglePracTestListModel) async {
    return await _db!.update(
        'practiceTestList', SinglePracTestListModel.toJson(),
        where: 'topicId=?', whereArgs: [SinglePracTestL.TestID]);
  }

  static Future<int> delete(String practiceTestList,
      singlePracticeTestModel SinglePracTestListModel) async {
    var databasePath = await getDatabasesPath();
    String _path = p.join(
        databasePath, (SinglePracTestListModel.TestName.toString() + '.db'));
    _db2 = await openDatabase(_path);

    return await _db2!.delete(practiceTestList,
        where: 'TestName=?', whereArgs: [SinglePracTestListModel.TestName]);
  }

  static Future<int> setScore(int n, int id1, int id2, String userTable) async {
    var databasePath = await getDatabasesPath();
    String _path = p.join(databasePath, (userTable + '.db'));
    _db2 = await openDatabase(_path);

    return await _db2!.rawUpdate(
        "UPDATE testTableName SET isCorrect =$n WHERE TestID = $id2 ");
  }

  static Future<int> setSelectedAns(String n, int id2, String userTable) async {
    var databasePath = await getDatabasesPath();
    String _path = p.join(databasePath, (userTable + '.db'));
    _db2 = await openDatabase(_path);

    return await _db2!.rawUpdate(
        "UPDATE testTableName SET selectedAns ='$n' WHERE TestID = $id2 ");
  }

  static Future<int> setAttempted(
      int n, int id1, int id2, String userTable) async {
    var databasePath = await getDatabasesPath();
    String _path = p.join(databasePath, (userTable + '.db'));
    _db2 = await openDatabase(_path);

    return await _db2!.rawUpdate(
        "UPDATE testTableName SET isAttempted =$n WHERE TestID = $id2 ");
  }

  static Future<List<Map<String, dynamic>>> getIsAttempted(
      String userTable) async {
    var databasePath = await getDatabasesPath();
    String _path = p.join(databasePath, (userTable + '.db'));
    _db2 = await openDatabase(_path);
    return _db2!.rawQuery("SELECT * from testTableName where isAttempted = 1");
  }

  static Future<int> setSinglePracTestList(int n, int id) async {
    return await _db!.rawUpdate(
        "UPDATE testTableName SET isSinglePracTestList = $n WHERE topicId= $id");
  }

  static Future<List<Map<String, dynamic>>> getIsCorrect(
      String userTable) async {
    var databasePath = await getDatabasesPath();
    String _path = p.join(databasePath, (userTable + '.db'));
    _db2 = await openDatabase(_path);

    return _db2!.rawQuery("SELECT * from testTableName where isCorrect = 1");
  }

  static Future<List<Map<String, dynamic>>> details(String userTable) async {
    var databasePath = await getDatabasesPath();
    String _path = p.join(databasePath, (userTable + '.db'));
    _db2 = await openDatabase(_path);
    print(_db2!.query('testTableName'));
    return _db2!.query('testTableName');
  }

  static Future<int> drop(String practiceTestList,
      singlePracticeTestModel SinglePracTestListModel) async {
    return await _db!.delete(practiceTestList,
        where: 'testId=?', whereArgs: [SinglePracTestListModel.TestID]);
  }
}
