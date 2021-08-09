// import 'package:flutter/material.dart';
// import 'package:todoapp/model/todo.dart';

// class TodoItem extends StatefulWidget {
//   Todo todo;
//   VoidCallback update;
//   TodoItem({Key? key, required this.todo, required this.update})
//       : super(key: key);
//   @override
//   _TodoItemState createState() => _TodoItemState();
// }

// class _TodoItemState extends State<TodoItem> {
//   final Color colorWork = Color(0xFF7D7D80);
//   final Color colorAll = Color(0xFF35809E);
//   final Color colorNeed = Color(0xFFB8BB03);
//   final Color colorHobby = Color(0xFF16C551);
//   final Color colorHealth = Color(0xFF60D6B4);
//   final Color colorMisc = Color(0xFFBD47A9);
//   final Color colorEdu = Color(0xFFB14444);

//   final Color colorWorkSec = Color(0x1A7D7D80);
//   final Color colorAllSec = Color(0x1A35809E);
//   final Color colorNeedSec = Color(0x1AB8BB03);
//   final Color colorHobbySec = Color(0x1A16C551);
//   final Color colorHealthSec = Color(0x1A60D6B4);
//   final Color colorMiscSec = Color(0x1ABD47A9);
//   final Color colorEduSec = Color(0x1AB14444);
//   final Color completeSec = Color(0xFF60D6B4);

//   @override
//   Widget build(BuildContext context) {
//     var fontColor = (widget.todo.isComplete
//         ? Colors.white
//         : widget.todo.cat == "Work"
//             ? colorWork
//             : widget.todo.cat == "Education"
//                 ? colorEdu
//                 : widget.todo.cat == "Need"
//                     ? colorNeed
//                     : widget.todo.cat == "Health"
//                         ? colorHealth
//                         : widget.todo.cat == "Hobby"
//                             ? colorHobby
//                             : widget.todo.cat == "Need"
//                                 ? colorNeed
//                                 : widget.todo.cat == "Misc"
//                                     ? colorMisc
//                                     : colorAll);
//     var boxColor = (widget.todo.isComplete
//         ? completeSec
//         : widget.todo.cat == "Work"
//             ? colorWorkSec
//             : widget.todo.cat == "Education"
//                 ? colorEduSec
//                 : widget.todo.cat == "Need"
//                     ? colorNeedSec
//                     : widget.todo.cat == "Health"
//                         ? colorHealthSec
//                         : widget.todo.cat == "Hobby"
//                             ? colorHobbySec
//                             : widget.todo.cat == "Need"
//                                 ? colorNeedSec
//                                 : widget.todo.cat == "Misc"
//                                     ? colorMiscSec
//                                     : colorAllSec);
//     return InkWell(
//       child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: 70,
//           decoration: BoxDecoration(
//             color: boxColor,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Padding(
//               padding: EdgeInsets.fromLTRB(20, 0, 25, 0),
//               child: Container(
//                   child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Icon(
//                         widget.todo.isComplete
//                             ? Icons.check_circle_outline_sharp
//                             : Icons.query_builder,
//                         size: 30,
//                         color: fontColor,
//                       ),
//                       SizedBox(
//                         width: 15,
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             widget.todo.title,
//                             style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w500,
//                                 color: fontColor),
//                           ),
//                           Text("Description Description",
//                               style: TextStyle(color: fontColor))
//                         ],
//                       )
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Text(
//                             widget.todo.time,
//                             style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w400,
//                                 color: fontColor),
//                           ),
//                           Text(widget.todo.date,
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w400,
//                                   color: fontColor))
//                         ],
//                       )
//                     ],
//                   ),
//                 ],
//               )))),
//       onTap: () {
//         setState(() {
//           widget.todo.isComplete = !widget.todo.isComplete;
//           widget.update();
//         });
//       },
//     );
//   }
// }
