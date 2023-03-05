import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:simplemoneymanager/colors/colors.dart';
import 'package:simplemoneymanager/view_model/category/category_db.dart';
import 'alert_snak_for_category.dart';

class IncomeCategoryList extends StatelessWidget {
  const IncomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryDb>(
      builder: (BuildContext ctx, newlIst, Widget? _) {
        return newlIst.incomeCategoryListListener.isEmpty
            ? Center(child: Lottie.asset('assets/images/empty.json'))
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (ctx, index) {
                  final category = newlIst.incomeCategoryListListener[index];
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
                    child: Container(
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(20),
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
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  alertAndSnakForCategory(context, category.id);
                                },
                                icon: const Icon(
                                  Icons.clear_outlined,
                                  shadows: <Shadow>[
                                    Shadow(
                                      color: Colors.white,
                                      blurRadius: 15.0,
                                    )
                                  ],
                                  color: Colors.black54,
                                ),
                              )
                            ],
                          ),
                          Center(
                            child: AutoSizeText(
                              category.name,
                              maxLines: 4,
                              style: const TextStyle(
                                fontSize: 24.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: newlIst.incomeCategoryListListener.length,
              );
      },
    );
  }
}