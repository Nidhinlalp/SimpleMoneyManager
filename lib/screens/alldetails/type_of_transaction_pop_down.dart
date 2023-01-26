import 'package:flutter/material.dart';
import 'package:simplemoneymanager/constants/notifier.dart';

class TypeOfSeeAllDetails extends StatelessWidget {
  const TypeOfSeeAllDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(
          50,
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.only(
          right: 10.0,
        ),
        child: Icon(
          Icons.more_vert_outlined,
          size: 30,
          shadows: <Shadow>[Shadow(color: Colors.white, blurRadius: 15.0)],
          color: Colors.black,
        ),
      ),
      itemBuilder: (conext) => [
        PopupMenuItem(
          value: 1,
          child: const Text(
            "All",
          ),
          onTap: () {
            showCategory.value = "All";
          },
        ),
        PopupMenuItem(
          value: 2,
          child: const Text(
            "Income",
          ),
          onTap: () {
            showCategory.value = "Income";
          },
        ),
        PopupMenuItem(
          value: 3,
          child: const Text(
            "Expense",
          ),
          onTap: () {
            showCategory.value = "Expense";
          },
        ),
      ],
    );
  }
}
