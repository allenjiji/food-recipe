import 'package:flutter/material.dart';
import './drawer_menu.dart';
import '../screens/favorite_screen.dart';
import '../screens/categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String,Object>> _pages =[{'page':CategoriesScreen(),'title':'Categories'},{'page':FavoriteScreen(),'title':'Favorites'}];
  int selectedPageIndex=0;
  void _selectpage(int index){
    setState(() {
      selectedPageIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text(_pages[selectedPageIndex]['title']),
        ),
        body: _pages[selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            title: Text('Favorites'),
          )
        ],
        onTap: _selectpage,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectedPageIndex,),
      ),
    );
  }
}
