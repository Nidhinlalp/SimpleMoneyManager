import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import '../../db_functions/transaction/transaction_db.dart';

alertAndSnakBar(BuildContext context, String id) {
  showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        title: const Text(
          'Alert',
        ),
        content: Container(
          width: 50.0,
          height: 30.0,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white30,
          ),
          child: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                  'Do you Want To Delete',
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            child: const Text('Confirm'),
            onPressed: () {
              TransactionDb.instance.deleteTransaction(id);
              Navigator.of(context).pop(true);
              final snackBar = SnackBar(
                duration: const Duration(milliseconds: 500),
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
}
