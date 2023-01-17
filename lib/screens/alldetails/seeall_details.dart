import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';
import 'package:simplemoneymanager/screens/hometransactions/transaction_slidable.dart';
import '../../../colors/colors.dart';
import '../home/search_function/main_search.dart';
import 'filtter_of_see_all_details.dart';
import 'type_of_transaction_pop_down.dart';

ValueNotifier showCategory = ValueNotifier("All");

class SeeAllDetails extends StatefulWidget {
  const SeeAllDetails({super.key});

  @override
  State<SeeAllDetails> createState() => _SeeAllDetailsState();
}

class _SeeAllDetailsState extends State<SeeAllDetails> {
  @override
  Widget build(BuildContext context) {
    showCategory.value = "All";
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          'My Transactions',
          style: GoogleFonts.roboto(fontSize: 25, color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
              shadows: <Shadow>[Shadow(color: Colors.white, blurRadius: 15.0)],
            )),
        actions: [
          //:::::::::search botton:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
            icon: const Icon(
              Icons.search,
              size: 30,
              shadows: <Shadow>[Shadow(color: Colors.white, blurRadius: 15.0)],
              color: Colors.black,
            ),
          ),
          //:::::::::::::::::::::::::::::::::filtter:::::::::::::::::::::::::::::::::::::::::::::::::
          const FiltterSeeAllDetails(),
          //:::::::::typesof see all detials:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
          const TypeOfSeeAllDetails(),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: TransactionDb.transactionListNotifire,
        builder: (context, newList, _) {
          return ValueListenableBuilder(
            valueListenable: showCategory,
            builder: (context, showCategory, widget) {
              var displayList = [];
              if (showCategory == "Income") {
                List<TransactionModel> allincometransaction = [];
                allincometransaction = newList
                    .where((element) => element.type == CategoryType.income)
                    .toList();
                displayList = allincometransaction;
              } else if (showCategory == "Expense") {
                List<TransactionModel> allincometransaction = [];
                allincometransaction = newList
                    .where((element) => element.type == CategoryType.expense)
                    .toList();
                displayList = allincometransaction;
              } else {
                displayList = newList;
              }
              return displayList.isEmpty
                  ? Center(child: Lottie.asset('assets/images/empty.json'))
                  : ListView.builder(
                      itemCount: displayList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, bottom: 5, top: 10),
                          child: TransactionSlidable(value: displayList[index]),
                        );
                      },
                    );
            },
          );
        },
      ),
    );
  }
}
