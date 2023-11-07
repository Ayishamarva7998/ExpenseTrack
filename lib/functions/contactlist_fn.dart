import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:splitwise_app/model/contactlist_model.dart';

 ValueNotifier<List<ContactList>> contactListNotifier =ValueNotifier([]);
Future<void> addContact(ContactList value) async{
 final contactDB = await Hive.openBox<ContactList>('contact_db');
  await contactDB.add(value); 
 contactListNotifier.value.add(value);
 contactListNotifier.notifyListeners();
}
 Future<void> getAllcontacts() async{
   final contactDB = await Hive.openBox<ContactList>('contact_db');
   contactListNotifier.value.clear();
   contactListNotifier.value.addAll(contactDB.values);
   contactListNotifier.notifyListeners();

 }
 void addcheck(int id,ContactList data)async{
   final contactDB = await Hive.openBox<ContactList>('contact_db');
   await contactDB.putAt(id, data);
   getAllcontacts();
 }
 

 
