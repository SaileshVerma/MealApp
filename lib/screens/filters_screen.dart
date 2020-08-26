import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
final Function saveFilters;
final Map<String,bool> currentFilters;

FiltersScreen(this.currentFilters, this.saveFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isglutenFree = false;
  var vegetarian = false;
  var _vegan = false;

  var _lactoseFree = false;


   initState(){

      _isglutenFree = widget.currentFilters['gluten'];
   vegetarian = widget.currentFilters['vegetarian'];
   _vegan = widget.currentFilters['vegan'];

 _lactoseFree = widget.currentFilters['lactose'];
     super.initState();
   }

  Widget _buildSwitchTileView(
      String title, String subtitle, bool currentValue, Function updatevalue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currentValue,
        onChanged: updatevalue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Filters"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed:(){
            
            final selectedFilters ={

'gluten': _isglutenFree,
'lactose': _lactoseFree,
'vegan':_vegan,
'vegetarian':vegetarian

            };
            
            
            widget.saveFilters(selectedFilters);
          } )
        ],),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Adjust Your Meal selection here',
                  style: Theme.of(context).textTheme.title,
                )),
            Expanded(
                child: ListView(
              children: <Widget>[
                _buildSwitchTileView(
                    'Gluten-Free',
                    'only include the gluten free value',
                    _isglutenFree, (newValue) {
                  setState(() {
                    _isglutenFree = newValue;
                  });
                }),
                _buildSwitchTileView(
                    'Lactose-Free',
                    'only include the lactose free value',
                    _lactoseFree, 
                    (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),

 _buildSwitchTileView(
                    'Vegetarian',
                    'only include the vegetarian  meals',
                    vegetarian, (newValue) {
                  setState(() {
                    vegetarian = newValue;
                  });
                }),
                _buildSwitchTileView(
                    'Vegan-Free',
                    'only include the vegan free value',
                    _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
               





              ],
            )),
          ],
        ));
  }
}
