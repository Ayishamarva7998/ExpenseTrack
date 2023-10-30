 import 'package:flutter/material.dart';
import 'package:splitwise_app/model/data_model.dart';

 ValueNotifier<List<ContactList>> contactListNotifier =ValueNotifier([]);


void addContact(ContactList value)
{
  contactListNotifier.value.add(value);
  print(value.toString());
}