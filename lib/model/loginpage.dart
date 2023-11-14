import 'package:flutter/material.dart';

class loginpage extends StatelessWidget {
  const loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:SafeArea(child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text('Easy pay ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),)),
          
          const Align(
            alignment: Alignment.topLeft,
            child: Text('Makes life easier,',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),)),
            SizedBox(height: 40,),
            CircleAvatar(radius: 80,backgroundImage: AssetImage('assets/circleavatar.png'),),
            SizedBox(height: 200,),
           Padding(
             padding: const EdgeInsets.all(20),
             child: TextField(decoration: InputDecoration(
              fillColor: Color.fromARGB(255, 235, 235, 235),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1)
              ),
              hintText: 'username'
             ),),
           ),
           Padding(
             padding: const EdgeInsets.all(20),
             child: TextField(decoration: InputDecoration(
              fillColor: Color.fromARGB(255, 235, 235, 235),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1)
              ),
              hintText: 'password'
             ),),
           ),
           Container(
            height: 50,
            width: 350,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 7, 179, 156),),
            child: const Align(alignment: Alignment.center,
              child: Text('login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),

           ),
           
           
        ],
        
      ),
      
      
      ),
      
    
      
     
    );
    
  }
}