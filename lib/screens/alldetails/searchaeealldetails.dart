import 'package:flutter/material.dart';
import 'package:simplemoneymanager/colors/colors.dart';
import 'package:simplemoneymanager/constants/notifier.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';

//ValueNotifier<List<TransactionModel>> founduser =
//  ValueNotifier(overviewTransactions.value);

class SearchAllDetails extends StatefulWidget {
  const SearchAllDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchAllDetails> createState() => _SearchAllDetailsState();
}

class _SearchAllDetailsState extends State<SearchAllDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 23.0, right: 23, top: 20, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) => searchresult(value),
            decoration: InputDecoration(
              hintText: 'Search',
              suffixIcon: const Icon(
                Icons.search_rounded,
                color: Colors.black38,
                size: 30,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: bgColor,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  searchresult(String qury) {
    if (qury.isEmpty) {
      overviewTransactions.value = TransactionDb.transactionListNotifire.value;
    } else {
      overviewTransactions.value = overviewTransactions.value
          .where(
              (element) => element.category.name.toLowerCase().contains(qury))
          .toList();
    }
  }
}
