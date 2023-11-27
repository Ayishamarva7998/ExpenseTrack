import 'package:flutter/material.dart';
import 'package:splitwise_app/bottombar.dart';
import 'package:splitwise_app/functions/contactlist_fn.dart';
import 'package:splitwise_app/functions/grouplist_fn.dart';

import 'package:splitwise_app/model/grouplist_model.dart';
import 'package:splitwise_app/screens/addcontact_screen.dart';
import 'package:splitwise_app/screens/groups_screen.dart';

import '../model/contact.dart/contactlist_model.dart';

class Addgroup extends StatefulWidget {
  const Addgroup({super.key});
  @override
  State<Addgroup> createState() => _AddgroupState();
}

List<bool> _isChecked =
    List.generate(contactListNotifier.value.length, (index) => false);

class _AddgroupState extends State<Addgroup> {
  List<ContactList> selectedContacts = [];

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
            ),
          ),
          backgroundColor: Color.fromARGB(255, 22, 140, 124),
          elevation: 0,
          title: const Text(
            'Connect Friends',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 280,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Addcontact(),
                    ));
                  },
                  icon: Icon(Icons.person_add),
                ),
              ],
            ),
            Expanded(
              child: Builder(
                builder: (context) {
                  return ValueListenableBuilder(
                    valueListenable: contactListNotifier,
                    builder: (BuildContext ctx, List<ContactList> contactList,
                        Widget? child) {
                      return ListView.builder(
                        itemBuilder: (ctx, index) {
                          final data = contactList[index];
                          return ListTile(
                            title: Text(data.name),
                            subtitle: Text(data.number),
                            trailing: Checkbox(
                              value: data.isDone,
                              onChanged: (newvalue) {
                                setState(() {
                                  data.isDone = newvalue!;
                                  if (newvalue!) {
                                    selectedContacts.add(data);
                                  } else { 
                                    selectedContacts.remove(data);
                                  }
                                });
                              },
                            ),
                          );
                        },
                        itemCount: contactList.length,
                      );
                    },
                  );
                },
              ),
            ),
            // Align(
            //   alignment: Alignment.topCenter,
            //   child: FloatingActionButton.extended(
            //     backgroundColor: Color.fromARGB(255, 92, 172, 162),
            //     onPressed: () {
            //       navigateToMakeGroupDialog(context);
            //     },
            //     label: Text('Make a Group'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // void navigateToMakeGroupDialog(BuildContext context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) {
  //         return MakeGroupDialog(selectedContacts: selectedContacts);
  //       },
  //     ),
  //   );
  // }
}

// class MakeGroupDialog extends StatelessWidget {
//   final List<ContactList> selectedContacts;

//   MakeGroupDialog({required this.selectedContacts});

//   final TextEditingController groupNameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text("Group Name"),
//       content: TextField(controller: groupNameController),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           child: Text("Cancel"),
//         ),
//         TextButton(
//           onPressed: () {
//             studentAdder(context);
//           },
//           child: Text("OK"),
//         ),
//       ],
//     );
//   }

//   void studentAdder(context) {
//     final groupname = groupNameController.text.trim();
//     if (groupname.isNotEmpty) {
//       final group =
//           GroupList(contacts: '', groupname: groupname, isdone: false);
//       addGroup(group);
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => Groupscreen(),
//         ),
//       );
//     }
//   }
// }
