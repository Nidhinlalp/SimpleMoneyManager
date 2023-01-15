import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';

const CATEGORY_DB_NAME = 'category-database';

abstract class CatageryDbFunctions {
  Future<List<CategoryModels>> getCategories();
  Future<void> insertCategory(CategoryModels value);
  Future<void> deleteCategory(String categoryID);
}

class CategoryDb implements CatageryDbFunctions {
  CategoryDb._internal();

  static CategoryDb instance = CategoryDb._internal();

  factory CategoryDb() {
    return instance;
  }

  ValueNotifier<List<CategoryModels>> incomeCategoryListListener =
      ValueNotifier([]);
  ValueNotifier<List<CategoryModels>> expenseCategoryListListener =
      ValueNotifier([]);

  @override
  Future<void> insertCategory(CategoryModels value) async {
    final categoryDB = await Hive.openBox<CategoryModels>(CATEGORY_DB_NAME);
    await categoryDB.put(value.id, value);
    refreshUI();
  }

  @override
  Future<List<CategoryModels>> getCategories() async {
    final categoryDB = await Hive.openBox<CategoryModels>(CATEGORY_DB_NAME);
    return categoryDB.values.toList().reversed.toList();
  }

  Future<void> refreshUI() async {
    final allCategories = await getCategories();
    incomeCategoryListListener.value.clear();
    expenseCategoryListListener.value.clear();
    await Future.forEach(
      allCategories,
      (CategoryModels category) {
        if (category.type == CategoryType.income) {
          incomeCategoryListListener.value.add(category);
        } else {
          expenseCategoryListListener.value.add(category);
        }
      },
    );
    incomeCategoryListListener.notifyListeners();
    expenseCategoryListListener.notifyListeners();
  }

  @override
  Future<void> deleteCategory(String categoryID) async {
    final categoryDB = await Hive.openBox<CategoryModels>(CATEGORY_DB_NAME);
    await categoryDB.delete(categoryID);
    refreshUI();
  }
}
