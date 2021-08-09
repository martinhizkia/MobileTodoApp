import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/model/checklist.dart';
import 'package:todoapp/model/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/ui/new_checklist_screen.dart';
import 'package:todoapp/ui/new_todo_screen.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:todoapp/model/todo.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> list = <Todo>[];
  late SharedPreferences sharedPreferences2;
  List<Checklist> list_checklist = <Checklist>[];
  late SharedPreferences sharedPreferences;
  var _textTitleController = TextEditingController();
  var _textDescController = TextEditingController();
  int _currentIndex = 0;

  var _currencies = [
    "All",
    "Work",
    "Education",
    "Health",
    "Need",
    "Hobby",
    "Misc"
  ];
  var time = "Time";
  var date = "Date";
  var _currentSelectedValue = "All";
  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  void addChecklist(Checklist item) {
    list_checklist.insert(0, item);
    saveDataChecklist();
  }

  void editChecklist(Checklist item, String newName) {
    item.item = newName;
    saveDataChecklist();
  }

  void loadDataChecklist() {
    List<String>? listString =
        sharedPreferences.getStringList('checklist_list');
    if (listString != null) {
      list_checklist = listString
          .map((item) => Checklist.fromMap(json.decode(item)))
          .toList();
      setState(() {});
    }
  }

  void saveDataChecklist() {
    List<String> stringList =
        list_checklist.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences.setStringList('checklist_list', stringList);
  }

  void _saveDataState(Todo todo) {
    setState(() {
      addTodo(todo);
      saveData();
    });
  }

  void loadSharedPreferencesAndData() async {
    sharedPreferences2 = await SharedPreferences.getInstance();
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
  }

  @override
  void initState() {
    loadSharedPreferencesAndData();
    super.initState();
  }

  void addTodo(Todo item) {
    list.insert(0, item);
    saveData();
  }

  List<Todo> itemByCategory(String cat, List<Todo> list) {
    var temp = list.where((element) => element.cat == cat).toList();
    return temp;
  }

  void editTodo(Todo item, String title) {
    item.title = title;
    saveData();
  }

  void toggleItem(Todo item) {
    setState(() {
      item.isComplete = !item.isComplete;
      saveData();
    });
  }

  void toggleChecklist(Checklist item) {
    setState(() {
      item.isComplete = !item.isComplete;
      saveDataChecklist();
    });
  }

  void saveData() {
    List<String> stringList =
        list.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences2.setStringList('todo', stringList);
  }

  void removeTodo(Todo item) {
    setState(() {
      list.remove(item);
    });
    saveData();
  }

  void removeChecklist(Checklist item) {
    setState(() {
      list_checklist.remove(item);
    });
    saveDataChecklist();
  }

  void loadData() {
    List<String>? listString = sharedPreferences2.getStringList('todo');
    if (listString != null) {
      list = listString.map((item) => Todo.fromMap(json.decode(item))).toList();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0
          ? TodoListScreen(
              listt: list, updateTodo: toggleItem, deleteTodo: removeTodo)
          : ChecklistScreen(
              listt: list_checklist,
              updateChecklist: toggleChecklist,
              deleteChecklist: removeChecklist),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF60D6B4),
          elevation: 3,
          child: const Icon(Icons.add),
          onPressed: () {
            _currentIndex == 0
                ? showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    builder: (context) {
                      return StatefulBuilder(
                          builder: (BuildContext context, StateSetter myState) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: Text(
                                    "Add to do",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                // Container(
                                //   alignment: Alignment.centerLeft,
                                //   child: Text(
                                //     "Title",
                                //     style: TextStyle(
                                //         fontSize: 18, fontWeight: FontWeight.w600),
                                //   ),
                                // )
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 15),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextFormField(
                                          controller: _textTitleController,
                                          cursorColor: Color(0xFF60D6B4),
                                          maxLength: 20,
                                          decoration: InputDecoration(
                                            // icon: Icon(Icons.favorite),
                                            labelText: 'Title',

                                            suffixIcon: Icon(
                                              Icons.check_circle,
                                            ),

                                            disabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFF60D6B4)),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 15),
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextFormField(
                                            controller: _textDescController,
                                            cursorColor: Color(0xFF60D6B4),
                                            maxLength: 20,
                                            decoration: InputDecoration(
                                              // icon: Icon(Icons.favorite),
                                              labelText: 'Title',

                                              suffixIcon: Icon(
                                                Icons.check_circle,
                                              ),

                                              disabledBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFF60D6B4)),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 15),
                                    child: FormField<String>(
                                      builder: (FormFieldState<String> state) {
                                        return InputDecorator(
                                          decoration: InputDecoration(
                                            labelText: 'Label text',
                                            disabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFF60D6B4)),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            border: OutlineInputBorder(),
                                            errorStyle: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 16.0),
                                            hintText: 'Category',
                                          ),
                                          isEmpty: _currentSelectedValue == '',
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: _currentSelectedValue,
                                              isDense: true,
                                              onChanged: (var newValue) {
                                                setState(() {
                                                  _currentSelectedValue =
                                                      newValue!;
                                                  state.didChange(newValue);
                                                });
                                              },
                                              items: _currencies
                                                  .map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        );
                                      },
                                    )),

                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: InkWell(
                                                  child: IgnorePointer(
                                                      child: Container(
                                                    height: 50,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(Icons
                                                              .watch_later_outlined),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(time,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      15)),
                                                        ],
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3),
                                                        border: Border.all(
                                                            color:
                                                                Colors.grey)),
                                                  )),
                                                  onTap: () {
                                                    showTimePicker(
                                                            context: context,
                                                            initialTime:
                                                                TimeOfDay.now())
                                                        .then((selectedTime) =>
                                                            myState(() {
                                                              final now =
                                                                  new DateTime
                                                                      .now();
                                                              var dt = DateTime(
                                                                  now.year,
                                                                  now.month,
                                                                  now.day,
                                                                  selectedTime!
                                                                      .hour,
                                                                  selectedTime
                                                                      .minute);
                                                              var temp =
                                                                  DateFormat
                                                                          .jm()
                                                                      .format(
                                                                          dt);
                                                              time = temp
                                                                  .toString();
                                                            }));
                                                  }),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: InkWell(
                                                  child: IgnorePointer(
                                                      child: Container(
                                                    height: 50,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(Icons
                                                              .calendar_today),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(date,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      15)),
                                                        ],
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3),
                                                        border: Border.all(
                                                            color:
                                                                Colors.grey)),
                                                  )),
                                                  onTap: () {
                                                    myState(() {
                                                      showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime(2019, 1),
                                                        lastDate:
                                                            DateTime(2021, 12),
                                                      ).then((pickedDate) {
                                                        myState(() {
                                                          date = DateFormat(
                                                                  'EEE, MMM d '
                                                                  'yyyy')
                                                              .format(
                                                                  pickedDate!)
                                                              .toString();
                                                        });
                                                      });
                                                    });
                                                  }),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF60D6B4),
                                      minimumSize: Size(double.infinity,
                                          50), // double.infinity is the width and 30 is the height
                                    ),
                                    onPressed: () {
                                      var todo = Todo(
                                          title: "",
                                          desc: "",
                                          cat: "",
                                          date: "",
                                          time: "");
                                      todo.title = _textTitleController.text;
                                      todo.desc = _textDescController.text;
                                      todo.cat = _currentSelectedValue;
                                      todo.date = date;
                                      todo.time = time;
                                      if (todo.title == "" || todo.desc == "") {
                                        Fluttertoast.showToast(
                                          msg: "This is Toast messaget",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                        );
                                      } else {
                                        setState(() {
                                          addTodo(todo);
                                          Navigator.pop(context);
                                        });
                                      }
                                    },
                                    child: Text("Add"),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                    },
                  )
                : showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    builder: (context) {
                      return StatefulBuilder(
                          builder: (BuildContext context, StateSetter myState) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: Text(
                                    "Add to do",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 15),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextFormField(
                                          controller: _textTitleController,
                                          cursorColor: Color(0xFF60D6B4),
                                          maxLength: 20,
                                          decoration: InputDecoration(
                                            // icon: Icon(Icons.favorite),
                                            labelText: 'Item',

                                            suffixIcon: Icon(
                                              Icons.check_circle,
                                            ),

                                            disabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFF60D6B4)),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF60D6B4),
                                      minimumSize: Size(double.infinity,
                                          50), // double.infinity is the width and 30 is the height
                                    ),
                                    onPressed: () {
                                      var temp = Checklist(item: "");
                                      temp.item = _textTitleController.text;
                                      if (temp.item == "") {
                                        Fluttertoast.showToast(
                                          msg: "Fill the Checklist First!",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                        );
                                      } else {
                                        setState(() {
                                          addChecklist(temp);
                                          Navigator.pop(context);
                                          _textTitleController.text = "";
                                        });
                                      }
                                    },
                                    child: Text("Add Checklist"),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                    },
                  );
          }),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFFFFFFFF),
        selectedItemColor: Color(0xFF60D6B4),
        unselectedItemColor: Colors.black.withOpacity(.30),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text('To-do'),
            icon: Icon(Icons.list),
          ),
          BottomNavigationBarItem(
            title: Text('Checklist'),
            icon: Icon(
              Icons.done,
            ),
          ),
        ],
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('To Do Apps',
    //         style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),
    //     backgroundColor: Colors.pink,
    //     actions: [
    //       IconButton(
    //         onPressed: () {
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(builder: (context) => HowTo()),
    //           );
    //         },
    //         icon: Icon(Icons.info_outline_rounded),
    //       ),
    //     ],
    //     elevation: 0,
    //     centerTitle: true,
    //   ),
    //   body: Padding(
    //     padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
    //     child: tabs[_currentIndex],
    //   ),
    // bottomNavigationBar: BottomNavigationBar(
    //   type: BottomNavigationBarType.fixed,
    //   backgroundColor: Colors.white,
    //   selectedItemColor: Colors.pink,
    //   unselectedItemColor: Colors.black.withOpacity(.30),
    //   selectedFontSize: 14,
    //   unselectedFontSize: 14,
    //   currentIndex: _currentIndex,
    //   onTap: (value) {
    //     setState(() {
    //       _currentIndex = value;
    //     });
    //   },
    //   items: [
    //     BottomNavigationBarItem(
    //       title: Text('To-do'),
    //       icon: Icon(Icons.list),
    //     ),
    //     BottomNavigationBarItem(
    //       title: Text('Checklist'),
    //       icon: Icon(
    //         Icons.done,
    //       ),
    //     ),
    //   ],
    // ),
    // );
  }
}
