import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:splitwise_app/model/group/grouplist_model.dart';

ValueNotifier<List<GroupList>> groupListNotifier =ValueNotifier([]);
 addGroup(GroupList value)async{
   final groupDB = await Hive.openBox<GroupList>('group_db');
      
   groupListNotifier.value.add(value);
   groupDB.add(value);
   groupListNotifier.notifyListeners();
 }
 getAllgroup()async{
    final groupDB = await Hive.openBox<GroupList>('group_db');
   groupListNotifier.value.clear();
    groupListNotifier.value.addAll(groupDB.values);
    print(groupDB.values);
    print('hello');
    groupListNotifier.notifyListeners();

    
   }

 


 