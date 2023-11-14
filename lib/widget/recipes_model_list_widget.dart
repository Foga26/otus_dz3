import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resources/app_color.dart';
import '../resources/main_navigation.dart';
import '../resources/resources.dart';

class Recipes {
  int id;
  final String imageName;
  final String recipeName;
  final String timer;
  Recipes({
    required this.id,
    required this.imageName,
    required this.recipeName,
    required this.timer,
  });
}

class RecipesModelListWidget extends StatefulWidget {
  const RecipesModelListWidget({super.key});

  @override
  State<RecipesModelListWidget> createState() => _RecipesModelListWidgetState();
}

class _RecipesModelListWidgetState extends State<RecipesModelListWidget> {
  final _recipes = [
    Recipes(
      id: 1,
      imageName: AppImages.salmon,
      recipeName: 'Лосось в соусе терияки',
      timer: '45 минут',
    ),
    Recipes(
        id: 2,
        imageName: AppImages.pokeboul1,
        recipeName: 'Поке боул с сыром тофу',
        timer: '30 минут'),
    Recipes(
        id: 3,
        imageName: AppImages.steakonBoard,
        recipeName: 'Стейк из говядины по-грузински с кукурузой',
        timer: '1 час 15 минут'),
    Recipes(
        id: 4,
        imageName: AppImages.bananaandBlueberryToast,
        recipeName: 'Тосты с голубикой и бананом',
        timer: '45 минут'),
    Recipes(
        id: 5,
        imageName: AppImages.pastawithseafood,
        recipeName: 'Паста с морепродуктами',
        timer: '25 минут'),
    Recipes(
        id: 6,
        imageName: AppImages.pastacarbonara,
        recipeName: 'Паста карбонара',
        timer: '30 минут'),
    Recipes(
        id: 7,
        imageName: AppImages.margaritapizzahomemade,
        recipeName: 'Пицца маргарита домашняя',
        timer: '40 минут'),
    Recipes(
        id: 8,
        imageName: AppImages.caesarsalad,
        recipeName: 'Салат цезарь',
        timer: '15 минут'),
  ];

  void _onRecipeTap(int index) {
    var id = _recipes[index].id;
    // if (id == 1) {
    //   Navigator.pushNamed(context, '/recipeInfo');
    // } else if (id == 2) {
    //   Navigator.pushNamed(context, '/recipeInfoPokeboul');
    // }
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.recipeInfoWidget,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backGroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 45),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) {
              return const Padding(padding: EdgeInsets.only(top: 24));
            },
            itemCount: _recipes.length,
            itemBuilder: (BuildContext context, int index) {
              {
                final recipes = _recipes[index];
                return Container(
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  width: 396,
                  height: 136,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        child: Image(
                          fit: BoxFit.fitHeight,
                          image: AssetImage(recipes.imageName),
                          width: 149,
                          height: 136,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 165, top: 30),
                        child: Flex(direction: Axis.vertical, children: [
                          Text(
                            recipes.recipeName,
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis),
                            maxLines: 2,
                          ),
                        ]),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 95, left: 165),
                        child: Icon(
                          Icons.watch_later_outlined,
                          size: 16,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 94, left: 192),
                        child: SizedBox(
                          height: 19,
                          child: Text(
                            recipes.timer,
                            style: const TextStyle(
                                color: ColorApp.textColorGreen, fontSize: 16),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () => _onRecipeTap(index),
                        ),
                      )
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
