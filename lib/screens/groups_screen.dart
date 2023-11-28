import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:splitwise_app/functions/grouplist_fn.dart';
import 'package:splitwise_app/model/expense/expenselist_model.dart';
import 'package:splitwise_app/model/group/grouplist_model.dart';
import 'package:splitwise_app/widgets/adddexpense_screen.dart';
import 'package:splitwise_app/widgets/addgroup_screen.dart';
import 'package:splitwise_app/widgets/expense_screen.dart';

class Groupscreen extends StatelessWidget {
  Groupscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                  child: Lottie.asset('assets/Lottie Lego.json',
                      height: screenHeight * 0.2, width: screenWidth * 0.4)),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Firstgroup(
                        expense: ExpenseList(
                            description: '', amount: '', select: '')),
                  ));
                },
                child: Container(
                  height: screenHeight * 0.05,
                  width: screenWidth * 0.2,
                  color: Colors.white,
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text('Expense',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                ),
              ),
             
              Container(
                height: screenHeight * 0.2,
                child: Builder(
                  builder: (context) {
                    return ValueListenableBuilder(
                      valueListenable: groupListNotifier,
                      builder: (BuildContext ctx, List<GroupList> groupList,
                          Widget? child) {
                        return ListView.builder(
                          itemBuilder: (ctx, index) {
                            final data = groupList[index];

                            return ListTile(
                              title: Text(data.contacts),
                              subtitle: Text(data.groupname),
                            );
                          },
                          itemCount: groupList.length,
                        );
                      },
                    );
                  },
                ),
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
