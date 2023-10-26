import 'package:flutter/material.dart';
import 'package:splitwise_app/screens/addexpense.dart';
import 'package:splitwise_app/screens/adduser.dart';
import 'package:splitwise_app/screens/firstgroup.dart';
import 'package:splitwise_app/screens/friends_screen.dart';


class groups_screen extends StatelessWidget {
  const groups_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea( 
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [

              Image.asset('assets/billss.jpg'),
              SizedBox(height: 100,),
              GestureDetector(onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => firstgroup(),));
              },
                child: ListTile(leading: Text('Tech House',style: TextStyle(fontWeight: FontWeight.bold),),trailing: Text('You owe 205.00 ',),)),
              Divider(thickness: 5,),
               ListTile(leading: Text('Amigoz',style: TextStyle(fontWeight: FontWeight.bold),),trailing: Text('They owe you 1120.00 '),),
               Divider(thickness: 5,),
                ListTile(leading: Text('Bridgeon',style: TextStyle(fontWeight: FontWeight.bold),),trailing: Text('They owe you 500.00'),),
                Divider(thickness: 5,),
          
                SizedBox(height: 30,),
                GestureDetector(onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => adduser(),));
                },
                  child: Container(
                    height: 55,
                    width: 360,
                   
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Color.fromARGB(255, 176, 181, 181),),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Add Group +',style: TextStyle(fontSize: 20),)),
                        
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Addexpense(),));
                },
                  child: Container(
                    height: 55,
                    width: 360,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Color.fromARGB(255, 22, 140, 124),),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Add Expenses',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                        
                  ),
                )
            ],
          ),
        ),
          
          
          
          
        
        
    
      ),
    );
  }
}