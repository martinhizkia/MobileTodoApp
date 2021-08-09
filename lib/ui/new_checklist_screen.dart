import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/model/checklist.dart';

class ChecklistScreen extends StatefulWidget {
  List<Checklist> listt;
  final ValueChanged<Checklist> updateChecklist;
  final ValueChanged<Checklist> deleteChecklist;
  ChecklistScreen(
      {Key? key,
      required this.listt,
      required this.updateChecklist,
      required this.deleteChecklist})
      : super(key: key);

  @override
  _ChecklistScreenState createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  @override
  Widget build(BuildContext context) {
    String getCurrentDate() {
      return DateFormat.yMMMMd('en_US').format(DateTime.now()).toString();
    }

    return Container(
        child: Scaffold(
            backgroundColor: const Color(0xFFFFFFFFF),
            body: SingleChildScrollView(
                child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 5),
                                  child: Container(
                                    child: Text("Checklist",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold)),
                                  ),
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
                      ],
                    ),
                    Container(
                        child: widget.listt.isEmpty
                            ? emptyList()
                            : ListView.builder(
                                itemCount: widget.listt.length,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    child: buildItemView(
                                        widget.listt[index], index),
                                  );
                                }))
                  ],
                ),
              ),
            ))));
  }

  Widget buildItemView(Checklist item, int index) {
    return Dismissible(
      key: Key('${item.hashCode}'),
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
                    style: TextStyle(color: Colors.white, fontSize: 17))
              ],
            ),
          ),
          color: Colors.pink),
      onDismissed: (direction) => widget.deleteChecklist(item),
      direction: DismissDirection.startToEnd,
      child: buildChecklistCard(item, index),
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

  Widget buildChecklistCard(Checklist item, int index) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey)),
      child: ListTile(
        title: Text(
          item.item,
          key: Key('item-$index'),
          style: TextStyle(
              color: item.isComplete ? Colors.grey : Colors.black,
              decoration: item.isComplete ? TextDecoration.lineThrough : null),
        ),
        trailing: InkWell(
          child: Icon(
            item.isComplete ? Icons.check_box : Icons.check_box_outline_blank,
            key: Key('completed-icon-$index'),
          ),
          onTap: () {
            setState(() {
              widget.updateChecklist(item);
            });
          },
        ),
      ),
    );
  }
}
