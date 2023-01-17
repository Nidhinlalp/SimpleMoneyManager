import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../db_functions/category/category_db.dart';
import '../../../db_functions/transaction/transaction_db.dart';
import '../../../models/transaction/transaction_model.dart';
import '../../hometransactions/transaction_slidable.dart';

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
          color: Colors.black,
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
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
      valueListenable: TransactionDb.transactionListNotifire,
      builder: (BuildContext ctx, List<TransactionModel> newList, Widget? _) {
        List<TransactionModel> searchResult = [];
        searchResult = newList
            .where((element) => element.category.name.contains(query))
            .toList();
        return searchResult.isEmpty
            ? Center(
                child:
                    Lottie.asset('assets/images/nosearchresultsanimation.json'),
              )
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
      },
    );
  }
}
