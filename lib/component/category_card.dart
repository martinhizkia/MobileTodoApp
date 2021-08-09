import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  final String title;
  final int task;
  final ValueChanged<String> update;

  CategoryCard(
      {Key? key, required this.title, required this.task, required this.update})
      : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  final Color colorWork = Color(0xFF7D7D80);
  final Color colorAll = Color(0xFF35809E);
  final Color colorNeed = Color(0xFFB8BB03);
  final Color colorHobby = Color(0xFF16C551);
  final Color colorHealth = Color(0xFF60D6B4);
  final Color colorMisc = Color(0xFFBD47A9);
  final Color colorEdu = Color(0xFFB14444);

  final Color colorWorkSec = Color(0x1A7D7D80);
  final Color colorAllSec = Color(0x1A35809E);
  final Color colorNeedSec = Color(0x1AB8BB03);
  final Color colorHobbySec = Color(0x1A16C551);
  final Color colorHealthSec = Color(0x1A60D6B4);
  final Color colorMiscSec = Color(0x1ABD47A9);
  final Color colorEduSec = Color(0x1AB14444);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Container(
          alignment: Alignment.center,
          height: 75,
          width: 200,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 15, 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Stack(alignment: AlignmentDirectional.center, children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: widget.title == "Work"
                        ? colorWork
                        : widget.title == "Education"
                            ? colorEdu
                            : widget.title == "Need"
                                ? colorNeed
                                : widget.title == "Health"
                                    ? colorHealth
                                    : widget.title == "Hobby"
                                        ? colorHobby
                                        : widget.title == "Need"
                                            ? colorNeed
                                            : widget.title == "Misc"
                                                ? colorMisc
                                                : colorAll,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                Icon(
                  widget.title == "Work" ? Icons.work : Icons.list,
                  size: 28,
                  color: Colors.white,
                ),
              ]),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                        style: TextStyle(
                            color: widget.title == "Work"
                                ? colorWork
                                : widget.title == "Education"
                                    ? colorEdu
                                    : widget.title == "Need"
                                        ? colorNeed
                                        : widget.title == "Health"
                                            ? colorHealth
                                            : widget.title == "Hobby"
                                                ? colorHobby
                                                : widget.title == "Need"
                                                    ? colorNeed
                                                    : widget.title == "Misc"
                                                        ? colorMisc
                                                        : colorAll,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Text(
                        widget.task <= 1
                            ? "${widget.task} task"
                            : "${widget.task} tasks",
                        style: TextStyle(
                            color: widget.title == "Work"
                                ? colorWork
                                : widget.title == "Education"
                                    ? colorEdu
                                    : widget.title == "Need"
                                        ? colorNeed
                                        : widget.title == "Health"
                                            ? colorHealth
                                            : widget.title == "Hobby"
                                                ? colorHobby
                                                : widget.title == "Need"
                                                    ? colorNeed
                                                    : widget.title == "Misc"
                                                        ? colorMisc
                                                        : colorAll,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ]),
          ),
          decoration: BoxDecoration(
            color: widget.title == "Work"
                ? colorWorkSec
                : widget.title == "Education"
                    ? colorEduSec
                    : widget.title == "Need"
                        ? colorNeedSec
                        : widget.title == "Health"
                            ? colorHealthSec
                            : widget.title == "Hobby"
                                ? colorHobbySec
                                : widget.title == "Need"
                                    ? colorNeedSec
                                    : widget.title == "Misc"
                                        ? colorMiscSec
                                        : colorAllSec,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onTap: () {
          widget.update(widget.title);
        },
      ),
    );
  }
}
