import 'package:flutter/material.dart';
import 'package:navigation/models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String id;
  final String imgUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.title,
    @required this.duration,
    @required this.id,
    @required this.affordability,
    @required this.complexity,
    @required this.imgUrl,
  });
  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unknown';
        break;
    }
  }
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Challenging:
        return 'Challeging';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName,arguments: id);
  }
  @override
  Widget build(BuildContext context) {
    ;
    return InkWell(
      onTap: ()=>selectMeal(context),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imgUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.cyan.withOpacity(.5),
                    padding: EdgeInsets.all(5),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 5,
                        ),
                        Text(duration.toString() + ' min')
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.monetization_on),
                        SizedBox(
                          width: 5,
                        ),
                        Text( affordabilityText )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.bubble_chart),
                        SizedBox(
                          width: 5,
                        ),
                        Text( complexityText )
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
