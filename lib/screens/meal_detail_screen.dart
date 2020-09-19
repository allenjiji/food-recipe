import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/MealDetailScreen';

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15)
        ),
        height: 300,
        width: double.infinity,
        child: child);
  }

  Widget buildsectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              //decoration: BoxDecoration(border:Border.all(color:Colors.black)),
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildsectionTitle(context, 'INGREDIENTS'),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (context, index) => Card(
                  margin: EdgeInsets.all(6),
                  color: Colors.amber,
                  child: Text(
                    selectedMeal.ingredients[index],
                    style: TextStyle(fontSize: 20,),
                  ),
                ),
              ),
            ),
            buildsectionTitle(context, selectedMeal.title),
            buildContainer(ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${(index + 1)}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),Divider()
                  ],
                );
              },
              itemCount: selectedMeal.steps.length,
            ))
          ],
        ),
      ),
    );
  }
}