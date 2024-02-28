import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function (String identifier) onSelectScreen;

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
       listTile(context: context, icon: Icons.restaurant, title: "Meals", ),
       listTile(context: context, icon: Icons.settings, title: "Filters"),
        ],
      ),
    );

  }
 
Widget listTile({
  required BuildContext context,
  required IconData icon,
  required String title,
  //required String subject,
}) {
  return ListTile(
    leading: Icon(
      icon,
      size: 26,
      color: Theme.of(context).colorScheme.onBackground,
    ),
    title: Text(
      title,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
    ),
    onTap: () {
      onSelectScreen(title);
    },
  );
}
}