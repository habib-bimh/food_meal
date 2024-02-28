import 'package:flutter/material.dart';
import 'package:food_meals_app/screens/filters.dart';
// import 'package:food_meals_app/screens/tabs.dart';
// import 'package:food_meals_app/widgets/main_drawer.dart';

enum Filter{
  gluteFree,
  lactoseFree,
  vegetarian,
  vegan
}

class FistersScreen extends StatefulWidget {
  const FistersScreen({super.key});

  @override
  State<FistersScreen> createState() => _FistersScreenState();
}

class _FistersScreenState extends State<FistersScreen> {
  var  _gluteFreeFilterSet = false;
  var _lactoseFreeFilterSet = true;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Your Filters"),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier){
      //   Navigator.of(context).pop();
      //   if(identifier == "Meals"){
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const TabScreen()));
      //   }
      // }),
      body: WillPopScope(
        onWillPop: ()async{
         Navigator.of(context).pop(
          {
          Filter.gluteFree: _gluteFreeFilterSet,
          Filter.lactoseFree: _lactoseFreeFilterSet,
          Filter.vegetarian:_vegetarianFilterSet,
          Filter.vegan:_veganFilterSet,
          }
         );
         return false;
        },
        child: Column(children: [
              SwitchListTile(
        value: _gluteFreeFilterSet,
        onChanged: (isChecked) {
          setState(() {
            _gluteFreeFilterSet = isChecked;
          });
        },
        title: Text(
          "Glute_Free",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        subtitle: Text(
          "Only include glute_free meals",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        activeColor: Theme.of(context).colorScheme.tertiary,
        contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
           SwitchListTile(
        value: _lactoseFreeFilterSet,
        onChanged: (isChecked) {
          setState(() {
           _lactoseFreeFilterSet = isChecked;
          });
        },
        title: Text(
          "Lactose-Free",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        subtitle: Text(
          "Only include lactose-free meals",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        activeColor: Theme.of(context).colorScheme.tertiary,
        contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
           SwitchListTile(
        value: _vegetarianFilterSet,
        onChanged: (isChecked) {
          setState(() {
           _vegetarianFilterSet= isChecked;
          });
        },
        title: Text(
          "Vegetarian",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        subtitle: Text(
          "Only include vegetarian meals",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        activeColor: Theme.of(context).colorScheme.tertiary,
        contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
           SwitchListTile(
        value: _veganFilterSet,
        onChanged: (isChecked) {
          setState(() {
           _veganFilterSet= isChecked;
          });
        },
        title: Text(
          "Vegan",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        subtitle: Text(
          "Only include vegan meals",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        activeColor: Theme.of(context).colorScheme.tertiary,
        contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
      
      
          // switchListTile(
          //     titlename: "Glute_Free",
          //     subtitlename: "Only include glute_free meals",
          //     values: _gluteFreeFilterSet),
      
          //     switchListTile(
          //     titlename: "Lactose-Free",
          //     subtitlename: "Only include lactose-free meals",
          //     values: _lactoseFreeFilterSet),
      
          //     switchListTile(
          //     titlename: "Vegetarian",
          //     subtitlename: "Only include vegetarian meals",
          //     values: _vegetarianFilterSet),
      
          //     switchListTile(
          //     titlename: "Vegan",
          //     subtitlename: "Only include vegetarian meals",
          //     values: _veganFilterSet)
        ]),
      ),
    );
  }

  Widget switchListTile({
    required String titlename,
    required String subtitlename,
    required  var  values,
  }) {
    return SwitchListTile(
      value: values,
      onChanged: (isChecked) {
        setState(() {
          values = isChecked;
        });
      },
      title: Text(
        titlename,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        subtitlename,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
