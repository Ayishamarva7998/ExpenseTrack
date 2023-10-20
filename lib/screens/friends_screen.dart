import 'package:flutter/material.dart';


class friends_screen extends StatelessWidget {
  const friends_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 180,),
            Row(
              
              children: [
                Text('Tech House',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                SizedBox(width: 150,),
                Text('You owe 205.00'),  
              ],
              ),
              SizedBox(height: 20,),
              Row(
                 children: [
                Text('Amigoz',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                SizedBox(width: 150,),
                Text('They owe you 1120.00'),  
              ],       ),
              SizedBox(height: 20),
              Row(
                 children: [
                Text('Bridgeon',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                SizedBox(width: 150,),
                Text('They owe you 500.00'),  
              ], ),
              SizedBox(height: 250,),
              Container(
                height: 55,
                width: 360,
               
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Color.fromARGB(255, 176, 181, 181),),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Add Group +',style: TextStyle(fontSize: 20),)),

              ),
              SizedBox(height: 20,),
              Container(
                height: 55,
                width: 360,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Color.fromARGB(255, 22, 140, 124),),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Add Expenses',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),

              )
          ],
        ),
          
          
          
          
        
        
    
      ),
    );
  }
}