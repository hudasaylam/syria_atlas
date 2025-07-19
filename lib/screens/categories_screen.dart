import 'package:flutter/material.dart';
import '../app_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  //the main page of  the app
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(5),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio:
            8 / 10, //the height and width for each elememt by precent

        mainAxisSpacing: 10, //horizontal spaces between elemnts
        crossAxisSpacing: 10, //vertical spaces between elemnts
      ), //set elemnts according to screen width and the px we put
      children:
          Category_data.map(
            (categoryData) => CategoryItem(
              id: categoryData.id,
              title: categoryData.title,
              imageUrl: categoryData.imageUrl,
            ),
          ).toList(),
    );
  }
}
