import 'package:hive_flutter/hive_flutter.dart';
part 'data_model3.g.dart';


@HiveType(typeId: 3)
class GroupList{

  @HiveField(0)
  final String contacts;

  @HiveField(1)
  final String groupname;

  

   
  GroupList({required this.contacts,required this.groupname});
 
}
 
 