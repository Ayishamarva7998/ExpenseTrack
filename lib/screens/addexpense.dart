import 'package:flutter/material.dart';
import 'package:splitwise_app/bottombar.dart';
import 'package:splitwise_app/functions/db_function2.dart';
import 'package:splitwise_app/functions/db_functions.dart';
import 'package:splitwise_app/model/data_model2.dart';
import 'package:splitwise_app/screens/firstgroup.dart';

class Addexpense extends StatefulWidget {
  Addexpense({Key? key}) : super(key: key);
  

  @override
  State<Addexpense> createState() => _AddexpenseState();
}

class _AddexpenseState extends State<Addexpense> {
  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();
  String selectedCategory = 'select category';
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
          
          const Align(alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text('Add expenses',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
            )),
          SizedBox(height:  40,),
          Text('Tech House',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
         
          SizedBox( height: 140),
          Align(
            child: SingleChildScrollView(
              child: Container(
                height: 400,
                width: 350,
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(leading: Icon(Icons.description_outlined,size: 40,),title: 
                     TextFormField (
                 controller: _descriptionController,
                  decoration: InputDecoration(hintText: 'description',
                 
                 fillColor: Color.fromARGB(255, 231, 230, 230),filled: true,border: 
                           OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),),
                     ListTile(leading: Icon(Icons.currency_rupee,size: 40,),title:TextFormField(
                         controller: _amountController,
                        decoration: InputDecoration(hintText: 'amount',
                       
                        fillColor: Color.fromARGB(255, 231, 230, 230),filled: true,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),

                     ) ,
            
                    trailing: Icon(Icons.expand_more,color: Colors.white,),),
                    DropdownButton<String>(items: [
                      
            
                      'select category',
                      'income',
                      'expense'
                    ].map((String value){
                      return DropdownMenuItem<String>(value: value,child: Text(value),);
                    }).toList(),
                    onChanged:( String? value) {
                      setState(() {
                        selectedCategory = value!;
                      });
                     },
                      value: selectedCategory, 
                    ), 
                    
                    ElevatedButton.icon(onPressed: (){
                onAddExpenseButtonClicked(context);
              }, icon: Icon(Icons.add), label: Text('done'))
                    
                  ],
                ),
              ),
            ),
          )
        ],
      ),

    );
  }
   Future<void> onAddExpenseButtonClicked(BuildContext context) async {
      final _description = _descriptionController.text.trim();
      final _amount = _amountController.text.trim();
      if (_description.isEmpty || _amount.isEmpty) { 
        return;
      } else {
        final expense = (description:_description, amount:_amount);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Firstgroup(expense: ExpenseList(description: _description,amount: _amount),),
        ));

      }
      print('$_description $_amount');
     final _expense = ExpenseList(description: _description, amount: _amount);

      addExpense(_expense);

    }
}