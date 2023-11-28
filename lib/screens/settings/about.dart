import 'package:flutter/material.dart';



class About extends StatelessWidget {
  const About({super.key});

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
                const Text('About Us',
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 30,
                ),
                const Text(''' 
              Welcome to the Easy Pay! 

              Easy Pay makes life easier!

  A Easy Pay app  designed to help users to divide  bills on their daily basis.
.Track balances.Keep track of shared expenses,balances,and who owes who.
.Organise expenses,split expenses with any group trips,housemates,friends,and family.
.Add expenses easily. Quickly add expenses on the go before you forget who paid.
.Pay friends back.

              How Easy Pay App works:-

Add each participant with whom you want to share the bills and app will show them ask them to pay the amount.


              Is Easy Pay a safe app:-

Splitwise does not handle any cash transactions,nor does it link to personal banking details,making it safer than other Apps. 








                               Explore the features ! ''')










  
  

 
  
             
              ],
            ),
          ), 
        ),
      ),
    );
  }
}
 