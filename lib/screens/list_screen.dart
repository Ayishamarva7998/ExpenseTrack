import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:splitwise_app/functions/expense_fn.dart';
import 'package:splitwise_app/model/expenselist_model.dart';
import 'package:splitwise_app/screens/adddexpense_screen.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
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
            'Welcome!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 22, 140, 124),
          actions: [
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () => _selectDate(context),
              color: Colors.black,
            ),
          ],
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 280),
              child: Text(
                'Participants',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 290),
              child: Text('${DateFormat('yyyy-MM-dd').format(selectedDate)}'),
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
             GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Addexpense(groupId: '',)));
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
    );
  }
}
