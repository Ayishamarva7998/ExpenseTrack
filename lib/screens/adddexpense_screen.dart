import 'package:flutter/material.dart';
import 'package:splitwise_app/bottombar.dart';
import 'package:splitwise_app/functions/expense_fn.dart';
import 'package:splitwise_app/functions/contactlist_fn.dart';
import 'package:splitwise_app/functions/grouplist_fn.dart';
import 'package:splitwise_app/model/expenselist_model.dart';
import 'package:splitwise_app/model/grouplist_model.dart';
import 'package:splitwise_app/screens/firstgroup_screen.dart';

class Addexpense extends StatefulWidget {
  Addexpense({
    Key? key,
  }) : super(key: key);

  @override
  State<Addexpense> createState() => _AddexpenseState();
}

class _AddexpenseState extends State<Addexpense> {
  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();
  final _selectController = TextEditingController();

  String selectedCategory = 'income';
  var items = ['income', 'expense'];
  final List group = List.generate(groupListNotifier.value.length, (index) {
    groupListNotifier.value[index];
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => bottombar(),
                ));
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ))),
      body: Column(
        children: [
          const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Add expenses',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              )),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Tech House',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(height: 140),
          Align(
            child: SingleChildScrollView(
              child: Container(
                height: 400,
                width: 420,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: TextFormField(
                        controller: _descriptionController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.description),
                            hintText: 'description',
                            fillColor: Color.fromARGB(255, 231, 230, 230),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: _amountController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.currency_rupee),
                          hintText: 'amount',
                          fillColor: Color.fromARGB(255, 231, 230, 230),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.expand_more,
                      color: Colors.white,
                    ),
                    DropdownButton<String>(
                      value: selectedCategory,
                      items: items.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              color: item == 'income'
                                  ? Color.fromARGB(255, 15, 72, 17)
                                  : item == 'expense'
                                      ? Colors.red
                                      : Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedCategory = value!;
                          _selectController.text = value;
                        });
                      },
                      style: TextStyle(
                        color: selectedCategory == 'income'
                            ? const Color.fromARGB(255, 26, 82, 28)
                            : selectedCategory == 'expense'
                                ? Colors.red
                                : Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                          controller: _selectController,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.swap_vert),
                              hintText: selectedCategory,
                              fillColor: Color.fromARGB(255, 231, 230, 230),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        onAddExpenseButtonClicked(context);
                        _showPopup(context);
                      },
                      child: Container(
                        height: 60,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 92, 172, 162),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Save',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> onAddExpenseButtonClicked(BuildContext context) async {
    final _description = _descriptionController.text.trim();
    final _amount = _amountController.text.trim();
    final _select = _selectController.text.trim();
    if (_description.isEmpty || _amount.isEmpty || _select.isEmpty) {
      return;
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Firstgroup(
          expense: ExpenseList(
              description: _description, amount: _amount, select: _select),
        ),
      ));
    }
    print('$_description $_amount');
    final _expense = ExpenseList(
        description: _description, amount: _amount, select: _select);

    addExpense(_expense);
  }

  Future<void> _showPopup(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Expense Saved'),
          content: Text('Your expense has been successfully saved.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}