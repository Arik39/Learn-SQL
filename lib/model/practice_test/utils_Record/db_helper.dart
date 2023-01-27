import 'package:learnsql/model/practice_test/model_Record/practiceTestModel.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

abstract class DBhelperPT {
  static Database? _db;
  static int get _version => 1;

  static Future init() async {
    if (_db != null) {
      return;
    }

    try {
      var databasePath = await getDatabasesPath();
      String _path = p.join(databasePath, 'practiceTestList.db');
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
      "CREATE TABLE $practiceTestList (${PracTestL.testName} $textType,${PracTestL.testId} $idType,${PracTestL.totalQuestion} $textType ,${PracTestL.attemptedQuestion} $intTypeN,${PracTestL.correctAnswer} $textTypeN,${PracTestL.incorrectAnswer} $intTypeN,${PracTestL.notAttemptedQuestion} $intTypeN,${PracTestL.levelEasy} $intTypeN,${PracTestL.levelMedium} $intTypeN,${PracTestL.levelHard} $intTypeN);",
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

  static Future<int> update2(int id, int correctAnswer, int attemptedQuestion,
      int notAttemptedQuestion, int incorrectAnswer) async {
    Map<String, int> row = {
      PracTestL.notAttemptedQuestion: notAttemptedQuestion,
      PracTestL.correctAnswer: correctAnswer,
      PracTestL.incorrectAnswer: incorrectAnswer,
      PracTestL.attemptedQuestion: attemptedQuestion
    };

    return _db!.update(practiceTestList, row,
        where: '${PracTestL.testId} = ?', whereArgs: [id]);
  }

  static Future<int> insert(
      String practiceTestList, practiceTestModel PracTestListModel) async {
    return await _db!.insert(practiceTestList, PracTestListModel.toJson());
  }

  static Future<int> update(
      String practiceTestList, practiceTestModel PracTestListModel) async {
    return await _db!.update('practiceTestList', PracTestListModel.toJson(),
        where: 'topicId=?', whereArgs: [PracTestL.testId]);
  }

  static Future<int> delete(
      String practiceTestList, practiceTestModel PracTestListModel) async {
    return await _db!.delete(practiceTestList,
        where: 'testId=?', whereArgs: [PracTestListModel.testId]);
  }

  static Future<int> setPracTestList(int n, int id) async {
    return await _db!.rawUpdate(
        "UPDATE practiceTestList SET isPracTestList = $n WHERE topicId= $id");
  }

  static Future<List<Map<String, dynamic>>> getPracTestList() async {
    return _db!
        .rawQuery("SELECT * from practiceTestList where isPracTestList = 1");
  }

  static Future<List<Map<String, dynamic>>> details(String userTable) async {
    return _db!.query(userTable);
  }
}
