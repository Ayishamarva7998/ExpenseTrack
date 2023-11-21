import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:splitwise_app/bottombar.dart';
import 'package:splitwise_app/functions/expense_fn.dart';
import 'package:splitwise_app/model/expenselist_model.dart';
import 'package:splitwise_app/model/grouplist_model.dart';
import 'package:splitwise_app/screens/participants_screen.dart';

class Firstgroup extends StatefulWidget {
  ExpenseList expense;
  Firstgroup({Key? key, required this.expense}) : super(key: key);

  @override
  State<Firstgroup> createState() => _FirstgroupState();
}

class _FirstgroupState extends State<Firstgroup> {
  
  List<ExpenseList> expenseList = [];

  double totalamount = total(expenseListNotifier.value);
 
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
            ),
          ),
          backgroundColor: Color.fromARGB(255, 22, 140, 124),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () => _selectDate(context),
              icon: const Icon(
                Icons.calendar_today,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Participants(
                    memebers: GroupList(
                      contacts: '',
                      groupname: '',
                      isdone: false,
                    ),
                  ),
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
             Align(
              alignment: Alignment.topRight,
              child: Text(
                "Total Amount:- ${totalamount}",
                style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            
            const Align(
              alignment: Alignment.topLeft,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '${DateFormat('yyyy-MM-dd').format(selectedDate)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Builder(builder: (context) {
                return ValueListenableBuilder(
                  valueListenable: expenseListNotifier,
                  builder: (BuildContext ctx, List<ExpenseList>expenseList,
                      Widget? child) {
                    return ListView.builder(
                      itemBuilder: (ctx, index) {
                        final data = expenseList[index];
                        return ListTile(
                          title: Text(data.description),
                          subtitle: Text(data.amount),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  deleteExpense(index);
                                },
                                icon: const Icon(Icons.delete,
                                    color: Color.fromARGB(255, 219, 218, 218)),
                              ),
                              Text(
                                data.select,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: data.select == 'income'
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: expenseList.length,
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


}
