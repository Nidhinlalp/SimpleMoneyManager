import 'package:flutter/material.dart';
import 'package:simplemoneymanager/colors/colors.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';
import '../alldetails/seeall_details.dart';

class RecentTransactionHeding extends StatelessWidget {
  const RecentTransactionHeding({
    Key? key,
    required this.newList,
  }) : super(key: key);

  final List<TransactionModel> newList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35.0, right: 35.0, top: 35.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Recent Tranasaction',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SeeAllDetails(),
                ),
              );
            },
            child: newList.isEmpty
                ? const Text(
                    'No Data !',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 22,
                      letterSpacing: 1.5,
                    ),
                  )
                : Container(
                    height: 30,
                    width: 85,
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(50),
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
                    child: const Center(
                      child: Text(
                        'View All',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
