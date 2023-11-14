import 'package:flutter/material.dart';
import 'package:splitwise_app/bottombar.dart';
import 'package:splitwise_app/functions/contactlist_fn.dart';
import 'package:splitwise_app/model/contactlist_model.dart';
import 'package:splitwise_app/screens/friends_screen.dart';

class EditContacts extends StatefulWidget {
  final String name;
  final String number;
  int index;

  EditContacts({
    super.key,
    required this.name,
    required this.number,
    required this.index,
  });

  @override
  State<EditContacts> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<EditContacts> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    numberController = TextEditingController(text: widget.number);
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
                            controller: nameController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'edit your  contacts',
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
                            controller: numberController,
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
                          "Edited contacts",
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
                              builder: (ctx) => Friendsscreen(
                                  contact: ContactList(
                                      name: '', number: '', isDone: false))),
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
    final editedName = nameController.text.trim();
    final editedNumber = numberController.text.trim();

    if (editedName.isEmpty || editedNumber.isEmpty) {
      return;
    } else {
      final updated =
          ContactList(name: editedName, number: editedNumber, isDone: false);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        margin: EdgeInsets.all(10),
        backgroundColor: Colors.grey,
        behavior: SnackBarBehavior.floating,
        content: Text("updated successfully"),
      ));
      editContacts(widget.index, updated);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => bottombar()));
    }
  }
}
