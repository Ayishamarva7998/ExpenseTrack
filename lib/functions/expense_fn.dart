import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:splitwise_app/model/expense/expenselist_model.dart';

ValueNotifier<List<ExpenseList>> expenseListNotifier =ValueNotifier([]);
 Future<void> addExpense(ExpenseList value)async{
   final expenseDB = await Hive.openBox<ExpenseList>('expense_db');
   
   await expenseDB.add(value);
   
   expenseListNotifier.value.add(value);
   expenseListNotifier.notifyListeners();
 }
   Future<void> getAllexpense()async{
    final expenseDB = await Hive.openBox<ExpenseList>('expense_db');
    expenseListNotifier.value.clear();
    expenseListNotifier.value.addAll(expenseDB.values);
   
    expenseListNotifier.notifyListeners();

    
   }
   void editExpense(index,ExpenseList value ) async {
  final expenseDB = await Hive.openBox<ExpenseList>('expense_db');
  expenseListNotifier.value.clear();
  expenseListNotifier.value.addAll(expenseDB.values);
  expenseListNotifier.notifyListeners();
  expenseDB.putAt(index, value);
  getAllexpense();
} 
  


   Future<void> deleteExpense(int index) async {
  final expenseDB = await Hive.openBox<ExpenseList>('expense_db');
  expenseDB.deleteAt(index);
  getAllexpense();
 }
 // total amount

    double total(List<ExpenseList> expenseList) {
  double totalamount = 0;
  for (var expense in expenseList) {
    if (expense.amount != null && expense.amount.isNotEmpty) {
      try {
        totalamount += double.parse(expense.amount);
      } catch (e) {
        print('Error parsing amount: ${expense.amount}');
      }
    }
  }
  return totalamount;
}

  
//chart calcultion

double calculateTotalCost(List<ExpenseList> expense) {
  double totalCost = 0;
  for (var expense in expense) {
    totalCost += double.parse(expense.amount);
  }
  return totalCost;
}
 

   

 