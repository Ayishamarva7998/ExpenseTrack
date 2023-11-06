import 'package:flutter/material.dart';
import 'package:splitwise_app/functions/functions3.dart';
import 'package:splitwise_app/model/data_model3.dart';

class Members extends StatelessWidget {
   GroupList memebers;
     Members({Key? key,required this.memebers}) : super(key: key);
      List groupList=[];  
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        
        Icon(Icons.abc)
      ]),
      body: Column(
        children: [
           Expanded(
          child: Builder(
            builder: (context) {
              return ValueListenableBuilder(
                valueListenable: groupListNotifier,
                builder:(BuildContext ctx,List<GroupList> groupList,Widget? child){
                   return ListView.builder(itemBuilder: (ctx, index) {
        
                  final data = groupList[index];
                  return ListTile(
                    title: Text(data.contacts),
                    subtitle: Text(data.groupname),
                    
                    
                    
                  );
                },
                itemCount: groupList.length,
                );},); }),),
        ],
      ),
    );
  }
}