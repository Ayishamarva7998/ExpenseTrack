import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:splitwise_app/widgets/bottombar.dart';
import 'package:splitwise_app/functions/expense_fn.dart';
import 'package:splitwise_app/functions/contactlist_fn.dart';
import 'package:splitwise_app/model/expense/expenselist_model.dart';
import 'model/contact.dart/contactlist_model.dart';


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


// WidgetsFlutterBinding.ensureInitialized(); 
//  await Hive.initFlutter();
// if(!Hive.isAdapterRegistered(GroupListAdapter().typeId))
// {
//   Hive.registerAdapter(GroupListAdapter());

// }


  runApp( const MyApp()); 
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});
  

 
  @override
  Widget build(BuildContext context) {
    getAllcontacts();
    getAllexpense(); 
    // getAllgroup();
    
    return const MaterialApp(
      title: 'EasyPay',
      debugShowCheckedModeBanner: false,
     home: bottombar(),
      );
    
  }
}
