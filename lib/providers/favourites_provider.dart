import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';

 class favouriteMealNotifier extends  StateNotifier<List<Meal>>
 {
      favouriteMealNotifier():super([]);
      bool toggleMealFavoriteStatus(Meal meal)
      {
        final mealIsFavourite=state.contains(meal);
        if(mealIsFavourite)
        {
          state= state.where((m)=>m.id!=meal.id).toList();
          return false;
        }
        else
        {
          state=[...state,meal];
          return true;

        }

        
      }
 }

final favouriteMealProvider=StateNotifierProvider<favouriteMealNotifier,List<Meal>>((ref){
  return favouriteMealNotifier();
});