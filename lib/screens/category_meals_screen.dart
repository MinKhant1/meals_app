import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'] as String;

      final categoryId = routeArgs['id'];
      displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String meal_id) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == meal_id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return displayedMeals == null || categoryTitle == null
                ? Container()
                : MealItem(
                    id: displayedMeals[index].id,
                    title: displayedMeals[index].title,
                    imageUrl: displayedMeals[index].imageUrl,
                    duration: displayedMeals[index].duration,
                    complexity: displayedMeals[index].complexity,
                    affordability: displayedMeals[index].affordability,
                    removeItem: _removeMeal,
                  );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
