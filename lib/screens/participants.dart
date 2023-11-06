import 'package:flutter/material.dart';
import 'package:splitwise_app/functions/db_functions.dart';
import 'package:splitwise_app/functions/functions3.dart';
import 'package:splitwise_app/model/data_model.dart';
import 'package:splitwise_app/model/data_model3.dart';

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
          
         
        ],backgroundColor: Color.fromARGB(255, 22, 140, 124),),
        body: Column(
          
          children: [
            SizedBox(height: 10,),
            Text('Participants',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            Expanded(
              child: Builder(
                  builder: (context) {
                    return ValueListenableBuilder(
                      valueListenable: contactListNotifier,
                      builder: (BuildContext ctx, List<ContactList> contactList, Widget? child) {
                        final checktask =contactList.where((contacts) => contacts.isDone).toList(); 
                        return ListView.builder(
                        //  shrinkWrap: true,
                          itemBuilder: (ctx, index) {
                          final data = checktask[index];  
                          return ListTile(
                            title: Text(data.name),
                            subtitle: Text(data.number),
                          
                          );
                        },
                        itemCount: contactList.length,
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