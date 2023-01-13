import 'package:learnsql/model/favourite/model/favListModel.dart';
import 'package:learnsql/model/favourite/utils/db_helper.dart';

class DBService {
  Future<List<favListModel>> getFav() async {
    await DBhelper.init();

    List<Map<String, dynamic>> favList = await DBhelper.details(favouriteTable);

    return favList.map((item) => favListModel.fromMap(item)).toList();
  }

  Future<List<favListModel>> getFavList() async {
    await DBhelper.init();

    List<Map<String, dynamic>> favList = await DBhelper.getfav();

    return favList.map((item) => favListModel.fromMap(item)).toList();
  }

  Future<bool> addFav(favListModel model) async {
    await DBhelper.init();

    int ret = await DBhelper.insert(favouriteTable, model);
    return ret > 0 ? true : false;
  }

  Future<bool> updateFav(favListModel model) async {
    await DBhelper.init();

    int ret = await DBhelper.update(favouriteTable, model);
    return ret > 0 ? true : false;
  }

  Future<bool> deleteFav(favListModel model) async {
    await DBhelper.init();

    int ret = await DBhelper.delete(favouriteTable, model);
    return ret > 0 ? true : false;
  }

  Future<bool> setFav(int n, int id) async {
    await DBhelper.init();

    int ret = await DBhelper.setfav(n, id);
    return ret > 0 ? true : false;
  }
}
