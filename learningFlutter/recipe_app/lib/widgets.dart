import 'favorite_recipes.dart';
import 'main.dart';
import 'package:recipe_app/main.dart';

import 'package:flutter/material.dart';

// Widget showRecipeOptions(i) {
//   return Column(
//     children: <Widget>[
//       Expanded(
//         flex: 3,
//         child: Padding(
//           padding: const EdgeInsets.all(0.0),
//           child: Container(
//             width: 160,
//             height: 160,
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     fit: BoxFit.contain,
//                     alignment: Alignment.center,
//                     image: AssetImage(i.image)),
//                 borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                 color: Colors.grey.shade200),
//           ),
//         ),
//       ),
//       Expanded(
//         flex: 2,
//         child: Padding(
//             padding: const EdgeInsets.fromLTRB(10, 0, 0, 15),
//             child: textColumn(i)),
//       )
//     ],
//   );
// }

// Widget textColumn(i) {
//   return ;
// }

Widget drawer(context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Text(
            'Pages navigation',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.pages),
          title: Text('List of recipes'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.pages),
          title: Text('Favorite recipes'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => RecipeShow()));
          },
        ),
      ],
    ),
  );
}

// Widget favoriteRecipes(i, color) {
//   return ;
// }
