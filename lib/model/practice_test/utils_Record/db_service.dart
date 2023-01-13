import 'package:learnsql/model/practice_test/model_Record/practiceTestModel.dart';

import 'db_helper.dart';

class DBServicePT {
  Future<List<practiceTestModel>> getPracTest() async {
    await DBhelperPT.init();

    List<Map<String, dynamic>> PracTestList =
        await DBhelperPT.details(practiceTestList);

    return PracTestList.map((item) => practiceTestModel.fromMap(item)).toList();
  }

  Future<List<practiceTestModel>> getPracTestList() async {
    await DBhelperPT.init();

    List<Map<String, dynamic>> pracTestList =
        await DBhelperPT.getPracTestList();

    return pracTestList.map((item) => practiceTestModel.fromMap(item)).toList();
  }

  Future<bool> addPracTestList(practiceTestModel model) async {
    await DBhelperPT.init();

    int ret = await DBhelperPT.insert(practiceTestList, model);
    return ret > 0 ? true : false;
  }

  Future<bool> updatePracTestList(practiceTestModel model) async {
    await DBhelperPT.init();

    int ret = await DBhelperPT.update(practiceTestList, model);
    return ret > 0 ? true : false;
  }

  Future<bool> updatePracTestList2(
      int id,
      int correctAnswer,
      int attemptedQuestion,
      int notAttemptedQuestion,
      int incorrectAnswer) async {
    await DBhelperPT.init();

    int ret = await DBhelperPT.update2(id, correctAnswer, attemptedQuestion,
        notAttemptedQuestion, incorrectAnswer);
    return ret > 0 ? true : false;
  }

  Future<bool> deletePracTestList(practiceTestModel model) async {
    await DBhelperPT.init();

    int ret = await DBhelperPT.delete(practiceTestList, model);
    return ret > 0 ? true : false;
  }

  Future<bool> setPracTestList(int n, int id) async {
    await DBhelperPT.init();

    int ret = await DBhelperPT.setPracTestList(n, id);
    return ret > 0 ? true : false;
  }
}
