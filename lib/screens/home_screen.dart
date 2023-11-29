import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:splitwise_app/widgets/adddexpense_screen.dart';
import 'package:splitwise_app/widgets/addgroup_screen.dart';


class Homescreen extends StatelessWidget {
  Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [SizedBox(height: 50),
              ClipRRect(
                
                  child: Lottie.asset('assets/home.json',
                  
                      height: screenHeight * 0.2, width: screenWidth * 5)),
              const SizedBox(
                height: 10,
              ),
             
             
              Container(
                height: screenHeight * 0.2,
               
              ),
              SizedBox(height: screenHeight * 0.19),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Addgroup()));
                },
                child: Container(
                  height: screenHeight * 0.07,
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 92, 172, 162),
                  ),
                  child: const Center(
                    child: Text('Add Members+', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Addexpense()));
                },
                child: Container(
                  height: screenHeight * 0.07,
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 22, 140, 124),
                  ),
                  child: const Center(
                    child: Text('Add Expenses',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
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
