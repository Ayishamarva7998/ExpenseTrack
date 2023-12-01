import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:splitwise_app/functions/expense_fn.dart';
import 'package:splitwise_app/model/expense/expenselist_model.dart';
import 'package:splitwise_app/widgets/bottombar.dart';
import 'package:intl/intl.dart';
import 'package:splitwise_app/widgets/edit_screen.dart';

class Descriptionscreen extends StatefulWidget {
  ExpenseList expense;
  Descriptionscreen({Key? key, required this.expense}) : super(key: key);

  @override
  State< Descriptionscreen> createState() => _FriendsscreenState();
}

class _FriendsscreenState extends State< Descriptionscreen> {
  List contactList = [];
  String _search = '';
  List<ExpenseList> filteredExpense = [];
  List<ExpenseList> details = [];
  double totalamount = total(expenseListNotifier.value);
  DateTime selectedDate = DateTime.now();
 
  

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
 

  

  @override
  void initState() {
    super.initState();
    getAllexpense();
  }

  void filteredData() {
    setState(() {
      filteredExpense = expenseListNotifier.value
          .where((expenselist) => expenselist.description
              .toLowerCase()
              .contains(_search.toLowerCase()))
          .toList();
    });
  }

  Future<void> _showDeleteConfirmationDialog(ExpenseList expense) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Expense'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Are you sure you want to delete this expense?'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  expenseListNotifier.value.remove(expense);
                });

                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
          title: const Text(
            'Friends',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () => _selectDate(context),
                icon: const Icon(Icons.calendar_month),
                color: Colors.black)
          ],
        ),
        body: Column(
          children: [
           
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'search expense',
                  fillColor: const Color.fromARGB(255, 237, 235, 235),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  prefixIcon: const Icon(Icons.search),
                ),
                onChanged: (value) {
                  setState(() {
                    _search = value;
                    filteredData();
                  });
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 210),
              child: Text(
                "Total Amount:-${totalamount}",
                style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
           
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '${DateFormat('yyyy-MM-dd').format(selectedDate)}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Builder(builder: (context) {
                return ValueListenableBuilder(
                    valueListenable: expenseListNotifier,
                    builder: (BuildContext ctx, List<ExpenseList> expenselist,
                        Widget? child) {
                      final list = filteredExpense.isNotEmpty
                          ? filteredExpense
                          : expenselist;
                      return ListView.builder(
                        itemBuilder: (ctx, index) {
                          final data = list[index];
                          return ListTile(
                            leading: CircleAvatar(radius: 50,backgroundImage: 
                            data.image !=null
                            ? FileImage(File(data.image!))
                            :AssetImage('assets/circleavatar.png')as ImageProvider,),
                            title: Text(data.description),
                            subtitle: Text(data.amount),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                
                             
                                IconButton(onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditContacts(description: data.description, amount: data.amount, index: index),));
                                }, icon: Icon(Icons.edit)),
                                
                                IconButton(
                                    onPressed: () {
                                      deleteExpense(index);
                                    },icon: Image.asset("assets/delete.png",height: 25,),),
                              ],
                            ),
                          );
                        },
                        itemCount: list.length,
                      );
                    });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
