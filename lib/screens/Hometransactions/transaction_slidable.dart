import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:simplemoneymanager/screens/Hometransactions/screen_transaction.dart';
import 'package:simplemoneymanager/screens/Update/edit.dart';
import '../../models/cetegory/cetegory_models.dart';
import '../../models/transaction/transaction_model.dart';
import 'alert_snakbar_for_home.dart';

class TransactionSlidable extends StatelessWidget {
  const TransactionSlidable({
    Key? key,
    required this.value,
  }) : super(key: key);

  final TransactionModel value;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(value.id!),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          //::::::::::::::::delate the transaction::::::::::::::::::::
          SlidableAction(
            borderRadius: BorderRadius.circular(
              15.0,
            ),
            flex: 2,
            onPressed: (context) {
              alertAndSnakBar(context, value.id!);
              //  TransactionDb.instance.deleteTransaction(value.id!);
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          const SizedBox(
            width: 3,
          ),
          //:::::::::::::::;edite the transection::::::::::::::::::::::;
          SlidableAction(
            borderRadius: BorderRadius.circular(
              15.0,
            ),
            flex: 2,
            onPressed: (context) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditeTransaction(value: value),
                ),
              );
            },
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.edit_note,
            label: 'Edite',
          ),
        ],
      ),
      child: Card(
        elevation: 10.0,
        shadowColor: Colors.grey.withOpacity(
          0.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15.0,
          ),
        ),
        child: Container(
          height: 75,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 49, 119, 172),
                Color.fromARGB(77, 117, 167, 213),
              ],
            ),
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          //:::::::::::::::::::::::::start the list tile::::::::::::::::::::;
          child: ListTile(
            contentPadding: const EdgeInsets.all(5),
            visualDensity: const VisualDensity(horizontal: 4, vertical: 2),
            leading: CircleAvatar(
              backgroundColor: value.type == CategoryType.income
                  ? Colors.green
                  : Colors.redAccent[700],
              radius: 30,
              child: Text(
                parseDate(value.date),
                textAlign: TextAlign.center,
              ),
            ),
            trailing: Text(
              '₹ ${value.amount}',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            title: Text(
              value.category.name,
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
