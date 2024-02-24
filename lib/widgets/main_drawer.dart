import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
              )
            ),
            child: Row(children: [
              Icon(Icons.fastfood,size:48,color: Theme.of(context).colorScheme.primary,),
              SizedBox(width: 18,),
              Text("Cooking up",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary
              ))
            ],),
            
          ),
        ListTile(
    leading: Icon(Icons.restaurant,
    size: 26,
    color: Theme.of(context).colorScheme.onBackground,
    ),
    title: Text("Meals",
    style: Theme.of(context).textTheme.titleSmall!.copyWith
    (color: Theme.of(context).colorScheme.onBackground),),
    onTap: (){},

  ),
   ListTile(
    leading: Icon(Icons.settings,
    size: 26,
    color: Theme.of(context).colorScheme.onBackground,
    ),
    title: Text("Filters",
    style: Theme.of(context).textTheme.titleSmall!.copyWith
    (color: Theme.of(context).colorScheme.onBackground),),
    onTap: (){},

  )
        ],
      ),
    );

  }
}

// Widget listTile (BuildContext context,String titels, Icon ico){
//   return ListTile(
//     leading: Icon(Icons.ico,
//     size: 26,
//     color: Theme.of(context).colorScheme.onBackground,
//     ),
//     title: Text("titels",
//     style: Theme.of(context).textTheme.titleSmall!.copyWith
//     (color: Theme.of(context).colorScheme.onBackground),),
//     onTap: (){},

//   );
// }