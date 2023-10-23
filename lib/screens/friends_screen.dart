import 'package:flutter/material.dart';

class friends_screen extends StatelessWidget {
  const friends_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.white,elevation: 0, title: Text('Friends',style: TextStyle(fontWeight: FontWeight.bold,fontSize:26,color: Colors.black ,),),
    ),
    body: Column(
      children: [
        Row(
          children: [
            SizedBox(width: 320,),
            Icon(Icons.search),
            SizedBox(width: 20,),
            Icon(Icons.person_add_alt)
          ],
        
        ),
        SizedBox(height: 50,),
        contactlist(name: 'Adil Rusfeed P',number: '7736348522'),
        SizedBox(height: 20,),
        contactlist(name: 'Arjun P.K',number: '7736348522'),
         SizedBox(height: 20,),
        contactlist(name: 'Harif Rahman K',number: '7736348522'),
         SizedBox(height: 20,),
        contactlist(name: 'Krishna Das A',number: '7736348522'),
         SizedBox(height: 20,),
        contactlist(name: 'Rahma P.O',number: '7736348522'),
         SizedBox(height: 20,),
        contactlist(name: 'Sambras T',number: '7736348522'),
         SizedBox(height: 20,),
        contactlist(name: 'Waseem U',number: '7736348522'),
         SizedBox(height: 20,), 
      ],
    ),
    
    
    );
  }

  Row contactlist({required String name, required String number}) {
  return Row(
    children: [
      SizedBox(width: 10),
      CircleAvatar(radius: 30, backgroundColor: Colors.grey),
      SizedBox(width: 30),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            'Number: $number',
            style: TextStyle(fontSize: 16),
            
          ),
          
        ],
      ),
    ],
  );
}

  }
