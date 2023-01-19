import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hive/hive.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplemoneymanager/constants/constants.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';
import 'package:simplemoneymanager/screens/menu_bar_items/about.dart';
import 'package:simplemoneymanager/screens/menu_bar_items/paivacy_polycy.dart';
import 'package:simplemoneymanager/welcome/intro_pages/splash/splash.dart';
import '../../colors/colors.dart';
import 'terms_and_condition.dart';

// Manu Bar 1st
class MenuBar extends StatelessWidget {
  const MenuBar({super.key});

  @override
  Widget build(BuildContext context) => IconButton(
        icon: const Icon(
          Icons.menu_open,
          size: 30,
          shadows: <Shadow>[Shadow(color: Colors.white, blurRadius: 15.0)],
          color: Colors.black,
        ),
        onPressed: () => ZoomDrawer.of(context)!.toggle(),
      );
}

//::::::::::::::::::::: Manu Bar Widget:::::::::::::::::::::

class ManuPage extends StatefulWidget {
  const ManuPage({super.key});

  @override
  State<ManuPage> createState() => _ManuState();
}

class _ManuState extends State<ManuPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 205,
            ),
            //:::::::::::AboutHeding::::::
            MenuBarButton(
                icon: Icons.person,
                name: "About",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const About(),
                    ),
                  );
                }),
            //:::::::::::ResetHeding::::::
            MenuBarButton(
              icon: Icons.restore,
              name: "Reset",
              onPressed: () {
                {
                  showDialog(
                    context: context,
                    builder: (contex) {
                      return AlertDialog(
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.of(contex).pop(),
                              child: const Text('No')),
                          const SizedBox(
                            width: 30,
                          ),
                          TextButton(
                            onPressed: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.clear();
                              SharedPreferences tectcontrol =
                                  await SharedPreferences.getInstance();
                              await tectcontrol.clear();
                              final transationDb =
                                  await Hive.openBox<TransactionModel>(
                                      'transaction-db');
                              final categorydb =
                                  await Hive.openBox<CategoryModels>(
                                      'category-database');

                              categorydb.clear();
                              transationDb.clear();
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const Splash(),
                                ),
                              );
                            },
                            child: const Text('Yes'),
                          )
                        ],
                        title: const Text('Do you want to restart'),
                      );
                    },
                  );
                }
              },
            ),
            //::::::::ShareHeding:::
            MenuBarButton(
                icon: Icons.share,
                name: "Share",
                onPressed: () {
                  // Share.share(
                  //     "https://play.google.com/store/apps/details?id=com.instructivetech.testapp");
                }),
            //:::::TermsConditionsHeding:::
            MenuBarButton(
                icon: Icons.document_scanner_outlined,
                name: "Terms & Conditions",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TemsAndCondition(),
                    ),
                  );
                }),
            //::::::PrivacyPolicyHeding:::
            MenuBarButton(
              name: "Privacy Policy",
              icon: Icons.privacy_tip_outlined,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PraivacyPolicy(),
                  ),
                );
              },
            ),
            constHeight30,
            constHeight30,
            const SizedBox(
              width: 230,
              child: Text('Version: 1.0.0'),
            ),
          ],
        ),
      ),
    );
  }
}

//:::::::::::::::::::::::::::::::::::::::::::::close::::::::::::::::::::::::::::::::::::::::::::::::::::

//::::::MenuBarButton:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::;

class MenuBarButton extends StatelessWidget {
  const MenuBarButton({
    Key? key,
    required this.icon,
    required this.name,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String name;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 10,
        bottom: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.shade500,
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
        child: Card(
          color: Colors.transparent,
          elevation: 10.0,
          shadowColor: Colors.grey.withOpacity(0.5),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white.withOpacity(.8),
              ),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: () {
                  onPressed();
                },
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
