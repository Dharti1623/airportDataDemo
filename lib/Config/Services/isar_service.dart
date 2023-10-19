import 'dart:io';

import 'package:airports/Data/Localization/Entities/airport_Entity.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    Directory? directory;
    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = Directory('/storage/emulated/0/Download');
      if (!await directory.exists()) directory = await getExternalStorageDirectory();
    }
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [AirportEntitiesSchema],
        inspector: true, directory: directory!.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  // Future<void> insertUser(LoginEntities newUser) async {
  //   final isar = await db;
  //   isar.writeTxnSync<int>(() => isar.loginEntities.putSync(newUser));
  // }

  // Future<List<IsFavoriteEntities>> getAllFavorites() async {
  //   final isar = await db;
  //   return await isar.isFavoriteEntities.where().findAll();
  // }

/*  Future<void> insertCategory(Categories newCategory) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.categories.putSync(newCategory));
  }

  Future<void> updateCategory(int oldCategoryId, String newCategory) async {
    final isar = await db;
    final catData = await isar.categories.get(oldCategoryId);
    catData?.categoryName = newCategory;
    isar.writeTxnSync<int>(() => isar.categories.putSync(catData!));
  }

  Future<void> deleteCategory(int categoryId) async {
    final isar = await db;
    await isar.writeTxn(() async {
 await isar.categories.delete(categoryId);
      // print('Recipe deleted: $success');
    });
  }

  Future<List<Categories>> getAllCategories() async {
    final isar = await db;
    return await isar.categories.where().findAll();
  }

  Stream<List<Categories>> listenToCategories() async* {
    final isar = await db;
    yield* isar.categories.where().watch(fireImmediately: true);
  }*/
}
