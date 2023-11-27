import 'package:hive/hive.dart';
part 'contactlist_model.g.dart';


@HiveType(typeId: 1)
class ContactList{

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String number;
  
  @HiveField(2)
  late bool isDone;
  

   
  ContactList({required this.name,required this.number,required this.isDone});
 
}