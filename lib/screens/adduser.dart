import 'package:flutter/material.dart';
import 'package:splitwise_app/bottombar.dart';
import 'package:splitwise_app/screens/addcontact.dart';
import 'package:splitwise_app/screens/groups_screen.dart';

class Adduser extends StatelessWidget {
  const Adduser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => bottombar(),));
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: const Color.fromARGB(255, 208, 202, 202),
        elevation: 0,
        title: Text(
          'Friends',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 280,),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
              SizedBox(width: 10,),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Addcontact(),));
                },
                icon: Icon(Icons.person_add),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                contactlist(text1: 'Adil Rusfeed', text2: '7736348522'),
                contactlist(text1: 'Arjun ', text2: '7736348522'),
                contactlist(text1: 'Harif ', text2: '7736348522'),
                contactlist(text1: 'Rahma', text2: '7736348522'),
                contactlist(text1: 'Sambras', text2: '7736348522'),
                contactlist(text1: 'Waseem', text2: '7736348522'),
                contactlist(text1: 'Zekkeshan', text2: '7736348522'),
              ], 
            ),
          ),
        Align(alignment: Alignment.topCenter,
          child: FloatingActionButton.extended(onPressed:(){
            popupbox(context);
          }, label: Text('Make a Group')))
        ],
      ),
    );  
  }

  ListTile contactlist({required String text1, required String text2}) {
    return ListTile(
      leading: CircleAvatar(radius: 30, backgroundColor: Colors.grey,),
      title: Text(text1, style: TextStyle(fontSize: 20),),
      subtitle: Text(text2, style: TextStyle(fontSize: 15),),
      trailing: Icon(Icons.check_box_outline_blank),
    );
  }
  void popupbox(BuildContext context){
    showDialog(context: context,
    builder: (BuildContext context){
      return AlertDialog(
        title:Text("Group Name"),
        content: TextField(),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child:Text("cancel")),
          TextButton(onPressed: (){}, child: Text("ok"))
        ],
      );
    });

  }
}
