import 'package:flutter/material.dart';
import 'package:splitwise_app/screens/friends_screen.dart';

class addcontact extends StatelessWidget {
  const addcontact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => friends_screen(),));
        }, icon: Icon(Icons.arrow_back))
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: TextField(decoration: InputDecoration(hintText: 'name',fillColor: const Color.fromARGB(255, 231, 230, 230),filled: true,
              border: 
              OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
            ),
            
             Padding(
               padding: const EdgeInsets.only(top: 30,left: 30,right: 30),
               child: TextField(decoration: InputDecoration(hintText: 'phone no',
               fillColor: Color.fromARGB(255, 231, 230, 230),filled: true,border: 
                         OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
             ),
             SizedBox(height: 20,),

             Container(height: 60,
             width: 330,
             child: const Align(alignment: Alignment.center,
              child: Text('save',style: TextStyle(fontSize: 20),)),
             
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:  Color.fromARGB(255, 22, 140, 124),),)
          ],
        ),
      ),

    );
  }
}