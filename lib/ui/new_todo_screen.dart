import 'package:todoapp/component/category_card.dart';
import 'package:todoapp/component/todo_item.dart';
import 'package:todoapp/component/todo_progress.dart';
import 'package:todoapp/component/task_left_indicator.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:todoapp/model/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:todoapp/model/todo.dart';

class TodoListScreen extends StatefulWidget {
  List<Todo> listt;
  final ValueChanged<Todo> updateTodo;
  final ValueChanged<Todo> deleteTodo;
  TodoListScreen(
      {Key? key,
      required this.listt,
      required this.updateTodo,
      required this.deleteTodo})
      : super(key: key);
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  late SharedPreferences sharedPreferences2;
  List<Todo> currentList = [];
  var items = ['All', 'Work', 'Education', 'Health', 'Need', 'Hobby', 'Misc'];
  var _selectedCategory = "All";
  var _loadProgress = 0.4;

  int randomNumber = new Random().nextInt(10) + 1;
  int randomNumber2 = new Random().nextInt(11) + 10;

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
  final Color completeSec = Color(0xFF60D6B4);

  void _update(String sec) {
    setState(() => _selectedCategory = sec);
  }

  String getCurrentDate() {
    return DateFormat.yMMMMd('en_US').format(DateTime.now()).toString();
  }

  List<Todo> itemByCat(String cat, List<Todo> list) {
    if (cat == 'All') {
      return list;
    }
    var temp = list.where((element) => element.cat == cat).toList();
    return temp;
  }

  List<Todo> itemByDone(List<Todo> listt) {
    var temp = listt.where((element) => element.isComplete == true).toList();
    return temp;
  }

  int itemByDoneLength(String va) {
    var temp = itemByCat(va, widget.listt);
    var temp2 = itemByDone(temp);
    return temp2.length;
  }

  int getListLengthByCurrentCategory() {
    var temp = itemByCat(_selectedCategory, widget.listt);
    return temp.length;
  }

  int getListLengthByCategory(String cat) {
    var list = itemByCat(cat, widget.listt);
    return list.length;
  }

  @override
  Widget build(BuildContext context) {
    // var task = itemByCat(_selectedCategory, widget.listt);
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFFF),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text("Todo Lists",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                child: Text("${getCurrentDate()}",
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300)),
                              ),
                            ],
                          )),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/img1.jpg',
                          height: 200,
                          width: 200,
                          fit: BoxFit.fitWidth,
                        ),
                        Container(
                          height: 130,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Your tasks",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text("${itemByDone(widget.listt).length}",
                                      style: TextStyle(
                                          color: Color(0xFF60D6B4),
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold)),
                                  Text(" /${widget.listt.length}",
                                      style: TextStyle(
                                          color: Color(0xFFdbebe8),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300)),
                                ],
                              ),
                              Text("Get something done!")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Categories",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  height: 75,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: items.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                        child: CategoryCard(
                            title: '${items[index]}',
                            task: getListLengthByCategory(items[index]),
                            update: _update),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: TaskLeftInditaskCator(
                      taskCat: _selectedCategory,
                      taskLeft: itemByDoneLength(_selectedCategory),
                      taskTotal: getListLengthByCurrentCategory()),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child: TodoProgress(
                      taskDone: itemByDoneLength(_selectedCategory) == 0
                          ? 0
                          : itemByDoneLength(_selectedCategory).toDouble(),
                      taskTotal: getListLengthByCurrentCategory() == 0
                          ? 1.0
                          : getListLengthByCurrentCategory().toDouble(),
                      cat: _selectedCategory),
                ),
                TodoCardBuilder(itemByCat(_selectedCategory, widget.listt)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _editTodo(Todo item, bool isDone) {
    setState(() {
      item.isComplete = isDone;
      saveData();
    });
  }

  void saveData() {
    List<String> stringList =
        widget.listt.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences2.setStringList('todo', stringList);
  }

  Widget TodoCardBuilder(List<Todo> todo) {
    return todo.length == 0
        ? emptyList()
        : ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: todo.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Dismissible(
                    key: Key('${todo[index].hashCode}'),
                    background: Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text("Delete",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20))
                            ],
                          ),
                        ),
                        color: Colors.pink),
                    onDismissed: (direction) => widget.deleteTodo(todo[index]),
                    direction: DismissDirection.startToEnd,
                    child: TodoItemCard(todo[index])),
              );
            },
          );
  }

  Widget emptyList() {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/nothing.jpg',
            height: 200,
            width: 200,
            fit: BoxFit.fitWidth,
          ),
          Text('There is nothing to do',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey)),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget TodoItemCard(Todo todo) {
    var fontColor = (todo.isComplete
        ? Colors.white
        : todo.cat == "Work"
            ? colorWork
            : todo.cat == "Education"
                ? colorEdu
                : todo.cat == "Need"
                    ? colorNeed
                    : todo.cat == "Health"
                        ? colorHealth
                        : todo.cat == "Hobby"
                            ? colorHobby
                            : todo.cat == "Need"
                                ? colorNeed
                                : todo.cat == "Misc"
                                    ? colorMisc
                                    : colorAll);
    var boxColor = todo.isComplete
        ? completeSec
        : todo.cat == "Work"
            ? colorWorkSec
            : todo.cat == "Education"
                ? colorEduSec
                : todo.cat == "Need"
                    ? colorNeedSec
                    : todo.cat == "Health"
                        ? colorHealthSec
                        : todo.cat == "Hobby"
                            ? colorHobbySec
                            : todo.cat == "Need"
                                ? colorNeedSec
                                : todo.cat == "Misc"
                                    ? colorMiscSec
                                    : colorAllSec;
    return InkWell(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 70,
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 25, 0),
              child: Container(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        todo.isComplete
                            ? Icons.check_circle_outline_sharp
                            : Icons.query_builder,
                        size: 30,
                        color: fontColor,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            todo.title,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: fontColor),
                          ),
                          Text("Description Description",
                              style: TextStyle(color: fontColor))
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            todo.time,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: fontColor),
                          ),
                          Text(todo.date,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: fontColor))
                        ],
                      )
                    ],
                  ),
                ],
              )))),
      onTap: () {
        widget.updateTodo(todo);
        print(widget.listt[0].isComplete);
      },
    );
  }
}
