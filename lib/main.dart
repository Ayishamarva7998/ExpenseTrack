import 'package:flutter/material.dart';
import 'package:splitwise_app/bottombar.dart';
import 'package:splitwise_app/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
     home: loginpage(),
      );
    
  }
}