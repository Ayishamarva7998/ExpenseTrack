import 'package:flutter/material.dart';
import 'package:splitwise_app/bottombar.dart';
import 'package:splitwise_app/functions/contactlist_fn.dart';
import 'package:splitwise_app/functions/grouplist_fn.dart';
import 'package:splitwise_app/model/contactlist_model.dart';
import 'package:splitwise_app/model/grouplist_model.dart';
import 'package:splitwise_app/screens/addcontact.dart';
import 'package:splitwise_app/screens/friends_screen.dart';
import 'package:splitwise_app/screens/groups_screen.dart';

class Addgroup extends StatefulWidget {
  const Addgroup({super.key});
  @override
  State<Addgroup> createState() => _AddgroupState();
}

List<bool> _isChecked = List.generate(contactListNotifier.value.length, (index) => false);

class _AddgroupState extends State<Addgroup> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => bottombar(),));
            },
            icon: Icon(Icons.arrow_back,color: Colors.black,),
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
                SizedBox(width: 280,),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                SizedBox(width: 10,),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Addcontact(),));
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
                    builder: (BuildContext ctx, List<ContactList> contactList, Widget? child) {
                      return ListView.builder(
                      //  shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                        final data = contactList[index];  
                        return ListTile(
                          title: Text(data.name),
                          subtitle: Text(data.number),
                          trailing: Checkbox(
                            value:data.isDone,
                            onChanged: (newvalue) {
                              setState(() {
                               data.isDone=newvalue!;
                               addcheck(index, data);
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
            Align(
              alignment: Alignment.topCenter,
              child: FloatingActionButton.extended(
                backgroundColor: Color.fromARGB(255, 92, 172, 162),
                onPressed: () {
                  navigateToMakeGroupDialog(context);
                },
                label: Text('Make a Group'),
              ),
            ),  
          ], 
        ),
      ),
    );
  }
  void navigateToMakeGroupDialog(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MakeGroupDialog();
        },
      ),
    );
  }
}

class MakeGroupDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Group Name"),
      content: TextField(),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Groupscreen(group: GroupList(contacts: '', groupname: '',isdone: false)),));
          },
          child: Text("OK"),
        ),
      ],
    );
  }
}
