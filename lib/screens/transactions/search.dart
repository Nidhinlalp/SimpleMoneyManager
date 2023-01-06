// import 'package:flutter/material.dart';
// import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
// import 'package:simplemoneymanager/screens/transactions/screen_transaction.dart';
// import '../../models/cetegory/cetegory_models.dart';
// import '../../models/transaction/transaction_model.dart';

// class SearchWidget extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: (() {
//           query = '';
//         }),
//         icon: const Icon(
//           Icons.clear,
//         ),
//       ),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       icon: AnimatedIcon(
//         icon: AnimatedIcons.menu_arrow,
//         progress: transitionAnimation,
//       ),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: transactionListNotifire,
//       builder: ((BuildContext context, List<TransactionModel> transactionList,
//           Widget? child) {
//         return ListView.builder(
//           itemBuilder: (ctx, index) {
//             final data = transactionList[index];
//             if (data.notes.toLowerCase().contains(
//                   query.toLowerCase(),
//                 )) {
//               return Column(
//                 children: [
//                   ListTile(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: ((context) {
//                             return const ScreenTransaction();
//                           }),
//                         ),
//                       );
//                     },
//                     title: Text(data.notes),
//                     leading: CircleAvatar(
//                         backgroundColor:data.type == CategoryType.income
//                             ? Colors.green
//                             : Colors.redAccent[700],
//                         radius: 50,
//                         child: Text(
//                           parseDate(data.date),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                   ),
//                   const Divider()
//                 ],
//               );
//             } else {
//               return Container();
//             }
//           },
//           itemCount: transactionList.length,
//         );
//       }),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: transactionListNotifire,
//       builder: ((BuildContext context, List<TransactionModel> transactionList,
//           Widget? child) {
//         return ListView.builder(
//           itemBuilder: (ctx, index) {
//             final data = transactionList[index];
//             if (data.notes.toLowerCase().contains(
//                   query.toLowerCase(),
//                 )) {
//               return Column(
//                 children: [
//                   ListTile(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: ((context) {
//                             return const ScreenTransaction();
//                           }),
//                         ),
//                       );
//                     },
//                     title: Text(data.notes),
//                   ),
//                   const Divider()
//                 ],
//               );
//             } else {
//               return Container();
//             }
//           },
//           itemCount: transactionList.length,
//         );
//       }),
//     );
//   }
// }
