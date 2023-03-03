import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
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
          size: 30,
          shadows: <Shadow>[Shadow(color: Colors.white, blurRadius: 15.0)],
          color: Colors.black54,
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
        size: 30,
        shadows: <Shadow>[Shadow(color: Colors.white, blurRadius: 15.0)],
        color: Colors.black54,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // context.read<TransactionDb>().refresh();
    // context.read<CategoryDb>().refreshUI();
    return Consumer<TransactionDb>(
      builder: (BuildContext ctx, newList, Widget? _) {
        List<TransactionModel> searchResult = [];
        searchResult = newList.transactionListNotifire
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
