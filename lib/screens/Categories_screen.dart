

import 'package:flutter/material.dart';


import 'package:flutterapp/dumy_data.dart';
import 'package:flutterapp/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  //here we will give the data and the structure for holding of the data 

    
  
  @override
  Widget build(BuildContext context) {
    
    return  GridView(


            padding: EdgeInsets.all(25),
          children: DUMMY_CATEGORIES.map((catData) => CategoryItem(
                 
                catData.id,
                catData.title,
                catData.color)
            
                ).toList(),
                
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
      );
        
    
  }
}
