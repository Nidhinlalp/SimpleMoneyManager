import 'package:flutter/material.dart';
import 'package:simplemoneymanager/db_functions/category/category_db.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';

ValueNotifier<CategoryType> selectCategoryNotifire =
    ValueNotifier(CategoryType.income);

Future<void> showCategoryAddPopup(BuildContext context) async {
  final _nameEditingController = TextEditingController();
  showDialog(
    context: context,
    builder: (ctx) {
      return SimpleDialog(
        backgroundColor: const Color.fromARGB(
          255,
          172,
          160,
          172,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text('Add Category'),
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _nameEditingController,
              decoration: const InputDecoration(
                  labelText: 'Category Name',
                  floatingLabelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                  ))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: const [
                RadioButton(title: 'Income', type: CategoryType.income),
                RadioButton(title: 'Expense', type: CategoryType.expense),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(
                      255,
                      165,
                      147,
                      165,
                    ),
                    Color.fromARGB(
                      255,
                      162,
                      96,
                      160,
                    ),
                  ],
                ),
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 20,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.black,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  final _name = _nameEditingController.text;
                  if (_name.isEmpty) {
                    return;
                  }
                  final _type = selectCategoryNotifire.value;
                  final _category = CategoryModels(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    name: _name,
                    type: _type,
                  );

                  CategoryDb().insertCategory(_category);
                  Navigator.of(ctx).pop();
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      );
    },
  );
}

class RadioButton extends StatelessWidget {
  final String title;
  final CategoryType type;
  const RadioButton({
    super.key,
    required this.title,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
            valueListenable: selectCategoryNotifire,
            builder: (BuildContext ctx, CategoryType newCategory, Widget? _) {
              return Radio<CategoryType>(
                fillColor:
                    MaterialStateColor.resolveWith((states) => Colors.black),
                focusColor:
                    MaterialStateColor.resolveWith((states) => Colors.black),
                value: type,
                groupValue: newCategory,
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  selectCategoryNotifire.value = value;
                  selectCategoryNotifire.notifyListeners();
                },
              );
            }),
        Text(title),
      ],
    );
  }
}
