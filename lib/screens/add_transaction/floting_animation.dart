import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:simplemoneymanager/screens/add_transaction/screen_add_transaction.dart';

const double fabSize = 56;

class CustomFABWidget extends StatelessWidget {
  const CustomFABWidget({super.key});

  // final ContainerTransitionType transitionType;

  @override
  Widget build(BuildContext context) => OpenContainer(
        transitionDuration: const Duration(milliseconds: 700),
        openBuilder: (context, _) => const ScreenAddTransaction(),
        closedShape: const CircleBorder(),
        closedColor: Theme.of(context).primaryColor,
        closedBuilder: (context, openContainer) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          height: fabSize,
          width: fabSize,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
    ),
);
}