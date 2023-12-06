import 'package:flutter/material.dart';
import 'package:splitwise_app/main.dart';
import 'package:splitwise_app/widgets/bottombar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lottie/lottie.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Easy Tracker ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                    )),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Makes life easier,',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                    child: Lottie.asset('assets/login.json',
                        height: 250, width: 170)),
                SizedBox(
                  height: 140,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "field is empty";
                      }
                      return null;
                    },
                    controller: _usernameController,
                    decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 235, 235, 235),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1)),
                        hintText: 'username'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "field is empty";
                      }
                      return null;
                    },
                    controller: _passwordController,
                    decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 235, 235, 235),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1)),
                        hintText: 'password'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      checkLogin(context);
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 7, 179, 156),
                    ),
                    child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;

    if (_username == _password) {
      print('Ready\nLoggedIn');

      final _sharedprefs = await SharedPreferences.getInstance();
      await _sharedprefs.setBool(SAVE_KEY_NAME, true);

      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(builder: (ctx1) => bottombar()),
      );
    } else {
      print("Username or password not match");
      showDialog(
        context: context,
        builder: (context1) {
          return AlertDialog(
            title: Text(
              'Ooops',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            content: Text('Enter Valid Password!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context1).pop();
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }
}
