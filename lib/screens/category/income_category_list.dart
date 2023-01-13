import 'package:flutter/material.dart';
import 'package:simplemoneymanager/db_functions/category/category_db.dart';

import '../../models/cetegory/cetegory_models.dart';
import 'alert_snak_for_category.dart';

class IncomeCategoryList extends StatelessWidget {
  const IncomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDb().incomeCategoryListListener,
      builder: (BuildContext ctx, List<CategoryModels> newlIst, Widget? _) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),

          itemBuilder: (ctx, index) {
            final category = newlIst[index];
            // delete
            return Card(
              margin: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 20,
              ),
              elevation: 10.0,
              shadowColor: Colors.grey.withOpacity(
                0.5,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
              ),
              child: InkWell(
                onLongPress: () {
               alertAndSnakForCategory(context,category.id);
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromARGB(255, 49, 119, 172),
                        Color.fromARGB(77, 117, 167, 213),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: ListTile(
                    title: Center(
                      child: Text(
                        category.name,
                        style: const TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: newlIst.length,
        );
      },
    );
  }
}
