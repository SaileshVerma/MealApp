import 'package:flutter/material.dart';
import 'package:flutterapp/dumy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text('Ingredeints', style: Theme.of(context).textTheme.title));
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text('${selectedMeal.title}'),
        ),
        
        
        body: SingleChildScrollView(
                  child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image(
                  image: AssetImage(
                    selectedMeal.imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, 'Ingredients'),
              buildContainer(ListView.builder(
                itemBuilder: (ctx, index) => Card(
                    color: Colors.pinkAccent,
                    child: Text(
                      selectedMeal.ingredients[index],
                    )),
                itemCount: selectedMeal.ingredients.length,
              )),
              buildSectionTitle(context, 'Steps'),
              buildContainer(ListView.builder(
                itemBuilder: (ctx, index) => ListTile(
                  leading: CircleAvatar(child: Text('# ${index + 1}')),
                 title: Text(selectedMeal.steps[index]),

                ),
                itemCount: selectedMeal.steps.length,
              ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child : Icon(Icons.delete),
          onPressed: (){

       Navigator.of(context).pop(mealId);

          },
        )
        );
  }
}