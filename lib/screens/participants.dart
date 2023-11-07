import 'package:flutter/material.dart';
import 'package:splitwise_app/functions/contactlist_fn.dart';
import 'package:splitwise_app/functions/grouplist_fn.dart';
import 'package:splitwise_app/model/contactlist_model.dart';
import 'package:splitwise_app/model/grouplist_model.dart';

class Members extends StatefulWidget {
   GroupList memebers;
Members({Key? key,required this.memebers}) : super(key: key);

  @override
  State<Members> createState() => _MembersState();
}

class _MembersState extends State<Members> {
      List groupList=[];  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: const [
          
         
        ],backgroundColor: Color.fromARGB(255, 22, 140, 124),title: Text('Participants',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),),
        body: Column(
          
          children: [
            SizedBox(height: 10,),
  
            Expanded(
              child: Builder(
                  builder: (context) {
                    return ValueListenableBuilder(
                      valueListenable: contactListNotifier,
                      builder: (BuildContext ctx, List<ContactList> contactList, Widget? child) {
                        final checktask =contactList.where((contacts) => contacts.isDone).toList(); 
                       return ListView.builder(
                        itemBuilder: (ctx, index) {
                          if (checktask.isEmpty) {
                            return const Center(
                                child: Text('No participants available.'));
                          } else {
                            final data = checktask[index];
                            return ListTile(
                              title: Text(data.name),
                              subtitle: Text(data.number),
                            );
                          }
                        },
                        itemCount: checktask.length,
                      );
                      },
                    );
                  },
                ),
            ),
          ],
        ),
      ),
    );
  }
}