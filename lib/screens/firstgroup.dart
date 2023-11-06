import 'package:flutter/material.dart';
import 'package:splitwise_app/bottombar.dart';
import 'package:splitwise_app/functions/db_function2.dart';
import 'package:splitwise_app/model/data_model2.dart';
import 'package:splitwise_app/model/data_model3.dart';
import 'package:splitwise_app/screens/groups_screen.dart';
import 'package:splitwise_app/screens/memebers.dart';

class Firstgroup extends StatelessWidget {
   ExpenseList expense;
  Firstgroup({Key? key,required this.expense}) : super(key: key);
   List expenseList =[];  


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Expenses',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black),),
         leading: IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>bottombar(),));
          
         }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
         backgroundColor: Color.fromARGB(255, 22, 140, 124),elevation: 0,
        ),
        body: Column(
          children: [
          GestureDetector(onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder:(context) => Members(memebers: GroupList(contacts: '', groupname: '')),));
          },
            child: Row(children: [
              Align(alignment: Alignment.topRight,
                child: Text('Members',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
              Align(alignment: Alignment.topRight,
                child: Icon(Icons.group_add,size: 22,))
          
            ],),
          ),

            SizedBox(height: 50,),
            Align(alignment: Alignment.topRight,
              child: Text('Total Income:1069.00',style:TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15),)),
            Align(alignment: Alignment.topRight,
              child: Text('total Expense:120.00',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 15),)),
              const Align(alignment: Alignment.topLeft,
                child: Text('Oct 19',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
             Expanded(
          child: Builder(
            builder: (context) {
              return ValueListenableBuilder(
                valueListenable: expenseListNotifier,
                builder:(BuildContext ctx,List<ExpenseList> contactList,Widget? child){
                   return ListView.builder(itemBuilder: (ctx, index) {
        
                  final data = contactList[index];
                  return ListTile(
                    title: Text(data.description),
                    subtitle: Text(data.amount),
                    trailing: Text(data.select),
                    
                    
                  );
                },
                itemCount: contactList.length,
                );},); }),),
            
          ],
         
          
        ),
    
      ),
    );
  }

  ListTile list({required IconData icon, required String title,required String text1,required String text2,required String amount  }) {
    return ListTile(leading: Icon(icon),
    title: Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
           subtitle: Text(text1),
           trailing: Column(
             children: [
               Text(text2,style: const TextStyle(color: Colors.red
               ),),
               SizedBox(height: 10,),
               Text(amount,style: TextStyle(color: Colors.red),)
             ],
           ),
           
           );
  }
}