import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:simplemoneymanager/screens/menu_bar_items/about.dart';
import 'package:simplemoneymanager/screens/menu_bar_items/paivacy_polycy.dart';
import '../../colors/colors.dart';
import 'terms_and_condition.dart';

// Manu Bar 1st
class MenuBar extends StatelessWidget {
  const MenuBar({super.key});

  @override
  Widget build(BuildContext context) => IconButton(
        icon: const Icon(
          Icons.menu_open,
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
      backgroundColor: ColorConstants.kGravishBlueColor,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SizedBox(
            height: 105,
          ),
          //:::::::::::AboutHeding::::::
          AboutHeding(),
          //:::::::::::ResetHeding::::::
          ResetHeding(),
          //::::::::ShareHeding:::
          ShareHeding(),
          //:::::TermsConditionsHeding:::
          TermsConditionsHeding(),
          //::::::PrivacyPolicyHeding:::
          PrivacyPolicyHeding(),
        ],
      ),
    );
  }
}

//:::::::::::::::::::::::::::::::::::::::::::::close::::::::::::::::::::::::::::::::::::::::::::::::::::
// widget for hedings @settings

//::::::PrivacyPolicyHeding:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::;

class PrivacyPolicyHeding extends StatelessWidget {
  const PrivacyPolicyHeding({
    Key? key,
  }) : super(key: key);

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
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 196, 201, 122),
              Color.fromARGB(255, 221, 145, 254),
            ],
          ),
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Card(
          color: Colors.transparent,
          elevation: 10.0,
          shadowColor: Colors.grey.withOpacity(
            0.5,
          ),
          child: Row(
            children: [
              const Icon(
                Icons.privacy_tip_outlined,
              ),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PraivacyPolicy(),
                    ),
                  );
                },
                child: const Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
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
//:::::TermsConditionsHeding::::::::::::::::::::::::::::::::::::::::::::::::::::

class TermsConditionsHeding extends StatelessWidget {
  const TermsConditionsHeding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 196, 201, 122),
              Color.fromARGB(255, 221, 145, 254),
            ],
          ),
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Card(
          color: Colors.transparent,
          elevation: 10.0,
          shadowColor: Colors.grey.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.document_scanner_outlined,
              ),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TemsAndCondition(),
                    ),
                  );
                },
                child: const Text(
                  'Terms & Conditions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
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
//::::::::ShareHeding::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::;

class ShareHeding extends StatelessWidget {
  const ShareHeding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 196, 201, 122),
              Color.fromARGB(255, 221, 145, 254),
            ],
          ),
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Card(
          color: Colors.transparent,
          elevation: 10.0,
          shadowColor: Colors.grey.withOpacity(0.5),
          child: Row(
            children: [
              const Icon(
                Icons.share,
              ),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Share',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
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
//:::::::::::ResetHeding::::::::::::::::::::::::::::::::::::::::::::::;

class ResetHeding extends StatelessWidget {
  const ResetHeding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 196, 201, 122),
              Color.fromARGB(255, 221, 145, 254),
            ],
          ),
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Card(
          color: Colors.transparent,
          elevation: 10.0,
          shadowColor: Colors.grey.withOpacity(0.5),
          child: Row(
            children: [
              const Icon(
                Icons.restore,
              ),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Reset',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//:::::::::::AboutHeding::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::;
class AboutHeding extends StatelessWidget {
  const AboutHeding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 90, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 196, 201, 122),
              Color.fromARGB(255, 221, 145, 254),
            ],
          ),
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Card(
          color: Colors.transparent,
          elevation: 10.0,
          shadowColor: Colors.grey.withOpacity(0.5),
          child: Row(
            children: [
              const Icon(
                Icons.person,
              ),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const About(),
                    ),
                  );
                },
                child: const Text(
                  'About',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
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
