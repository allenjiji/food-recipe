import 'package:flutter/material.dart';


class MainDrawer extends StatelessWidget {
  Widget listObject(String text, IconData icon,Function fn) {
    return ListTile(
      onTap: fn,
      leading: Icon(icon),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
              'Explore the Tastes!',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            height: 200,
          ),
          SizedBox(
            height: 50,
          ),
          listObject('Favorites', Icons.favorite_border,(){Navigator.of(context).pushNamed('/');}),
          listObject('Filter', Icons.settings,(){Navigator.of(context).pushNamed('/');})
        ],
      ),
    );
  }
}
