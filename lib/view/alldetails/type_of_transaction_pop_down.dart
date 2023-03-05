import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplemoneymanager/view_model/transaction/transaction_db.dart';

class TypeOfSeeAllDetails extends StatelessWidget {
  const TypeOfSeeAllDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionDb>(
      builder: (context, transactionDb, child) {
        return PopupMenuButton<int>(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(
              50,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.only(
              right: 10.0,
            ),
            child: Icon(
              Icons.more_vert_outlined,
              size: 30,
              shadows: <Shadow>[Shadow(color: Colors.white, blurRadius: 15.0)],
              color: Colors.black,
            ),
          ),
          itemBuilder: (conext) => [
            PopupMenuItem(
              value: 1,
              child: const Text(
                "All",
              ),
              onTap: () {
                transactionDb.setshowCategory = "All";
                // context.read<TransactionDb>().notifyListeners();
              },
            ),
            PopupMenuItem(
              value: 2,
              child: const Text(
                "Income",
              ),
              onTap: () {
                transactionDb.setshowCategory = "Income";
                //  context.read<TransactionDb>().notifyListeners();
              },
            ),
            PopupMenuItem(
              value: 3,
              child: const Text(
                "Expense",
              ),
              onTap: () {
                transactionDb.setshowCategory = "Expense";
                // context.read<TransactionDb>().notifyListeners();
              },
            ),
          ],
        );
      },
    );
  }
}
