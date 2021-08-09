import 'package:flutter/material.dart';

class TaskLeftInditaskCator extends StatefulWidget {
  final String taskCat;
  final int taskLeft;
  final int taskTotal;
  TaskLeftInditaskCator(
      {Key? key,
      required this.taskLeft,
      required this.taskTotal,
      required this.taskCat})
      : super(key: key);

  @override
  _TaskLeftInditaskCatorState createState() => _TaskLeftInditaskCatorState();
}

class _TaskLeftInditaskCatorState extends State<TaskLeftInditaskCator> {
  final Color colorWork = Color(0xFF7D7D80);
  final Color colorAll = Color(0xFF35809E);
  final Color colorNeed = Color(0xFFB8BB03);
  final Color colorHobby = Color(0xFF16C551);
  final Color colorHealth = Color(0xFF60D6B4);
  final Color colorMisc = Color(0xFFBD47A9);
  final Color colorEdu = Color(0xFFB14444);
  @override
  Widget build(BuildContext context) {
    Color colorLoad = (widget.taskCat == "Work"
        ? colorWork
        : widget.taskCat == "Education"
            ? colorEdu
            : widget.taskCat == "Need"
                ? colorNeed
                : widget.taskCat == "Health"
                    ? colorHealth
                    : widget.taskCat == "Hobby"
                        ? colorHobby
                        : widget.taskCat == "Need"
                            ? colorNeed
                            : widget.taskCat == "Misc"
                                ? colorMisc
                                : colorAll);
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SizeTransition(child: child, sizeFactor: animation);
            },
            child: Text(widget.taskCat,
                key: ValueKey<String>(
                  widget.taskCat,
                ),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SizeTransition(child: child, sizeFactor: animation);
                },
                child: Text(widget.taskLeft.toString(),
                    key: ValueKey<Color>(colorHobby),
                    style: TextStyle(
                        color: colorLoad,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
              ),
              Text("/${widget.taskTotal.toString()}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500))
            ],
          ),
        ],
      ),
    );
  }
}
