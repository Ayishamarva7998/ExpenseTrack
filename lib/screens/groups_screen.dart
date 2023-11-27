import 'package:flutter/material.dart';
import 'package:splitwise_app/functions/grouplist_fn.dart';
import 'package:splitwise_app/model/expenselist_model.dart';
import 'package:splitwise_app/model/grouplist_model.dart';
import 'package:splitwise_app/screens/adddexpense_screen.dart';
import 'package:splitwise_app/screens/addgroup_screen.dart';
import 'package:splitwise_app/screens/list_screen.dart';
import 'package:splitwise_app/screens/techhouse.dart';

class Groupscreen extends StatelessWidget {
  Groupscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/billss.jpg'),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Firstgroup(
                        expense: ExpenseList(
                          groupId: '',
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
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    
                  },
                  child: const Text(
                    'show groups',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )),
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
                             Key tileKey = ObjectKey(data);
                            String uniqueId  =tileKey.toString();
                            return ListTile(
                              key: tileKey,
                              onTap: () {
                                print('Unique ID:$uniqueId');
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ListScreen(uniqueId: uniqueId),
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
              SizedBox(height: 50),
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
              // GestureDetector(
              //   onTap: () {
              //     Navigator.of(context).push(
              //         MaterialPageRoute(builder: (context) => Addexpense()));
              //   },
              //   child: Container(
              //     height: 55,
              //     width: 360,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(30),
              //       color: Color.fromARGB(255, 22, 140, 124),
              //     ),
              //     child: const Center(
              //       child: Text('Add Expenses',
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold, fontSize: 20)),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
