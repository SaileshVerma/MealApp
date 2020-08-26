import 'package:flutter/material.dart';
import 'package:flutterapp/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title,
          style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
              fontSize: 24)),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            height: 120,
            width: double.infinity,
            color: Colors.amberAccent,
            alignment: Alignment.centerLeft,
            child: Text(
              'cooking Up!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(height: 20),
          buildListTile('Meals',
           Icons.restaurant,
              (){
                Navigator.of(context).pushReplacementNamed('/');
              }   ),
          buildListTile('Filters',
           Icons.settings,
           (){
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
           }
           ),
        ],
      ),
    );
  }
}
