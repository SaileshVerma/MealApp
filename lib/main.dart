import 'package:flutter/material.dart';
import 'package:flutterapp/dumy_data.dart';
import 'package:flutterapp/models/meal.dart';
import 'package:flutterapp/screens/category_meals_screen.dart';
import 'package:flutterapp/screens/filters_screen.dart';

import 'package:flutterapp/screens/meal_detail_screen.dart';
import 'package:flutterapp/screens/tabs_screen.dart';

void  main()=> runApp(MyApp());



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
Map<String,bool>  _filters={
'gluten': false,
'lactose': false,
'vegan':false,
'vegetarian':false


};
List<Meal>  _availableMeals = DUMMY_MEALS;
void _setFilters (Map<String,bool>   filterData){
setState(() {
  
  _filters=filterData;
  _availableMeals=DUMMY_MEALS.where((meal){
   
if(_filters['gluten']&& !meal.isGlutenFree){
  return false;
}
if(_filters['lactose']&& !meal.isLactoseFree){
  return false;
}
if(_filters['vegan']&& !meal.isVegan){
  return false;
}
if(_filters['vegetarian']&& !meal.isVegetarian){
  return false;
}


return true;


  }).toList();
});

}



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
title: 'DeliMeals',
theme: ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.purple,
  fontFamily: 'Raleway',
  textTheme: ThemeData.light().textTheme.copyWith(
    body1:TextStyle(
      color: Color.fromRGBO(20, 51, 52, 1)

    ),
    body2:TextStyle(
      color: Color.fromRGBO(20, 51, 52, 1)

    ),
    title: TextStyle(
      fontFamily: 'RobotoCondensed',
      fontSize: 24,
      fontWeight: FontWeight.bold
    )
  )
),

routes: {
  '/':   (ctx)=>TabScreen(),

     CategoryMealScreen.routeName   : (ctx)=> CategoryMealScreen(_availableMeals),
  MealDetailScreen.routeName: (ctx)=>MealDetailScreen(),
FiltersScreen.routeName: (ctx)=>     FiltersScreen(_filters,_setFilters),
},


    );
  }
}

