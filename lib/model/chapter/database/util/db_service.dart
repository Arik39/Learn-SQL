import 'package:learnsql/model/chapter/database/model/chapterListModel.dart';

import 'db_helper.dart';

class DBChapterService {
  Future<List<chapterListModel>> getChapter() async {
    await DBChapterhelper.init();

    List<Map<String, dynamic>> favList =
        await DBChapterhelper.details(chapterTable);

    return favList.map((item) => chapterListModel.fromMap(item)).toList();
  }

  Future<List<chapterListModel>> getFavList() async {
    await DBChapterhelper.init();

    List<Map<String, dynamic>> favList = await DBChapterhelper.getfav();

    return favList.map((item) => chapterListModel.fromMap(item)).toList();
  }

  Future<List<chapterListModel>> getSingleChapterDetail(int categoryId) async {
    await DBChapterhelper.init();

    List<Map<String, dynamic>> favList =
        await DBChapterhelper.getsingledetail(categoryId);

    return favList.map((item) => chapterListModel.fromMap(item)).toList();
  }

  Future<List<chapterListModel>> gettotalRead(int categoryId) async {
    await DBChapterhelper.init();

    List<Map<String, dynamic>> favList =
        await DBChapterhelper.gettotalread(categoryId);

    return favList.map((item) => chapterListModel.fromMap(item)).toList();
  }

  Future<List<chapterListModel>> getRead(int categoryId) async {
    await DBChapterhelper.init();

    List<Map<String, dynamic>> favList =
        await DBChapterhelper.getread(categoryId);

    return favList.map((item) => chapterListModel.fromMap(item)).toList();
  }

  Future<bool> addFav(chapterListModel model) async {
    await DBChapterhelper.init();

    int ret = await DBChapterhelper.insert(chapterTable, model);
    return ret > 0 ? true : false;
  }

  Future<bool> updateFav(chapterListModel model) async {
    await DBChapterhelper.init();

    int ret = await DBChapterhelper.update(chapterTable, model);
    return ret > 0 ? true : false;
  }

  Future<bool> deleteFav(chapterListModel model) async {
    await DBChapterhelper.init();

    int ret = await DBChapterhelper.delete(chapterTable, model);
    return ret > 0 ? true : false;
  }

  Future<bool> setFav(int n, int id) async {
    await DBChapterhelper.init();

    int ret = await DBChapterhelper.setfav(n, id);
    return ret > 0 ? true : false;
  }

  Future<bool> setRead(int n, int id) async {
    await DBChapterhelper.init();

    int ret = await DBChapterhelper.setread(n, id);
    return ret > 0 ? true : false;
  }
}
