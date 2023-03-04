import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';

class CategoryDb with ChangeNotifier {
  String? categoryID;
  CategoryModels? selectedcategorymodels;
  late DateTime selectDate = DateTime.now();
  CategoryType selectCategorytype = (CategoryType.income);
  CategoryType selectCategoryNotifire = (CategoryType.income);
  static const categoryDbName = 'category-database';

  set setcategoryID(String categoryid) {
    categoryID = categoryid;
    notifyListeners();
  }

  set setselectedcategorymodels(CategoryModels setselectcategorymodels) {
    selectedcategorymodels = setselectcategorymodels;
    notifyListeners();
  }

  List<CategoryModels> incomeCategoryListListener = [];

  List<CategoryModels> expenseCategoryListListener = [];

  Future<void> insertCategory(CategoryModels value) async {
    final categoryDB = await Hive.openBox<CategoryModels>(categoryDbName);
    await categoryDB.put(value.id, value);
    refreshUI();
  }

  Future<List<CategoryModels>> getCategories() async {
    final categoryDB = await Hive.openBox<CategoryModels>(categoryDbName);
    return categoryDB.values.toList().reversed.toList();
  }

  Future<void> refreshUI() async {
    final allCategories = await getCategories();
    incomeCategoryListListener.clear();
    expenseCategoryListListener.clear();
    await Future.forEach(
      allCategories,
      (CategoryModels category) {
        if (category.type == CategoryType.income) {
          incomeCategoryListListener.add(category);
        } else {
          expenseCategoryListListener.add(category);
        }
      },
    );
    notifyListeners();
  }

  Future<void> deleteCategory(String categoryID) async {
    final categoryDB = await Hive.openBox<CategoryModels>(categoryDbName);
    await categoryDB.delete(categoryID);
    refreshUI();
  }
}
