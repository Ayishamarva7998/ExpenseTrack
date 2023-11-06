
import 'package:flutter/material.dart';
import 'package:splitwise_app/model/data_model.dart';
import 'package:splitwise_app/model/data_model3.dart';
import 'package:splitwise_app/screens/chart_screen.dart';
import 'package:splitwise_app/screens/friends_screen.dart';
import 'package:splitwise_app/screens/groups_screen.dart';
import 'package:splitwise_app/screens/settings/settings_screen.dart';


class bottombar extends StatefulWidget {
  const bottombar({super.key});

  @override
  State<bottombar> createState() => _bottombarState();
}

class _bottombarState extends State<bottombar> {
 int myindex = 0;

final pages = [
 Groupscreen(group: GroupList(contacts: '', groupname:'',isdone: false)),
 Friendsscreen(contact: ContactList(name: '', number: '',isDone: false)),
 Chartscreen(),
 Settings()
  
];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[myindex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          onTap: (index) {
            setState(() {
              myindex =index;
            });
          },
          currentIndex: myindex,
          items: [
          
          
          BottomNavigationBarItem(
            
            icon: Icon(Icons.groups_sharp,color: myindex==0?Colors.black:Colors.grey,),label: 'Groups',),
             BottomNavigationBarItem(
            icon: Icon(Icons.group_add,color: myindex==1?Colors.black:Colors.grey,),label: 'Friends'), 
             BottomNavigationBarItem(
            icon: Icon(Icons.incomplete_circle,color: myindex==2?Colors.black:Colors.grey,),label: 'Chart'), 
             BottomNavigationBarItem(
            icon: Icon(Icons.settings,color: myindex==3?Colors.black:Colors.grey,),label: 'Settings'), 

        ]),
        
       
        )
    
          
        );
        
        
    
      
    
  }
}