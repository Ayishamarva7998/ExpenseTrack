import 'package:flutter/material.dart';
import 'package:splitwise_app/screens/groups_screen.dart';

class firstgroup extends StatelessWidget {
  const firstgroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: IconButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => groups_screen(),));
        
       }, icon: Icon(Icons.arrow_back)),
       backgroundColor: const Color.fromARGB(255, 215, 212, 212),elevation: 0,
      ),
      body: Column(
        children: [
          Align(alignment: Alignment.topLeft,
            child: Text('Tech house',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)),SizedBox(height: 30,),
          Align(alignment: Alignment.topRight,
            child: Text('Total Income:1069.00',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)),
          Align(alignment: Alignment.topRight,
            child: Text('Total Expense:120.00',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
            SizedBox(height: 60,),

            Align(alignment: Alignment.topLeft,
              child: Text('Oct 19',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
              SizedBox(height: 20,),
             list(icon:Icons.local_taxi,title: 'Taxi fare',text1: 'Rahma paid 50.00',text2: 'You borrowed',amount: '10.00'),
             list(icon: Icons.restaurant, title: 'food', text1: 'Arjun paid 654.00', text2: 'You borrowed', amount: '280.00'),
             list(icon: Icons.shopping_cart, title: 'fgh', text1: 'bn', text2: 'bnm', amount: ' mmmm' )



        
        ],
        
      ),

    );
  }

  ListTile list({required IconData icon, required String title,required String text1,required String text2,required String amount  }) {
    return ListTile(leading: Icon(icon),
    title: Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
           subtitle: Text(text1),
           trailing: Column(
             children: [
               Text(text2,style: TextStyle(color: Colors.red
               ),),
               SizedBox(height: 10,),
               Text(amount,style: TextStyle(color: Colors.red),)
             ],
           ),
           
           );
  }
}