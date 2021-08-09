import 'package:flutter/material.dart';

class CheclistItemCard extends StatefulWidget {
  // final String title;
  // final bool
  // CheclistItemCard({Key? key}) : super(key: key);

  @override
  _CheclistItemCardState createState() => _CheclistItemCardState();
}

class _CheclistItemCardState extends State<CheclistItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
      title: Text(
        "TITLE",
        key: Key('2'),
        style: TextStyle(
            color: Colors.black,
            // color: item.isComplete ? Colors.grey : Colors.black,
            // decoration: item.isComplete ? TextDecoration.lineThrough : null),
            decoration: TextDecoration.lineThrough),
      ),
      trailing: InkWell(
        child: Icon(
          // /item.isComplete ? Icons.check_box : Icons.check_box_outline_blank,
          Icons.check_box_outline_blank,
          key: Key('2'),
        ),
        onTap: () {
          setState(() {
            // item.isComplete = !item.isComplete;
          });
        },
      ),
    ));
  }
}
