import 'package:dz_2/resources/app_color.dart';
import 'package:dz_2/resources/custumicon.dart';

import 'package:dz_2/resources/resources.dart';
import 'package:dz_2/widget/recipe_info_widget/step_cook_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../changenotif.dart';
import '../comment_widget.dart';

class SalmonInfoRecipeWidget extends StatefulWidget {
  const SalmonInfoRecipeWidget({super.key});

  @override
  State<SalmonInfoRecipeWidget> createState() => _SalmonInfoRecipeWidgetState();
}

class _SalmonInfoRecipeWidgetState extends State<SalmonInfoRecipeWidget> {
  bool isFavorite = false;
  bool ingridientsHave = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void toggleIngridients() {
    setState(() {
      ingridientsHave = true;
    });
  }

  // void toggleGoCook() {
  //   setState(() {
  //     goCook = !goCook;
  //   });
  // }

  var stepcook = [
    const StepCookWidget(
      stepNumber: '1',
      stepContain:
          'В маленькой кастрюле соедините соевый соус, 6 столовых ложек воды, мёд, сахар, измельчённый чеснок, имбирь и лимонный сок.',
      timerStep: '06:00',
    ),
    const StepCookWidget(
      stepNumber: '2',
      stepContain:
          'Поставьте на средний огонь и, помешивая, доведите до лёгкого кипения.',
      timerStep: '07:00',
    ),
    const StepCookWidget(
      stepNumber: '3',
      stepContain:
          'Смешайте оставшуюся воду с крахмалом. Добавьте в кастрюлю и перемешайте.',
      timerStep: '06:00',
    ),
    const StepCookWidget(
      stepNumber: '4',
      stepContain:
          'Готовьте, непрерывно помешивая венчиком , 1 минуту. Снимите с огня и немного остудите.',
      timerStep: '01:00',
    ),
    const StepCookWidget(
      stepNumber: '5',
      stepContain:
          'Смажьте форму маслом и выложите туда рыбу. Полейте ее соусом.',
      timerStep: '06:00',
    ),
    const StepCookWidget(
      stepNumber: '6',
      stepContain:
          'Поставьте на разогретую до 200 °С духовку примерно на 15 минут.',
      timerStep: '15:00',
    ),
    const StepCookWidget(
      stepNumber: '7',
      stepContain: 'Перед подачей полейте соусом из формы и посыпьте кунжутом.',
      timerStep: '04:00',
    )
  ];

  final ingridients = const Text(
    '• Соевый соус\n• Вода\n• Мёд\n• Коричневый сахар\n• Чеснок\n• Тертый свежий имбиоь\n• Лимонный сок\n• Кукурузный крахмал\n• Растительное масло\n• Филе лосося или сёмги\n• Кунжут',
    style: TextStyle(
      height: 1.9,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  );

  final properties = const Text(
    '8 ст.ложек\n8 ст.ложек\n3 ст.ложки\n2 ст.ложки\n3 зубчика\n1 ст. ложка\n1½ ст.ложки\n1 ст.ложка\n1 ч.ложка\n680 г\nпо вкусу',
    style: TextStyle(
        height: 2.1,
        color: Colors.grey,
        fontSize: 13,
        fontWeight: FontWeight.w400),
  );

  final imageRecipe = const ClipRRect(
    borderRadius: BorderRadius.all(
      Radius.circular(5),
    ),
    child: Image(
      image: AssetImage(AppImages.salmon),
    ),
  );

  final iconTimer = const Icon(
    Icons.watch_later_outlined,
    size: 16.32,
  );

  final titleRecipe = const Text(
    'Лосось в соусе терияки',
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  );

  final timer = const Text('45 минут',
      style: TextStyle(color: ColorApp.textColorGreen, fontSize: 16));

  @override
  Widget build(BuildContext context) {
    var step = stepcook;
    var goCook = Test().gokok;

    return ChangeNotifierProvider(
      create: (BuildContext context) {
        Test();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          toolbarHeight: 60,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(CustomIcons.megafone),
            ),
          ],
          title: const Text(
            'Рецепт',
            style: TextStyle(color: ColorApp.textColorDarkGreen),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: CustomScrollView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                (SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 17),
                        child: Row(
                          children: [
                            titleRecipe,
                            Padding(
                              padding: const EdgeInsets.only(left: 100),
                              child: IconButton(
                                icon: Icon(
                                  isFavorite ? Icons.favorite : Icons.favorite,
                                  color: isFavorite ? Colors.red : Colors.black,
                                ),
                                onPressed: toggleFavorite,
                                iconSize: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.43, left: 17),
                            child: iconTimer,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.41, left: 10),
                            child: timer,
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 15, right: 15),
                        child: imageRecipe,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, left: 16),
                        child: Text('Ингредиенты',
                            style: TextStyle(
                                color: ColorApp.textColorDarkGreen,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 25, right: 25),
                        child: Container(
                          width: 395,
                          height: 330,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 3,
                                color: ingridientsHave
                                    ? ColorApp.textColorGreen
                                    : ColorApp.colorGrey,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              shape: BoxShape.rectangle,
                              color: Colors.transparent),
                          child: SizedBox(
                            width: 379,
                            height: 297,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 13,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        ingridients,
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 62.68),
                                      child: Column(
                                        children: [properties],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: Center(
                          child: SizedBox(
                            width: 232,
                            height: 48,
                            child: TextButton(
                                style: ButtonStyle(
                                  side: const MaterialStatePropertyAll(
                                      BorderSide(
                                          color: ColorApp.textColorDarkGreen,
                                          width: 3)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.white,
                                  ),
                                ),
                                onPressed: toggleIngridients,
                                child: const Text(
                                  'Проверить наличие',
                                  style: TextStyle(
                                      color: ColorApp.textColorDarkGreen),
                                )),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, left: 15),
                        child: Text('Шаги приготовления',
                            style: TextStyle(
                                color: ColorApp.textColorDarkGreen,
                                fontWeight: FontWeight.w500,
                                fontSize: 16)),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: step,
                          )),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: SizedBox(
                            width: 232,
                            height: 48,
                            child: TextButton(
                                onPressed: Provider.of<Test>(context).gokok,
                                style: Provider.of<Test>(context).kok
                                    ? ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          side: const BorderSide(
                                              width: 4,
                                              color:
                                                  ColorApp.textColorDarkGreen),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        )),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Colors.white,
                                        ))
                                    : ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        )),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          const Color(0xff165932),
                                        ),
                                      ),
                                child: Provider.of<Test>(context).kok
                                    ? const Text('Закончить готовить',
                                        style: TextStyle(
                                            color: ColorApp.textColorDarkGreen))
                                    : const Text('Начать готовить',
                                        style: TextStyle(color: Colors.white))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 35,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: ColorApp.colorGrey,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 25,
                        ),
                        child: CommentScreen(),
                      )
                    ],
                  ),
                ))
              ]))
            ]),
      ),
    );
  }
}
