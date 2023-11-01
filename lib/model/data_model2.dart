import 'package:hive_flutter/hive_flutter.dart';
part 'data_model2.g.dart';


@HiveType(typeId: 2)
class ExpenseList{

  @HiveField(0)
  final String description;

  @HiveField(1)
  final String amount;

   
  ExpenseList({required this.description,required this.amount});
 
}
 
