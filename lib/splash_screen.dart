import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splitwise_app/model/loginpage.dart';
import 'package:splitwise_app/widgets/bottombar.dart';

const String SAVE_KEY_NAME = 'user_logged_in';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key});

  @override
  State<Splashscreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Splashscreen> {
  @override
  void initState() {
    CheckUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 22, 140, 124),
        body: Center(
          child: Text(
            "Easy Tracker makes life easier",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> gotoLoginpage() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => loginpage()),
    );
  }

  Future<void> CheckUserLoggedIn() async {
    final sharedprefs = await SharedPreferences.getInstance();
    final userLoggedIn = sharedprefs.getBool(SAVE_KEY_NAME);

    if (userLoggedIn == null || userLoggedIn == false) {
      gotoLoginpage();
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx1) => bottombar()),
      );
    }
  }
}
