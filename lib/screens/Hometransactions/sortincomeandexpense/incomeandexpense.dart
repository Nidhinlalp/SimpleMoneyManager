import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';

// ValueNotifier incomtotel = ValueNotifier(0.0);
// ValueNotifier expensetotel = ValueNotifier(0.0);
// ValueNotifier totalbalanse = ValueNotifier(0.0);

class IncomeAndExpence with ChangeNotifier {
  double incomtotel = 0;
  double expensetotel = 0;
  double totalbalanse = 0;

  void incomeandexpense(List<TransactionModel> listofModel) {
    incomtotel = 0;
    expensetotel = 0;
    totalbalanse = 0;

    final List<TransactionModel> value = listofModel;

    for (int i = 0; i < value.length; i++) {
      if (CategoryType.income == value[i].category.type) {
        incomtotel = incomtotel + value[i].amount;
      } else {
        expensetotel = expensetotel + value[i].amount;
      }
    }
    totalbalanse = incomtotel - expensetotel;
    notifyListeners();
  }
}
