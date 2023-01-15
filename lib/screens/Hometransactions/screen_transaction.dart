import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simplemoneymanager/db_functions/category/category_db.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';
import 'package:simplemoneymanager/screens/menu_bar_items/menu_bar.dart';
import 'package:simplemoneymanager/screens/Hometransactions/resent_transaction_heding.dart';
import 'package:simplemoneymanager/screens/Hometransactions/transaction_slidable.dart';
import '../../colors/colors.dart';
import '../add_transaction/floting_animation.dart';
import '../home/search_function/main_search.dart';
import 'carent_balance_card.dart';

class ScreenTransaction extends StatefulWidget {
  const ScreenTransaction({super.key});

  @override
  State<ScreenTransaction> createState() => _ScreenTransactionState();
}

class _ScreenTransactionState extends State<ScreenTransaction> {
  @override
  Widget build(BuildContext context) {
    TransactionDb.instance.refresh();
    CategoryDb.instance.refreshUI();
    return ValueListenableBuilder(
      valueListenable: transactionListNotifire,
      builder: (BuildContext ctx, List<TransactionModel> newList, Widget? _) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Center(
              child: Image.asset(
                'assets/images/money-transfer-2647242-2208355.png',
                fit: BoxFit.contain,
                height: 30,
              ),
            ),
            leading: const MenuBar(),
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: MySearchDelegate(),
                  );
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ],
            elevation: 0,
          ),
          backgroundColor: ColorConstants.kPrimaryColor,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //:::::::::::::::curent balance card:::::::::::::::::
                  const CurrentBalance(),
                  //::::::::::::RecentTransactionHeding:::::::::::;
                  const RecentTransactionHeding(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      //::::::::::::::strat of the home list::::::::::::::::
                      children: newList.isEmpty
                          ? [
                              const Text(
                                "Oops! No  Data 👎",
                              ),
                            ]
                          : List.generate(
                              //::::::::cheking1st page 5 item ::::::::::
                              newList.length > 5 ? 5 : newList.length,
                              (index) {
                                final value = newList[index];
                                return Column(
                                  children: [
                                    TransactionSlidable(value: value),
                                    const SizedBox(
                                      height: 10,
                                    )
                                  ],
                                );
                              },
                            ),
                    ),
                  )
                ],
              ),
            ),
          ),

          //:::::::::::flotting action button::::::::::::::
          floatingActionButton: const CustomFABWidget(),
        );
      },
    );
  }
}

//::::::::::::::::::::::::::::::::::::::::::MySearchDelegate search the trancaction::::::::::::::::

String parseDate(DateTime date) {
  final _date = DateFormat.MMMd().format(date);
  final splitedDate = _date.split(' ');
  return '${splitedDate.last}\n${splitedDate.first}';
}
