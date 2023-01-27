import 'package:learnsql/model/practice_test/model_SingleTest/SinglePracticeTestModel.dart';

import 'db_helper_single_test.dart';

class DBServiceSPT {
  Future<List<singlePracticeTestModel>> getPracTest(String tableName) async {
    await DBhelperSPT.init();

    List<Map<String, dynamic>> PracTestList =
        await DBhelperSPT.details(tableName);

    return PracTestList.map((item) => singlePracticeTestModel.fromMap(item))
        .toList();
  }

  Future<List<singlePracticeTestModel>> getIsCorrect(String userTable) async {
    await DBhelperSPT.init();

    List<Map<String, dynamic>> pracTestList =
        await DBhelperSPT.getIsCorrect(userTable);

    return pracTestList
        .map((item) => singlePracticeTestModel.fromMap(item))
        .toList();
  }

  Future<List<singlePracticeTestModel>> getIsAttempted(String userTable) async {
    await DBhelperSPT.init();

    List<Map<String, dynamic>> pracTestList =
        await DBhelperSPT.getIsAttempted(userTable);
    return pracTestList
        .map((item) => singlePracticeTestModel.fromMap(item))
        .toList();
  }

  Future<bool> updateScore(int n, int id1, id2, String userTable) async {
    await DBhelperSPT.init();

    int ret = await DBhelperSPT.setScore(n, id1, id2, userTable);
    return ret > 0 ? true : false;
  }

  Future<bool> updateSelectedAns(String n, id1, String userTable) async {
    await DBhelperSPT.init();

    int ret = await DBhelperSPT.setSelectedAns(n, id1, userTable);
    return ret > 0 ? true : false;
  }

  Future<bool> updateAttempted(int n, int id1, id2, String userTable) async {
    await DBhelperSPT.init();

    int ret = await DBhelperSPT.setAttempted(n, id1, id2, userTable);
    return ret > 0 ? true : false;
  }

  Future<bool> addPracTestList(singlePracticeTestModel model) async {
    await DBhelperSPT.init();

    int ret = await DBhelperSPT.insert(testTable, model);
    return ret > 0 ? true : false;
  }

  Future<bool> updatePracTestList(singlePracticeTestModel model) async {
    await DBhelperSPT.init();

    int ret = await DBhelperSPT.update(testTable, model);
    return ret > 0 ? true : false;
  }

  Future<bool> deletePracTestList(singlePracticeTestModel model) async {
    await DBhelperSPT.init();

    int ret = await DBhelperSPT.delete(testTable, model);
    return ret > 0 ? true : false;
  }

  Future<bool> setPracTestList(int n, int id) async {
    await DBhelperSPT.init();

    int ret = await DBhelperSPT.setSinglePracTestList(n, id);
    return ret > 0 ? true : false;
  }
}
