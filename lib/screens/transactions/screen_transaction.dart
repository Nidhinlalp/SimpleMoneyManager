import 'package:animate_gradient/animate_gradient.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:simplemoneymanager/alldetails/seeall_details.dart';
import 'package:simplemoneymanager/db_functions/category/category_db.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';
import 'package:simplemoneymanager/screens/transactions/menu_bar.dart';
import '../add_transaction/floting_animation.dart';

class ScreenTransaction extends StatelessWidget {
  const ScreenTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionDb.instance.refresh();
    CategoryDb.instance.refreshUI();
    return ValueListenableBuilder(
      valueListenable: transactionListNotifire,
      builder: (BuildContext ctx, List<TransactionModel> newList, Widget? _) {
        return AnimateGradient(
          primaryBegin: Alignment.topLeft,
          primaryEnd: Alignment.bottomLeft,
          secondaryBegin: Alignment.bottomLeft,
          secondaryEnd: Alignment.topRight,
          primaryColors: const [
            Color.fromARGB(255, 52, 141, 214),
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 52, 141, 214),
          ],
          secondaryColors: const [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 52, 141, 214),
            Color.fromARGB(255, 255, 255, 255),
          ],
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              
              title: Center(
                child: Image.asset(
                  'assets/images/money-transfer-2647242-2208355.png',
                  fit: BoxFit.contain,
                  height: 30,
                ),
              ),
             
              leading: const MenuBar(),
              actions: [
                IconButton(
                  onPressed: () {
                    //showSearch(context: context, delegate: SearchWidget());
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ],
              elevation: 0,
            ),
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 410,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 40,
                                left: 20,
                                right: 20,
                              ),
                              child: Container(
                                height: 340,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Colors.white30,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      50,
                                    ),
                                    topRight: Radius.circular(
                                      50,
                                    ),
                                    bottomLeft: Radius.circular(
                                      50,
                                    ),
                                    bottomRight: Radius.circular(
                                      50,
                                    ),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 190, 115, 190),
                                      blurRadius: 20,
                                      spreadRadius: 1,
                                      offset: Offset.infinite,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        top: 50,
                                        bottom: 30,
                                      ),
                                      child: Text(
                                        'CURRENT BALANCE',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      '₹ 4800/-',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(
                                        10.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: const [
                                          CircleAvatar(
                                            // ignore: sort_child_properties_last
                                            child: Icon(
                                              Icons.arrow_downward,
                                              color: Colors.black,
                                            ),
                                            radius: 25,
                                            backgroundColor: Colors.white30,
                                          ),
                                          CircleAvatar(
                                            // ignore: sort_child_properties_last
                                            child: Icon(
                                              Icons.arrow_upward,
                                              color: Colors.black,
                                            ),
                                            radius: 25,
                                            backgroundColor: Colors.white30,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      child: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: const [
                                            Text(
                                              'Income',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              'Expense',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(
                                        10.0,
                                      ),
                                      child: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: const [
                                            Text(
                                              '₹ 50000',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                                fontSize: 17,
                                              ),
                                            ),
                                            Text(
                                              '₹ 2000',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                                fontSize: 17,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 350,
                          left: 70,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SeeAllDetails(),
                                ),
                              );
                            },
                            child: Card(
                              color: const Color.fromARGB(255, 243, 239, 239),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  50.0,
                                ),
                              ),
                              child: const SizedBox(
                                height: 50,
                                width: 250,
                                child: Center(
                                  child: Text(
                                    'See all details',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(
                                        255,
                                        84,
                                        87,
                                        86,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // resent transaction
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(
                        20.0,
                      ),
                      itemBuilder: (ctx, index) {
                        final value = newList[index];
                        return Slidable(
                          key: Key(value.id!),
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                borderRadius: BorderRadius.circular(
                                  15.0,
                                ),
                                flex: 2,
                                onPressed: (context) {
                                  TransactionDb.instance
                                      .deleteTransaction(value.id!);
                                  final snackBar = SnackBar(
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
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                              SlidableAction(
                                borderRadius: BorderRadius.circular(
                                  15.0,
                                ),
                                onPressed: (context) => (context) {},
                                backgroundColor: const Color(
                                  0xFF0392CF,
                                ),
                                foregroundColor: Colors.white,
                                icon: Icons.edit,
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
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color.fromARGB(255, 214, 202, 214),
                                    Color.fromARGB(255, 236, 133, 232),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(
                                  12,
                                ),
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor:
                                      value.type == CategoryType.income
                                          ? Colors.green
                                          : Colors.redAccent[700],
                                  radius: 50,
                                  child: Text(
                                    parseDate(value.date),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                title: Text(
                                  '₹ ${value.amount}',
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  value.category.name,
                                  style: const TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (ctx, index) {
                        return const SizedBox(
                          height: 30,
                        );
                      },
                      itemCount: newList.length,
                    ),
                  )
                ],
              ),
            ),

            //flotting action button
                      floatingActionButton: const CustomFABWidget(),
                      
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const ScreenAddTransaction(),
            //       ),
            //     );
            //   },
            //   // ignore: sort_child_properties_last
            //   child: const Icon(
            //     Icons.add,
            //   ),
            //   backgroundColor: const Color.fromARGB(255, 201, 122, 198),
            //   foregroundColor: const Color.fromARGB(255, 10, 10, 10),
            //   splashColor: const Color.fromARGB(255, 245, 245, 245),
            // ),
          ),
        );
      },
    );
  }
}

String parseDate(DateTime date) {
  final _date = DateFormat.MMMd().format(date);
  final splitedDate = _date.split(' ');
  return '${splitedDate.last}\n${splitedDate.first}';
}
