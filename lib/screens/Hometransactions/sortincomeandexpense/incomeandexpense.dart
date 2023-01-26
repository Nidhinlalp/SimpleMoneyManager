import 'package:flutter/foundation.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';

ValueNotifier incomtotel = ValueNotifier(0.0);
ValueNotifier expensetotel = ValueNotifier(0.0);
ValueNotifier totalbalanse = ValueNotifier(0.0);

void incomeandexpense() {
  incomtotel.value = 0;
  expensetotel.value = 0;
  totalbalanse.value = 0;
  final List<TransactionModel> value =
      TransactionDb.transactionListNotifire.value;

  for (int i = 0; i < value.length; i++) {
    if (CategoryType.income == value[i].category.type) {
      incomtotel.value = incomtotel.value + value[i].amount;
    } else {
      expensetotel.value = expensetotel.value + value[i].amount;
    }
  }
  totalbalanse.value = incomtotel.value - expensetotel.value;
}
