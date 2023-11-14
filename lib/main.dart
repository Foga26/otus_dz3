import 'package:dz_2/resources/main_navigation.dart';

import 'package:dz_2/widget/changenotif.dart';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Test())],
      child: MaterialApp(
        routes: mainNavigation.routes,
        initialRoute: MainNavigationRouteNames.mainPage,

        onGenerateRoute: mainNavigation.onGenerateRoute,
        // {
        //   '/main': (context) => const MainScreenwidget(),
        //   '/recipes': (context) => const RecipesModelListWidget(),
        //   '/recipeInfo': (context) => const SalmonInfoRecipeWidget(),
        //   // '/recipeInfoPokeboul': (context) => const PokeboulInfoWidget(),
        //   '/auth': (context) => const AuthWidget(),
        // }
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool isFavorite = false;

//   void toggleFavorite() {
//     setState(() {
//       isFavorite = !isFavorite;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Переключение Избранного'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               IconButton(
//                 icon: Icon(
//                   isFavorite ? Icons.favorite : Icons.favorite_border,
//                   color: Colors.red,
//                 ),
//                 onPressed: toggleFavorite,
//                 iconSize: 50.0,
//               ),
//               Text(
//                 isFavorite ? 'Добавлено в Избранное' : 'Удалено из Избранного',
//                 style: TextStyle(fontSize: 20),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
