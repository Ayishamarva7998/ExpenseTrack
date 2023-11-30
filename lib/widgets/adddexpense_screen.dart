
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splitwise_app/screens/description_screen.dart';
import 'package:splitwise_app/widgets/bottombar.dart';
import 'package:splitwise_app/functions/expense_fn.dart';
import 'package:splitwise_app/model/expense/expenselist_model.dart';
import 'package:image_picker/image_picker.dart';



class Addexpense extends StatefulWidget {
  Addexpense({
    Key? key,c
  }) : super(key: key);

  @override
  State<Addexpense> createState() => _AddexpenseState();
}

class _AddexpenseState extends State<Addexpense> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();
 
  File ? _selectImage;
  final _selectController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => bottombar(),
            ));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Add expenses',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
              ),
              GestureDetector(
                onTap: pickedImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.amber,
                  backgroundImage: _selectImage!=null 
                ? FileImage(_selectImage!)
                :AssetImage("assets/billss.jpg")as ImageProvider,
                
                ),
              ),
             
              
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.description),
                        hintText: 'description',
                        fillColor: Color.fromARGB(255, 231, 230, 230),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _amountController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.currency_rupee),
                        hintText: 'amount',
                        fillColor: Color.fromARGB(255, 231, 230, 230),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an amount';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                   
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        onAddExpenseButtonClicked(context);
                        // _showPopup(context);
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 92, 172, 162),
                        ),
                        child: const Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  

  Future<void> onAddExpenseButtonClicked(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final _description = _descriptionController.text.trim();
      final _amount = _amountController.text.trim();
      final _select = _selectController.text.trim();

      final _expense = ExpenseList(
        description: _description,
        amount: _amount,
        image: _selectImage?.path,
       
      
      );

      addExpense(_expense);

       Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Descriptionscreen(expense: ExpenseList(description: '', amount: '', image: '')),
      ));
    }
  }
Future<void> pickedImage() async {
  final picker = ImagePicker();
  final pickedImage = await picker.pickImage(source: ImageSource.gallery);
  if (pickedImage != null) {
    final imageFile = File(pickedImage.path);
    setState(() {
      _selectImage = imageFile;
    });
  }
}

 }
