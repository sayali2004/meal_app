import 'package:flutter/material.dart';
//import 'package:meal_app/screens/tabs.dart';
//import 'package:meal_app/widgets/main_drawer.dart';
import 'package:meal_app/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// enum Filter {
//    glutenfree,
//    lactosefree,
//    vegeterian,
//    vegan,
// }
class FilterScreen extends ConsumerWidget
{
  const FilterScreen({super.key,});

  
  
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activeFilters=ref.watch(filterProvider);
    return Scaffold(
       appBar: AppBar(
        title: const Text('Your Filter'),
       ),
      
       body: Column(
          children: [
            SwitchListTile(
              value: activeFilters[Filter.glutenfree]!, 
              onChanged: (isChecked){
                ref.read(filterProvider.notifier).setFilter(Filter.glutenfree,isChecked);
              },
              title: Text('Gluten-Free',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              ),
              subtitle: Text('Only includes Gluten-Free Meals',style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,),
              ),
              activeColor:Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34,right: 24,),
         
              ),
          SwitchListTile(
              value: activeFilters[Filter.lactosefree]!, 
              onChanged: (isChecked){
                ref.read(filterProvider.notifier).setFilter(Filter.lactosefree,isChecked);
              },
              title: Text('Lactose-Free',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              ),
              subtitle: Text('Only includes Lactose-Free Meals',style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,),
              ),
              activeColor:Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34,right: 24,),
         
              ),
              SwitchListTile(
              value: activeFilters[Filter.vegeterian]!, 
              onChanged: (isChecked){
                ref.read(filterProvider.notifier).setFilter(Filter.vegeterian,isChecked);
              },
              title: Text('Vegeterian',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              ),
              subtitle: Text('Only includes Vegeterian Meals',style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,),
              ),
              activeColor:Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34,right: 24,),
         
              ),
              SwitchListTile(
              value: activeFilters[Filter.vegan]!, 
              onChanged: (isChecked){
                ref.read(filterProvider.notifier).setFilter(Filter.vegan,isChecked);
              },
              title: Text('Vegan',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              ),
              subtitle: Text('Only includes Vegan Meals',style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,),
              ),
              activeColor:Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34,right: 24,),
         
              ),
         
          ],
         ),
       );
    
  }
}
