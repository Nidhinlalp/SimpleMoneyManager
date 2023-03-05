import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simplemoneymanager/view/alldetails/searchaeealldetails.dart';
import 'package:simplemoneymanager/view/alldetails/seealldetailstile.dart';
import '../../../colors/colors.dart';
import 'filtter_of_see_all_details.dart';
import 'type_of_transaction_pop_down.dart';

class SeeAllDetails extends StatelessWidget {
  const SeeAllDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) =>
    //     context.read<TransactionDb>().overviewTransactions =
    //         context.read<TransactionDb>().transactionListNotifire);
    // context.read<TransactionDb>().refresh();
    // context.read<CategoryDb>().refreshUI();
    // context.read<TransactionDb>().showCategory = "All";
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
