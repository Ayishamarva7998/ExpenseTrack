import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:splitwise_app/bottombar.dart';
import 'package:splitwise_app/functions/db_function2.dart';
import 'package:splitwise_app/functions/db_functions.dart';
import 'package:splitwise_app/functions/functions3.dart';
import 'package:splitwise_app/loginpage.dart';
import 'package:splitwise_app/model/data_model.dart';
import 'package:splitwise_app/model/data_model2.dart';
import 'package:splitwise_app/model/data_model3.dart';
import 'package:splitwise_app/screens/addcontact.dart';
import 'package:splitwise_app/screens/firstgroup.dart';

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
    return MaterialApp(
      title: 'EasyPay',
      debugShowCheckedModeBanner: false,
     home: bottombar(),
      );
    
  }
}
