import 'package:flutter/material.dart';
import 'package:splitwise_app/functions/grouplist_fn.dart';
import 'package:splitwise_app/model/expenselist_model.dart';
import 'package:splitwise_app/model/grouplist_model.dart';
import 'package:splitwise_app/screens/adddexpense_screen.dart';
import 'package:splitwise_app/screens/addgroup_screen.dart';
import 'package:splitwise_app/screens/firstgroup_screen.dart';
import 'package:splitwise_app/screens/friends_screen.dart';

class Groupscreen extends StatelessWidget {
  //  GroupList group;
  // final groupname;

  Groupscreen({Key? key}) : super(key: key);

  // List groupList =[];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/billss.jpg'),
              SizedBox(
                height: 20,
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
                  height: 50,
                  width: 320,
                  color: Colors.white,
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text('Tech House',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                ),
              ),

              SizedBox(
                height: 50,
              ),

              //  ListTile(
              //      title: Text('asdsad'),

              //  ),

              SizedBox(height: 30),

              Container(
                height: 200,
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
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Addexpense(),
                                ));
                              },
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

              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Addgroup()));
                },
                child: Container(
                  height: 55,
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 92, 172, 162),
                  ),
                  child: const Center(
                    child: Text('Add Group +', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Addexpense()));
                },
                child: Container(
                  height: 55,
                  width: 360,
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
