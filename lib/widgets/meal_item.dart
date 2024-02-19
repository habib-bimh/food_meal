import 'package:flutter/material.dart';
import 'package:food_meals_app/models/meal.dart';
import 'package:food_meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});
  final Meal meal;
String get complexityText{
  return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
}
String get fordabilityText{
  return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
}

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: Colors.black45,
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MealItemTraid(icon:Icons.schedule, label: "${meal.duration} min"),
                     const  SizedBox(width:12),
                     MealItemTraid(icon:Icons.work, label:complexityText),
                     const SizedBox(width: 12,),
                     MealItemTraid(icon:Icons.attach_money,label: fordabilityText),
                        ],
                      )

                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
