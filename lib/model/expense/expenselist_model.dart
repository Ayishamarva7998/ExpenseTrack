import 'package:hive_flutter/hive_flutter.dart';
part 'expenselist_model.g.dart';


@HiveType(typeId: 2)
class ExpenseList{

 

  @HiveField(0)
  final String description;

  @HiveField(1)
  final String amount;
 
  @HiveField(2)
  final String select;

  
 
  

 
   
  ExpenseList({required this.description,required this.amount,required this.select});
 
}
 
