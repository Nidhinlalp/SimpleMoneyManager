import 'package:flutter/material.dart';

import '../../../db_functions/category/category_db.dart';
import '../../../db_functions/transaction/transaction_db.dart';
import '../../../models/transaction/transaction_model.dart';
import '../../Hometransactions/transaction_slidable.dart';

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(
          Icons.clear,
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    TransactionDb.instance.refresh();
    CategoryDb.instance.refreshUI();
    return ValueListenableBuilder(
        valueListenable: transactionListNotifire,
        builder: (BuildContext ctx, List<TransactionModel> newList, Widget? _) {
          List<TransactionModel> searchResult = [];
          searchResult = newList
              .where((element) => element.category.name.contains(query))
              .toList();
          return searchResult.isEmpty
              ? (const Center(child: Text("Oops! No search Result 🥲")))
              : ListView.separated(
                  padding: const EdgeInsets.all(20.0),
                  itemBuilder: (ctx, index) {
                    final value = searchResult[index];

                    return TransactionSlidable(value: value);
                  },
                  separatorBuilder: (ctx, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: searchResult.length,
                );
        });
  }
}
