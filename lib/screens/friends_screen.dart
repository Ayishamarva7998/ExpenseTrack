 import 'package:flutter/material.dart';
import 'package:splitwise_app/bottombar.dart';
import 'package:splitwise_app/functions/db_functions.dart';
import 'package:splitwise_app/model/data_model.dart';
import 'package:splitwise_app/screens/addcontact.dart';
import 'package:splitwise_app/screens/groups_screen.dart';

class Friendsscreen extends StatelessWidget {
  ContactList contact;
  

  Friendsscreen({Key? key,required this.contact}) : super(key: key);


  List contactList =[];  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading:IconButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => bottombar(),));
      }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
    
     actions: [
      IconButton(onPressed: (){}, icon:Icon(Icons.search)),
      IconButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Addcontact(),));
      }, icon: Icon(Icons.person_search_rounded,color: Colors.black,))
     ],
         backgroundColor: const Color.fromARGB(255, 208, 202, 202),elevation: 0, title: Text('Friends',style: TextStyle(fontWeight: FontWeight.bold,fontSize:26,color: Colors.black ,),),
    ),
    body: Column(
      children: [
        Row(
        //   children: [
        //     SizedBox(width: 280,),
        // IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.black,)),
        //     SizedBox(width: 10,),
        //   IconButton(onPressed: (){
        //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => Addcontact(),));
        //   }, icon: Icon(Icons.person_add))
        //   ],
        
        ),
        Expanded(
          child: Builder(
            builder: (context) {
              return ValueListenableBuilder(
                valueListenable: contactListNotifier,
                builder:(BuildContext ctx,List<ContactList> contactList,Widget? child){
                   return ListView.builder(itemBuilder: (ctx, index) {
        
                  final data = contactList[index];
                  return ListTile(
                    title: Text(data.name),
                    subtitle: Text(data.number),
                    
                  );
                  

                },
                
                itemCount: contactList.length,
                
                );
                },
                 
                
              );
            }
          ),
        ),
        // SizedBox(height: 40,),
        // contactlist(name: 'Adil Rusfeed P',number: '7736348522'),
        // SizedBox(height: 20,),
        // contactlist(name: 'Arjun P.K',number: '7736348522'),
        //  SizedBox(height: 20,),
        // contactlist(name: 'Harif Rahman K',number: '7736348522'),
        //  SizedBox(height: 20,),
        // contactlist(name: 'Krishna Das A',number: '7736348522'),
        //  SizedBox(height: 20,),
        // contactlist(name: 'Rahma P.O',number: '7736348522'),
        //  SizedBox(height: 20,),
        // contactlist(name: 'Sambras T',number: '7736348522'),
        //  SizedBox(height: 20,),
        // contactlist(name: 'Zekkeshan',number: '7736348522'),
        //  SizedBox(height: 20,), 
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
      SingleChildScrollView(scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Align(alignment: Alignment.topRight,
                  child: Align(alignment: Alignment.topRight,
                    child: Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
                 Text(
              'Number: $number',
              style: TextStyle(fontSize: 16),
            ),
              ],
            ),
            SizedBox(width: 60,),
            Icon(Icons.edit,color: Color.fromARGB(255, 133, 130, 130),),
            SizedBox(width: 10,),
            Icon(Icons.delete,color: Color.fromARGB(255, 177, 32, 21),) 
          ],
        ),
      ),
    ],
  );
}

  }