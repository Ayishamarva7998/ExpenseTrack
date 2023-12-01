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
              Welcome to the Easy Tracker! 

              Easy Tracker makes life easier!

  A Easy Tracker app  designed to help individuals to monitor and manage their financial transactions.
  These transactions can include everything from daily purchases and bills to larger expenses like rent and investments.
  The primary goal of an expense tracker is to provide users with a comprehensive overview of their spending 
  patterns,enabling them to make informed decisions about their finances.
.

             

              Is Easy Pay a safe app:-

Easy Tracker does not handle any cash transactions,nor does it link to personal banking details,making it safer than other Apps. 








                               Explore the features ! ''')










  
  

 
  
             
              ],
            ),
          ), 
        ),
      ),
    );
  }
}
 