import 'package:flutter/material.dart';
import 'package:splitwise_app/functions/contactlist_fn.dart';
import 'package:splitwise_app/model/group/grouplist_model.dart';
import '../model/contact.dart/contactlist_model.dart';

class Participants extends StatefulWidget {
  GroupList memebers;
  Participants({Key? key, required this.memebers}) : super(key: key);

  @override
  State<Participants> createState() => _MembersState();
}

class _MembersState extends State<Participants> {
  List groupList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: const [],
          backgroundColor: Color.fromARGB(255, 22, 140, 124),
          title: const Text(
            'Participants',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Builder(
                builder: (context) {
                  return ValueListenableBuilder(
                    valueListenable: contactListNotifier,
                    builder: (BuildContext ctx, List<ContactList> contactList,
                        Widget? child) {
                      final checktask = contactList
                          .where((contacts) => contacts.isDone)
                          .toList();
                      return ListView.builder(
                        itemBuilder: (ctx, index) {
                          if (checktask.isEmpty) {
                            return const Center(
                                child: Text('No participants available.'));
                          } else {
                            final data = checktask[index];
                            return ListTile(
                              title: Text(data.name),
                              subtitle: Text(data.number),
                            );
                          }
                        },
                        itemCount: checktask.length,
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
