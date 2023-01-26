import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:simplemoneymanager/colors/colors.dart';
import 'package:simplemoneymanager/db_functions/category/category_db.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';

ValueNotifier<CategoryType> selectCategoryNotifire =
    ValueNotifier(CategoryType.income);

Future<void> showCategoryAddPopup(BuildContext context) async {
  final nameEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  showDialog(
    context: context,
    builder: (ctx) {
      return Form(
        key: formKey,
        child: SimpleDialog(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Add Category'),
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      blurRadius: 15,
                      spreadRadius: 1,
                      offset: const Offset(5, 5),
                    ),
                    const BoxShadow(
                      color: Colors.white70,
                      blurRadius: 15,
                      spreadRadius: 1,
                      offset: Offset(-5, -5),
                    ),
                  ],
                ),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Category is empty';
                    }
                    return null;
                  },
                  controller: nameEditingController,
                  decoration: InputDecoration(
                    hintText: 'Category ',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: bgColor,
                      ),
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: bgColor,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: bgColor,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: bgColor,
                      ),
                    ),
                  ),
                ),
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
                  color: bgColor,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      blurRadius: 15,
                      spreadRadius: 1,
                      offset: const Offset(5, 5),
                    ),
                    const BoxShadow(
                      color: Colors.white,
                      blurRadius: 15,
                      spreadRadius: 1,
                      offset: Offset(-5, -5),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 20,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.black,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final name = nameEditingController.text;
                      if (name.isEmpty) {
                        return;
                      }
                      final type = selectCategoryNotifire.value;
                      final category = CategoryModels(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        name: name,
                        type: type,
                      );

                      CategoryDb().insertCategory(category);
                      Navigator.of(ctx).pop();
                      final snackBar = SnackBar(
                        elevation: 0,
                        duration: const Duration(milliseconds: 500),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'On Snap!',
                          message: 'Category Add Successfully !',
                          contentType: ContentType.success,
                        ),
                      );

                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);
                    }
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
        ),
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
