
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
  late List<File> _imagelist =[];
  final _selectController = TextEditingController();

  String selectedCategory = 'income';
  var items = ['income', 'expense'];

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
                    DropdownButton<String>(
                      value: selectedCategory,
                      items: items.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              color: item == 'income'
                                  ? Color.fromARGB(255, 15, 72, 17)
                                  : item == 'expense'
                                      ? Colors.red
                                      : Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedCategory = value!;
                          _selectController.text = value;
                        });
                      },
                      style: TextStyle(
                        color: selectedCategory == 'income'
                            ? const Color.fromARGB(255, 26, 82, 28)
                            : selectedCategory == 'expense'
                                ? Colors.red
                                : Colors.black,
                      ),
                    ),
                    TextFormField(
                      controller: _selectController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.swap_vert),
                        hintText: selectedCategory,
                        fillColor: Color.fromARGB(255, 231, 230, 230),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a category';
                        }
                        return null;
                      },
                    ),
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
        select: _select,
      
      );

      addExpense(_expense);

       Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Descriptionscreen(expense: ExpenseList(description: '', amount: '', select: '')),
      ));
    }
  }


 }
