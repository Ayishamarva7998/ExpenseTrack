import 'package:flutter/material.dart';
import 'package:splitwise_app/bottombar.dart';

class Addexpense extends StatefulWidget {
  const Addexpense({super.key});

  @override
  State<Addexpense> createState() => _AddexpenseState();
}

class _AddexpenseState extends State<Addexpense> {
  String selectedCategory = 'select category';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => bottombar(),));
        }, icon: Icon(Icons.arrow_back,color: Colors.black,))
      ),
      body:Column (
        children: [
          const Align(alignment: Alignment.topLeft,
            child: Text('Add expenses',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)),
          SizedBox(height:  70,),
          Text('Tech House',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          //  DropdownButton<String>(items: [
          //           'select category'
          //           'income',
          //           'expense'
          //         ].map((String value){
          //           return DropdownMenuItem<String>(value: value,child: Text(value),);
          //         }).toList(),
          //         onChanged:( String? value) {
          //           setState(() {
          //             selectedCategory = value!;
          //           });
          //          },
          //           value: selectedCategory,
          //         ), 
          SizedBox( height: 140),
          Align(
            child: Container(
              height: 200,
              width: 350,
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(leading: Icon(Icons.description_outlined,size: 40,),title: TextField(),),
                  const ListTile(leading: Icon(Icons.currency_rupee,size: 40,),title: TextField(),
                  trailing: Icon(Icons.expand_more,color: Colors.white,),),
                  DropdownButton<String>(items: [
                    

                    'select category',
                    'income',
                    'expense'
                  ].map((String value){
                    return DropdownMenuItem<String>(value: value,child: Text(value),);
                  }).toList(),
                  onChanged:( String? value) {
                    setState(() {
                      selectedCategory = value!;
                    });
                   },
                    value: selectedCategory,
                  ), 
                  
                  
                ],
              ),
            ),
          )
        ],
      ),
      
      

    );
  }
}