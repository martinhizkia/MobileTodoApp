import 'package:flutter/material.dart';

class TodoProgress extends StatefulWidget {
  final double taskTotal;
  final double taskDone;
  final String cat;
  TodoProgress(
      {Key? key,
      required this.taskTotal,
      required this.taskDone,
      required this.cat})
      : super(key: key);

  @override
  _TodoProgressState createState() => _TodoProgressState();
}

class _TodoProgressState extends State<TodoProgress> {
  final Color colorWork = Color(0xFF7D7D80);
  final Color colorAll = Color(0xFF35809E);
  final Color colorNeed = Color(0xFFB8BB03);
  final Color colorHobby = Color(0xFF16C551);
  final Color colorHealth = Color(0xFF60D6B4);
  final Color colorMisc = Color(0xFFBD47A9);
  final Color colorEdu = Color(0xFFB14444);

  @override
  Widget build(BuildContext context) {
    Color colorLoad = (widget.cat == "Work"
        ? colorWork
        : widget.cat == "Education"
            ? colorEdu
            : widget.cat == "Need"
                ? colorNeed
                : widget.cat == "Health"
                    ? colorHealth
                    : widget.cat == "Hobby"
                        ? colorHobby
                        : widget.cat == "Need"
                            ? colorNeed
                            : widget.cat == "Misc"
                                ? colorMisc
                                : colorAll);
    return Container(
      child: Container(
        child: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: 10,
                decoration: BoxDecoration(
                  color: Color(0x4dBCC1DB),
                  borderRadius: BorderRadius.circular(10),
                )),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: child,
                );
              },
              child: Container(
                  width: MediaQuery.of(context).size.width *
                      (widget.taskDone / widget.taskTotal),
                  key: ValueKey<Color>(colorLoad),
                  height: 10,
                  decoration: BoxDecoration(
                    color: colorLoad,
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
