// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// import 'package:splitwise_app/model/expenselist_model.dart';


// int totals = 0;
// final totalexpenseDB = Hive.box<ExpenseList>('expense_db');
// ValueNotifier expenseTotal = ValueNotifier(0.0);
// ValueNotifier incomeTotal = ValueNotifier(0.0);

// class IncomeAndExpence {
//   int total() {
//     var history2 = totalexpenseDB.values.toList();
//     List a = [];
//     for (var i = 0; i < history2.length; i++) {
//       a.add(history2[i].amount == 'income'
//           ? int.parse(history2[i].amount)
//           : int.parse(history2[i].amount) * -1);
//     }
//     totals = a.reduce((value, element) => value + element);
//     return totals;
//   }

//   int income() {
//     var history2 = totalexpenseDB.values.toList();
//     List a = [];
//     for (var i = 0; i < history2.length; i++) {
//       a.add(history2[i].amount == 'income' ? int.parse(history2[i].amount) : 0);
//     }
//     totals = a.reduce((value, element) => value + element);
//     return totals;
//   }

//   int expense() {
//     var history2 = totalexpenseDB.values.toList();
//     List a = [];
//     for (var i = 0; i < history2.length; i++) {
//       a.add(history2[i].amount == 'income' ? 0 : int.parse(history2[i].amount));
//     }
//     totals = a.reduce((value, element) => value + element);
//     return totals;
//   }
// }