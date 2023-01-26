import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';
import 'package:simplemoneymanager/screens/alldetails/searchaeealldetails.dart';
import 'package:simplemoneymanager/screens/alldetails/seealldetailstile.dart';
import '../../../colors/colors.dart';
import 'filtter_of_see_all_details.dart';
import 'type_of_transaction_pop_down.dart';

ValueNotifier showCategory = ValueNotifier("All");

ValueNotifier<List<TransactionModel>> overviewTransactions =
    ValueNotifier(TransactionDb.transactionListNotifire.value);

class SeeAllDetails extends StatefulWidget {
  const SeeAllDetails({super.key});

  @override
  State<SeeAllDetails> createState() => _SeeAllDetailsState();
}

class _SeeAllDetailsState extends State<SeeAllDetails> {
  @override
  void initState() {
    overviewTransactions.value = TransactionDb.transactionListNotifire.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    showCategory.value = "All";
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        //centerTitle: true,
        title: Text(
          'Over View',
          style: GoogleFonts.roboto(fontSize: 25, color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
              shadows: <Shadow>[Shadow(color: Colors.white, blurRadius: 15.0)],
            )),
        actions: const [
          //:::::::::::::::::::::::::::::::::filtter:::::::::::::::::::::::::::::::::::::::::::::::::::::
          FiltterSeeAllDetails(),
          //:::::::::typesof see all detials:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
          TypeOfSeeAllDetails(),
        ],
      ),
      body: Column(
        children: const [
          SearchAllDetails(),
          Expanded(
            child: SeeAllDetailsTiles(),
          )
        ],
      ),
    );
  }
}
