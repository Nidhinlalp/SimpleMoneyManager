import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:simplemoneymanager/db_functions/category/category_db.dart';
import '../../models/cetegory/cetegory_models.dart';

class ExpenseCategoyList extends StatelessWidget {
  const ExpenseCategoyList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDb().expenseCategoryListListener,
      builder: (BuildContext ctx, List<CategoryModels> newlIst, Widget? _) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.separated(
            itemBuilder: (ctx, index) {
              final category = newlIst[index];
              return Slidable(
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                      flex: 2,
                      onPressed: (context) {
                        CategoryDb.instance.deleteCategory(category.id);
                      },
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                    SlidableAction(
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ),
                      onPressed: (context) => (context) {},
                      backgroundColor: const Color(
                        0xFF0392CF,
                      ),
                      foregroundColor: Colors.white,
                      icon: Icons.edit,
                      label: 'Edit',
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                    top: 10.0,
                    left: 25.0,
                    right: 25.0,
                  ),
                  child: Card(
                    elevation: 10.0,
                    shadowColor: Colors.grey.withOpacity(
                      0.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color.fromARGB(
                              255,
                              172,
                              160,
                              172,
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
                      child: ListTile(
                        title: Text(
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
            separatorBuilder: (ctx, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: newlIst.length,
          ),
        );
      },
    );
  }
}
