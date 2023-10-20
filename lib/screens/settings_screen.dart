import 'package:flutter/material.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,title:
       Text('Settings',style: TextStyle(
        color: Colors.black,fontWeight: FontWeight.bold,fontSize: 26),),),
      body: Padding(
        padding: const EdgeInsets.all(11),
        child: Column(
          
          children: [
            SizedBox(height: 160,),
          
          Material(
            elevation: 2,
            child: Container(height: 60,width: 360,
            child: Center(
              child: ListTile(leading: Icon(Icons.info),title: Text("About us"),
              trailing: Icon(Icons.arrow_forward_ios),),
            ),),
          ),SizedBox(height: 20,),
            Material(
            elevation: 2,
            child: Container(height: 60,width: 360,
            child: Center(
              child: ListTile(leading: Icon(Icons.policy),title: Text("Privacy and Policy"),
              trailing: Icon(Icons.arrow_forward_ios),),
            ),),
          ),
          SizedBox(height: 20,),
           Material( 
            elevation: 2,
            child: Container(height: 60,width: 360,
            child: Center(
              child: ListTile(leading: Icon(Icons.restart_alt),title: Text("Terms and conditions"),
              trailing: Icon(Icons.arrow_forward_ios,),),
            ),),
          ),
          SizedBox(height: 20,),
           Material(
            elevation: 2,
            child: Container(height: 60,width: 360,
            child: Center(
              child: ListTile(leading: Icon(Icons.info),title: Text("Restart"),
              trailing: Icon(Icons.arrow_forward_ios),),
            ),),
          ),
          SizedBox(height: 40,),
          Container(height:60,width: 360,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:Color.fromARGB(255, 22, 140, 124),),
          child: Align(child: Text('logout')),
          )
          ],
        
        ),
      ),
    );
  }
}