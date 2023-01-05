
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';

const CATEGORY_DB_NAME = 'category-database';

abstract class CatageryDbFunctions {
  Future<List<CategoryModels>> getCategories();
  Future<void> insertCategory(CategoryModels value);
  Future <void> deleteCategory(String categoryID);
}

class CategoryDb implements CatageryDbFunctions {

CategoryDb._internal();

static CategoryDb instance =CategoryDb._internal();

factory CategoryDb (){
  return instance;
}

  ValueNotifier<List<CategoryModels>> incomeCategoryListListener = ValueNotifier([]);
  ValueNotifier<List<CategoryModels>> expenseCategoryListListener = ValueNotifier([]);

  @override
  Future<void> insertCategory(CategoryModels value) async {
    final _categoryDB = await Hive.openBox<CategoryModels>(CATEGORY_DB_NAME);
    await _categoryDB.put(value.id,value);
     refreshUI();
  }

  @override
  Future<List<CategoryModels>> getCategories() async {
    final _categoryDB = await Hive.openBox<CategoryModels>(CATEGORY_DB_NAME);
    return _categoryDB.values.toList();
  }

  Future<void> refreshUI() async {
    final _allCategories = await getCategories();
    incomeCategoryListListener.value.clear();
    expenseCategoryListListener.value.clear();
    await Future.forEach(
      _allCategories,
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
  Future<void> deleteCategory(String categoryID) async{
    final _categoryDB =await Hive.openBox<CategoryModels>(CATEGORY_DB_NAME);
   await _categoryDB.delete(categoryID);
   refreshUI();
  }
}
