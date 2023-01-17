import 'package:flutter/material.dart';

class FiltterSeeAllDetails extends StatelessWidget {
  const FiltterSeeAllDetails({
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
          right: 30.0,
        ),
        child: Icon(
          Icons.filter_list_rounded,
          size: 30,
          shadows: <Shadow>[Shadow(color: Colors.white, blurRadius: 15.0)],
          color: Colors.black,
        ),
      ),
      itemBuilder: (conext) => [
        const PopupMenuItem(
          value: 1,
          child: Text(
            "All",
          ),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text(
            "Today",
          ),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text(
            "Yesterday",
          ),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text(
            "Week",
          ),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text(
            "Month",
          ),
        ),
      ],
    );
  }
}
