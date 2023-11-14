import 'package:flutter/material.dart';
import 'package:splitwise_app/bottombar.dart';
import 'package:splitwise_app/functions/expense_fn.dart';
import 'package:splitwise_app/model/expenselist_model.dart';
import 'package:splitwise_app/model/grouplist_model.dart';
import 'package:splitwise_app/screens/participants_screen.dart';

class Firstgroup extends StatelessWidget {
  ExpenseList expense;
  Firstgroup({Key? key, required this.expense}) : super(key: key);
  List expenseList = [];
  

  @override
  
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Expenses',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => bottombar(),
                ));
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          backgroundColor: Color.fromARGB(255, 22, 140, 124),
          elevation: 0,
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Participants(
                      memebers: GroupList(
                          contacts: '', groupname: '', isdone: false)),
                ));
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Participants',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.group_add,
                    size: 22,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Align(
                alignment: Alignment.topRight,
                child: Text(
                  'Total Income:1069.00',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                )),
            const Align(
                alignment: Alignment.topRight,
                child: Text(
                  'total Expense:120.00',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                )),
            const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Oct 19',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            Expanded(
              child: Builder(builder: (context) {
                return ValueListenableBuilder(
                  valueListenable: expenseListNotifier,
                  builder: (BuildContext ctx, List<ExpenseList> contactList,
                      Widget? child) {
                    return ListView.builder(
                      itemBuilder: (ctx, index) {
                        final data = contactList[index];
                        return ListTile(
                          title: Text(data.description),
                          subtitle: Text(data.amount),
                          trailing: Text(
                            data.select,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: data.select == 'income'
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        );
                      },
                      itemCount: contactList.length,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  ListTile list(
      {required IconData icon,
      required String title,
      required String text1,
      required String text2,
      required String amount}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(text1),
      trailing: Column(
        children: [
          Text(
            text2,
            style: const TextStyle(color: Colors.red),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            amount,
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}
