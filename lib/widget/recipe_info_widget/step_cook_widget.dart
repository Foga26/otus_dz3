import 'package:dz_2/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../changenotif.dart';

class StepCookWidget extends StatefulWidget {
  final String stepNumber;
  final String stepContain;
  final String timerStep;

  const StepCookWidget({
    Key? key,
    required this.stepNumber,
    required this.stepContain,
    required this.timerStep,
  }) : super(key: key);

  @override
  State<StepCookWidget> createState() => _StepCookWidgetState();
}

class _StepCookWidgetState extends State<StepCookWidget> {
  bool readyChekbox = false;

  @override
  Widget build(BuildContext context) {
    bool ready = Provider.of<Test>(context).kok;

    return ChangeNotifierProvider(
        create: (BuildContext context) {
          Test();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 14),
          child: SizedBox(
            width: 398,
            height: 120,
            child: Card(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ready
                      ? const Color.fromARGB(85, 46, 204, 112)
                      : const Color(0xffECECEC),
                ),
                child: Center(
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text(
                        widget.stepNumber,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 40,
                          color: ready
                              ? const Color(0xff2ECC71)
                              : const Color(0xffC2C2C2),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 38),
                      child: SizedBox(
                        width: 220,
                        height: 88,
                        child: Center(
                          child: Text(
                            widget.stepContain,
                            style: TextStyle(
                              color: ready
                                  ? ColorApp.textStyleDarkGreen
                                  : ColorApp.colorGrey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 33, left: 3),
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Checkbox(
                                tristate: false,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                side: BorderSide(
                                    width: 4,
                                    color: ready
                                        ? ColorApp.textColorDarkGreen
                                        : ColorApp.colorGrey),
                                value: readyChekbox,
                                onChanged: ready
                                    ? (value) {
                                        setState(() {
                                          readyChekbox = !readyChekbox;
                                        });
                                      }
                                    : null),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, top: 10),
                          child: Text(
                            widget.timerStep,
                            style: TextStyle(
                                fontSize: 13,
                                color: ready
                                    ? ColorApp.textColorDarkGreen
                                    : ColorApp.colorGrey),
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
              ),
            ),
          ),
        ));

    // Card(
    //   color: Colors.green,
    //   child: Column(children: [
    //     ListTile(
    //       isThreeLine: true,
    //       trailing: Text(
    //         widget.timerStep,
    //       ),
    //       leading: Text(widget.stepContain),
    //       title: Text(widget.stepNumber),
    //       subtitle: Text(widget.timerStep),
    //     ),
    //     ListTile(
    //       isThreeLine: true,
    //       trailing: Text(widget.timerStep),
    //       leading: Text(widget.stepContain),
    //       title: Text(widget.stepNumber),
    //       subtitle: Text(widget.timerStep),
    //     ),
    //     Row(),
    //   ]),
    // );
  }
}
