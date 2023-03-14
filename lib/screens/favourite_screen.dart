import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../widgets/meal_item.dart';

class Favourites extends StatelessWidget {
  final List<Meal> favouriteMeals;

  const Favourites({required this.favouriteMeals});
  void removeDummy() {
    print('hi');
  }

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favourites yet- start adding some'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return favouriteMeals == null || favouriteMeals == null
              ? Container()
              : MealItem(
                  id: favouriteMeals[index].id,
                  title: favouriteMeals[index].title,
                  imageUrl: favouriteMeals[index].imageUrl,
                  duration: favouriteMeals[index].duration,
                  complexity: favouriteMeals[index].complexity,
                  affordability: favouriteMeals[index].affordability,
                  removeItem: removeDummy,
                );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
