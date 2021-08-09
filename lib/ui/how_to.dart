import 'package:flutter/material.dart';

class HowTo extends StatefulWidget {
  @override
  _HowToState createState() => _HowToState();
}

class _HowToState extends State<HowTo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do Apps',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),
        backgroundColor: Colors.pink,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              alignment: Alignment.center,
              child: Text("How To",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text("Adding Todo",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 20),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                  "Press + button on the To DO Screen,then add your desired to do.",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text("Deleting Todo",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 20),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                  "Press delete button on the top left of your to do card.",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text("Adding Checklist",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 20),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                  "Press + button on the To DO Screen,then add your desired to do.",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text("Deleting Checklist",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 20),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                  "Swipe the item to the left and your item will be deleted.",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
            ),
          ),
        ],
      ),
    );
  }
}
