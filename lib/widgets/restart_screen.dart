import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splitwise_app/loginpage.dart';
import 'package:splitwise_app/model/expense/expenselist_model.dart';


class reset extends ChangeNotifier {
  resetApp(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            content: const Text(
              'Do you want to Reset app',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            actions: [
              TextButton(
                onPressed: (() async {
                  Navigator.of(context).pop();
                  final expenseDB =
                      await Hive.openBox<ExpenseList>('expense_db');
                  expenseDB.clear();
                

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => loginpage(),
                    ),
                  );

                  SharedPreferences prefe =
                      await SharedPreferences.getInstance();
                  await prefe.clear();
                }),
                child: const Text(
                  'Yes',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'No',
                    style: TextStyle(color: Colors.green),
                  ))
            ],
          );
        });
  }
}