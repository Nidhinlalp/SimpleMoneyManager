import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:simplemoneymanager/colors/colors.dart';
import 'package:simplemoneymanager/screens/hometransactions/screen_transaction.dart';
import 'package:simplemoneymanager/screens/update/edit.dart';
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
              alertAndSnakBar(context, modelId: value.id!);
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
          //::::::::::::::::Edite the transection::::::::::::::::::::::;
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
            label: 'Edit',
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
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: 15,
                spreadRadius: 1,
                offset: const Offset(5, 5),
              ),
              const BoxShadow(
                color: Colors.white,
                blurRadius: 15,
                spreadRadius: 1,
                offset: Offset(-5, -5),
              ),
            ],
          ),
          //:::::::::::::::::::::::::start the list tile::::::::
          child: ListTile(
            contentPadding: const EdgeInsets.all(8),
            dense: true,

            //::::::::::::::show circledate:::::::::::::::::::
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              // ignore: sort_child_properties_last
              child: value.type == CategoryType.income
                  ? const Icon(Icons.arrow_upward_outlined)
                  : const Icon(Icons.arrow_downward_outlined),

              radius: 30,
            ),
            //::::::::::::::show amound::::::::::::::::::::::::

            trailing: value.type == CategoryType.income
                ? Text(
                    '+ ${value.amount}',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Text(
                    '- ${value.amount}',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            //::::::::::shwo category:::::::::::::::::::::::::
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  value.category.name,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  //::::::::show the date in circleavathar::::::::
                  parseDate(value.date),
                  // ignore: prefer_const_constructors
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                      fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            // subtitle:,
          ),
        ),
      ),
    );
  }
}
