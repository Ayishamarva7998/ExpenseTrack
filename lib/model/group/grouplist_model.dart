import 'package:hive_flutter/hive_flutter.dart';
part 'grouplist_model.g.dart';


@HiveType(typeId: 3)
class GroupList{

  @HiveField(0)
  final String contacts;

  @HiveField(1)
  final String groupname;

  @HiveField(2)
  late bool isdone;

  // @HiveField(3)
  // final String id;


   
  GroupList({required this.contacts,required this.groupname,required this.isdone});
 
}
 
 