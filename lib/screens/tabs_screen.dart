import 'package:flutter/material.dart';
import 'package:flutterapp/screens/Categories_screen.dart';
import 'package:flutterapp/screens/favorites_screen.dart';
import 'package:flutterapp/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  
 
final List<Map<String,Object>>  pages =[
   {'page': CategoriesScreen(),
        'title':"Categories"} ,
 {'page':FavoritesScreen(),
  'title':"Favourites"} 

];

int selectedPage=0;
  void selectPage(int index){

setState(() {
    selectedPage    =  index;
});
 
 

  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text(pages[selectedPage]['title']),
         
        
        ),
        drawer: MainDrawer(),
       
        body: pages[selectedPage]['page'],
 
   bottomNavigationBar: BottomNavigationBar(
     onTap: selectPage,   
     backgroundColor: Theme.of(context).primaryColor,
     unselectedItemColor: Colors.white,
     selectedItemColor: Colors.black,
     currentIndex: selectedPage,

     
      selectedFontSize: 20,
      type: BottomNavigationBarType.shifting,
      items: [
    BottomNavigationBarItem(backgroundColor: Colors.purple, icon: Icon(Icons.category),title: Text('category')),
    BottomNavigationBarItem(icon: Icon(Icons.favorite),title: Text('favourite')),
     
      ],
      
   ),

      );
    
  }
}
