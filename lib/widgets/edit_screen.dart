import 'package:flutter/material.dart';
import 'package:splitwise_app/model/expense/expenselist_model.dart';
import 'package:splitwise_app/screens/description_screen.dart';
import 'package:splitwise_app/widgets/bottombar.dart';
import 'package:splitwise_app/functions/contactlist_fn.dart';



class EditContacts extends StatefulWidget {
  final String description;
  final String amount;
  int index;

  EditContacts({
    super.key,
    required this.description,
    required this.amount,
    required this.index,
  });

  @override
  State<EditContacts> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<EditContacts> {
  TextEditingController description = TextEditingController();
  TextEditingController amount = TextEditingController();

  @override
  void initState() {
    super.initState();
    description = TextEditingController(text: widget.description);
    amount = TextEditingController(text: widget.amount);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 15, 132, 116),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 22, 140, 124),
            title: Text('EDIT detailes'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 320,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            controller: description,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'edit your  expense',
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
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            controller: amount,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'edit  description',
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
                          backgroundColor: Colors.white,
                        ),
                        child: const Text(
                          "Edited expense",
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  bottomsheet(BuildContext context) {
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
                  "choose your daily routine",
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
                              builder: (ctx) => Descriptionscreen(expense: ExpenseList(description: '', amount: '' ,image: ''),)),
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
                              'create your own habit',
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
                              'create your own Task',
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
    final editedDescriptioname = description.text.trim();
    final editedAmount = amount.text.trim();

    if (editedDescriptioname.isEmpty || editedAmount.isEmpty) {
      return;
    } else {
      final updated =
          ExpenseList(description: editedDescriptioname, amount:editedAmount,image: '');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        margin: EdgeInsets.all(10),
        backgroundColor: Colors.grey,
        behavior: SnackBarBehavior.floating,
        content: Text("updated successfully"),
      ));
      editExpense(widget.index, updated);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => bottombar()));
    }
  }
}
