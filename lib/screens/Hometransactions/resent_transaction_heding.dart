import 'package:flutter/material.dart';
import '../../alldetails/seeall_details.dart';

class RecentTransactionHeding extends StatelessWidget {
  const RecentTransactionHeding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 35.0,
        right: 35.0,
        top: 35.0,
      ),
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
            child: Container(
              height: 30,
              width: 85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color.fromARGB(255, 196, 201, 122),
                    Color.fromARGB(255, 221, 145, 254),
                  ],
                ),
              ),
              child: const Center(
                child: Text(
                  'View All',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
