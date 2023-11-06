import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:splitwise_app/model/data_model3.dart';

ValueNotifier<List<GroupList>> groupListNotifier =ValueNotifier([]);
 Future<void> addGroup(GroupList value)async{
   final groupDB = await Hive.openBox<GroupList>('group_db');
     await groupDB.add(value);
   groupListNotifier.value.add(value);
   groupListNotifier.notifyListeners();
 }
   Future<void> getAllgroup()async{
    final groupDB = await Hive.openBox<GroupList>('group_db');
   groupListNotifier.value.clear();
    groupListNotifier.value.addAll(groupDB.values);
    groupListNotifier.notifyListeners();

    
   }

 


 