import 'package:flutter/material.dart';
import 'package:splitwise_app/widgets/bottombar.dart';
import 'package:splitwise_app/functions/contactlist_fn.dart';
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
                            title: Text(data.description),
                            subtitle: Text(data.amount),
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
          
          ],
        ),
      ),
    );
  }

 
}


