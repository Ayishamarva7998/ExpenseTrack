import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:splitwise_app/bottombar.dart';
import 'package:splitwise_app/loginpage.dart';
import 'package:splitwise_app/model/data_model.dart';
import 'package:splitwise_app/screens/addcontact.dart';
import 'package:splitwise_app/screens/firstgroup.dart';

Future<void> main()async {
 await Hive.initFlutter();
if(!Hive.isAdapterRegistered(ContactListAdapter().typeId))
{
  Hive.registerAdapter(ContactListAdapter());

}
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyPay',
      debugShowCheckedModeBanner: false,
     home: bottombar(),
      );
    
  }
}