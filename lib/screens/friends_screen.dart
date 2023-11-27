import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:splitwise_app/bottombar.dart';
import 'package:splitwise_app/functions/contactlist_fn.dart';
import 'package:splitwise_app/model/contact.dart/contactlist_model.dart';

import 'package:splitwise_app/screens/addcontact_screen.dart';
import 'package:splitwise_app/screens/edit_screen.dart';

class Friendsscreen extends StatefulWidget {
  ContactList contact;
  Friendsscreen({Key? key, required this.contact}) : super(key: key);

  @override
  State<Friendsscreen> createState() => _FriendsscreenState();
}

class _FriendsscreenState extends State<Friendsscreen> {
 
  List contactList = [];
  String _search ='';
  List<ContactList>filteredContactList =[];
  List<ContactList> details=[];
 

  @override
  void initState(){
    super.initState();
    getAllcontacts();
  }
  void filteredContact() {
    setState(() {
      filteredContactList = contactListNotifier.value
          .where((ContactList) =>
              ContactList.name.toLowerCase().contains(_search.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => bottombar(),
                ));
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          backgroundColor: Color.fromARGB(255, 22, 140, 124),
          elevation: 0,
          title: const Text(
            'Friends',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Addcontact(),
                  ));
                },
                icon: const Icon(Icons.person_add),color: Colors.black)
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'search contacts',
                    fillColor: const Color.fromARGB(255, 237, 235, 235),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    prefixIcon: const Icon(Icons.search),
                   
                     ),
                onChanged: (value) {
                  setState(() {
                    _search = value;
                    filteredContact(); 
                  });
                },
              ),
            ),
            Expanded(
              child: Builder(builder: (context) {
                return ValueListenableBuilder(
                    valueListenable: contactListNotifier,
                    builder: (BuildContext ctx, List<ContactList> contactList,
                        Widget? child) {
                          final displaylist = filteredContactList.isNotEmpty? filteredContactList : contactList;
                      return ListView.builder(
                        itemBuilder: (ctx, index) {
                          final data = displaylist[index];
                          return ListTile(
                            title: Text(data.name),
                            subtitle: Text(data.number),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => EditContacts(
                                        name: data.name,
                                        number: data.number,
                                        index: index,
                                      ),
                                    ));
                                  },
                                  icon: Icon(Icons.edit, color: Colors.grey),
                                ),
                                IconButton(
                                  onPressed: () {
                                    deleteContacts(index);
                                  },
                                  icon: Icon(Icons.delete, color: Colors.grey),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: displaylist.length,
                      );
                    });
              }),
            ),
          ],
        ),
      ),
    );
  }

  
}

  Row contactlist({required String name, required String number}) {
    return Row(
      children: [
        const SizedBox(width: 10),
        const CircleAvatar(radius: 30, backgroundColor: Colors.grey),
        const SizedBox(width: 30),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                  Text(
                    'Number: $number',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                width: 60,
              ),
              const Icon(
                Icons.edit,
                color: Color.fromARGB(255, 133, 130, 130),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.delete,
                color: Color.fromARGB(255, 177, 32, 21),
              )
            ],
          ),
        ),
      ],
    );
  }

