import 'package:flutter/material.dart';
import 'package:splitwise_app/functions/db_functions.dart';
import 'package:splitwise_app/model/data_model.dart';
import 'package:splitwise_app/screens/friends_screen.dart';

class Addcontact extends StatelessWidget {
   Addcontact({Key? key}) : super(key: key);
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: TextFormField(
                controller: _nameController,
                        decoration: InputDecoration
                        (hintText: 'name',fillColor: const Color.fromARGB(255, 231, 230, 230),filled: true,
              border: 
              OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
            ),
            
             Padding(
               padding: const EdgeInsets.only(top: 30,left: 30,right: 30),
               child: TextFormField (
                controller: _numberController,
                decoration: InputDecoration(hintText: 'phone no',
               fillColor: Color.fromARGB(255, 231, 230, 230),filled: true,border: 
                         OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
             ),
             SizedBox(height: 20,),

            ElevatedButton.icon(onPressed: (){
              onAddStudentButtonClicked(context);
            }, icon: Icon(Icons.add), label: Text('save'))
          ],
        ),
        
      ),
      

    );
  }
      Future<void> onAddStudentButtonClicked(BuildContext context) async {
      final _name = _nameController.text.trim();
      final _number = _numberController.text.trim();
      if (_name.isEmpty || _number.isEmpty) { 
        return;
      } else {
        final contact = (name: _name, number: _number);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Friendsscreen(contact: ContactList(name: _name, number: _number),),
        ));
      }
      print('$_name $_number');
     final _contact = ContactList(name: _name, number: _number);

      addContact(_contact);

    }
}