import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splitwise_app/functions/expense_fn.dart';
import 'package:splitwise_app/model/expense/expenselist_model.dart';
import 'package:splitwise_app/screens/description_screen.dart';
import 'package:splitwise_app/widgets/bottombar.dart';

class EditData extends StatefulWidget {
  final String description;
  final String amount;

  int index;

  EditData({
    super.key,
    required this.description,
    required this.amount,
    required this.index,
  });

  @override
  State<EditData> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<EditData> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  File? selectImage;
  final selectController = TextEditingController();

  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController(text: widget.description);
    amountController = TextEditingController(text: widget.amount);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 42, 120, 114),
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Edit Expense'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          selectImage != null ? FileImage(selectImage!) : null,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 80,
                      width: 320,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          controller: descriptionController,
                          style: TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Edit your expense',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 320,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          controller: amountController,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Edit amount',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          update();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      child: const Text(
                        "Done",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: const Color.fromARGB(255, 34, 32, 32),
          height: 320.0,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Choose your daily routine",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 102, 91, 91),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => Descriptionscreen(
                                    expense: ExpenseList(
                                        description: '', amount: '', image: ''),
                                  )),
                        );
                      },
                      child: Container(
                        height: 100,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person),
                            SizedBox(width: 10),
                            Text(
                              'Create your own habit',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 100,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.task),
                            SizedBox(width: 10),
                            Text(
                              'Create your own Task',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> update() async {
    final editedDescription = descriptionController.text.trim();
    final editedAmount = amountController.text.trim();

    if (editedDescription.isEmpty || editedAmount.isEmpty) {
      return;
    } else {
      final updated = ExpenseList(
          description: editedDescription, amount: editedAmount, image: '');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        margin: EdgeInsets.all(10),
        backgroundColor: Colors.grey,
        behavior: SnackBarBehavior.floating,
        content: Text("Updated successfully"),
      ));
      editExpense(widget.index, updated);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => bottombar()));
    }
  }
}
