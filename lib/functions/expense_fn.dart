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

   Future<void> deleteExpense(int index) async {
  final expenseDB = await Hive.openBox<ExpenseList>('expense_db');
  expenseDB.deleteAt(index);
  getAllexpense();
 }
 // total amount

     double total( expense){
    double totalamount = 0;
    for(var expenses in expense){
      totalamount+=double.parse(expenses.amount);
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
 

   

 