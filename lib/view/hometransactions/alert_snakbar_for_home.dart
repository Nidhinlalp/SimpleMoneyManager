import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplemoneymanager/view_model/category/category_db.dart';
import '../../view_model/transaction/transaction_db.dart';

alertAndSnakBar(BuildContext context, {required String modelId}) {
  showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Consumer2<TransactionDb, CategoryDb>(
          builder: (BuildContext context, value, value2, Widget? child) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              title: const Text("Confirm"),
              content: const Text("Are you sure you wish to delete this item?"),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                TextButton(
                  child: const Text(
                    "Delete",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  onPressed: () async {
                    await context
                        .read<TransactionDb>()
                        .deleteTransaction(modelId);
                    Navigator.of(context).pop(true);
                    value.refresh();
                    value2.refreshUI();

                    value.incomeandexpense(value.transactionListNotifire);
                    value.notifyListeners();

                    final snackBar = SnackBar(
                      duration: const Duration(milliseconds: 600),
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: 'On Snap!',
                        message: 'You Deleted One item !',
                        contentType: ContentType.failure,
                      ),
                    );

                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  },
                ),
              ],
            );
          },
        );
      });
}
