import 'package:hive/hive.dart';
part 'data_model.g.dart';


@HiveType(typeId: 1)
class ContactList{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String number;
  ContactList({required this.name,required this.number});

}