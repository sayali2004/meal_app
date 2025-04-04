import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key,required this.avialableMeals});
    //final void Function(Meal meal) onToggleFavourite;
    final List<Meal> avialableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with TickerProviderStateMixin{
  late  AnimationController _animationController;//late:Once this property is used it have value
  //Explicit Animation//Adding Animation Controller

  @override
  void initState() {
   
    super.initState();
    _animationController=AnimationController(  //Configuring Animation
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();//Start the Animation
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals.where(
      (meal) => meal.categories.contains(category.id),
    ).toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
           meals: filteredMeals,
           //onToggleFavourite: onToggleFavourite,
           ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Controlling Animation
    return AnimatedBuilder(animation: _animationController,
    child:GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            ),
        ],
      
    ),
    //  builder: (context,child)=>Padding(
    //   padding:EdgeInsets.only(
    //   top:100 - _animationController.value*100,),
    //   child: child),
    //  ) ;
    //Explicit Animation
    builder:(context,child)=> SlideTransition(position:Tween(
      //Tween create tween objects
        begin:const Offset(0, 0.3) ,
        end: const Offset(0, 0),
      ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)),
      child:child),
    );
  }
}
