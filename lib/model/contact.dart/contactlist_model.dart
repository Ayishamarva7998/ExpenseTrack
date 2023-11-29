import 'package:hive/hive.dart';
part 'contactlist_model.g.dart';


@HiveType(typeId: 1)
class ContactList{

  @HiveField(0)
  final String description;

  @HiveField(1)
  final String amount;
  
  @HiveField(2)
  late bool isDone;
  

   
  ContactList({required this.description,required this.amount,required this.isDone});
 
}