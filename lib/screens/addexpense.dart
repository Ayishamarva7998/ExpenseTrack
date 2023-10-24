import 'package:flutter/material.dart';
import 'package:splitwise_app/bottombar.dart';

class Addexpense extends StatelessWidget {
  const Addexpense({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => bottombar(),));
        }, icon: Icon(Icons.arrow_back,color: Colors.black,))
      ),
      body:Column (
        children: [
          Text('Add expenses',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
          SizedBox(height:  70,),
          Text('Tech House',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          SizedBox( height: 140),
          Container(
            height: 80,
            width: 200,
            color: Colors.amber,
            child: Column(
              children: [
                TextField()
               

              ],
            ),
          )
        ],
      ),
      
      

    );
  }
}