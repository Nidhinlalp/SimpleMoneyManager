import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplemoneymanager/view_model/category/category_db.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';

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
        Consumer<CategoryDb>(builder: (ctx, newCategory, _) {
          return Radio<CategoryType>(
            fillColor: MaterialStateColor.resolveWith((states) => Colors.black),
            focusColor:
                MaterialStateColor.resolveWith((states) => Colors.black),
            value: type,
            groupValue: newCategory.selectCategoryNotifire,
            onChanged: (value) {
              if (value == null) {
                return;
              }
              newCategory.selectCategoryNotifire = value;
              newCategory.notifyListeners();
            },
          );
        }),
        Text(title),
      ],
    );
  }
}
