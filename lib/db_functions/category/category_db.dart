import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';

abstract class CatageryDbFunctions {
  Future<List<CategoryModels>> getCategories();
  Future<void> insertCategory(CategoryModels value);
  Future<void> deleteCategory(String categoryID);
}

class CategoryDb implements CatageryDbFunctions {
  static const categoryDbName = 'category-database';

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
    final categoryDB = await Hive.openBox<CategoryModels>(categoryDbName);
    await categoryDB.put(value.id, value);
    refreshUI();
  }

  @override
  Future<List<CategoryModels>> getCategories() async {
    final categoryDB = await Hive.openBox<CategoryModels>(categoryDbName);
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
    final categoryDB = await Hive.openBox<CategoryModels>(categoryDbName);
    await categoryDB.delete(categoryID);
    refreshUI();
  }
}
