import 'package:flutter/material.dart';
import 'package:splitwise_app/bottombar.dart';
import 'package:splitwise_app/screens/settings/settings_screen.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: IconButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, icon: Icon(Icons.arrow_back)),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text('Terms and conditions',
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 30,
                ),
                const Text(''' 
              Welcome to the Easy Pay! By using this app, you agree to these simple terms:

  1:- Use Responsibly: The Easy Pay App is designed to help you to split the bills. Use it responsibly and enjoy your cooking experience!

  2:- Your Content: Add bills and friends are your responsibility. Make sure they are accurate and safe to use.

  3:- Respect Privacy: We care about your privacy. Your use of the app is subject to our Privacy Policy.

  4:- App Ownership: The Easy Pay App and its content belong to us. Please don't modify, distribute, or reverse engineer the app without our permission.

  5:- App Changes: We might update the app or these terms. Stay tuned for any announcements from us.

  6:- App Availability: We aim to provide the app 24/7, but we can't guarantee it. We're not responsible for any inconvenience caused by app unavailability.

  7:- Get in Touch: If you have questions, reach out to us at ayshaaysha7998@gmail.com.

              By using the Recipe App, you agree to these terms. Enjoy your cooking adventures! ''')
              ],
            ),
          ), 
        ),
      ),
    );
  }
}
 