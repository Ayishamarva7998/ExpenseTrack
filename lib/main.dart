import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:splitwise_app/bottombar.dart';
import 'package:splitwise_app/functions/expense_fn.dart';
import 'package:splitwise_app/functions/contactlist_fn.dart';
import 'package:splitwise_app/functions/grouplist_fn.dart';
import 'package:splitwise_app/loginpage.dart';
import 'package:splitwise_app/model/contactlist_model.dart';
import 'package:splitwise_app/model/expenselist_model.dart';
import 'package:splitwise_app/model/grouplist_model.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized(); 
 await Hive.initFlutter();
if(!Hive.isAdapterRegistered(ContactListAdapter().typeId))
{
  Hive.registerAdapter(ContactListAdapter());

}

 WidgetsFlutterBinding.ensureInitialized(); 
 await Hive.initFlutter();
if(!Hive.isAdapterRegistered(ExpenseListAdapter().typeId))
{
  Hive.registerAdapter(ExpenseListAdapter());

}

WidgetsFlutterBinding.ensureInitialized(); 
 await Hive.initFlutter();
if(!Hive.isAdapterRegistered(GroupListAdapter().typeId))
{
  Hive.registerAdapter(GroupListAdapter());

}


  runApp( const MyApp()); 
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});
  

 
  @override
  Widget build(BuildContext context) {
    getAllcontacts();
    getAllexpense(); 
    getAllgroup();
    return const MaterialApp(
      title: 'EasyPay',
      debugShowCheckedModeBanner: false,
     home: bottombar(),
      );
    
  }
}
