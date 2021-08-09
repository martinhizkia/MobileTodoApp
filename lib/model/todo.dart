class Todo {
  String title = "";
  String desc = "";
  String cat = "";
  String date = "";
  String time = "";
  bool isComplete = false;

  Todo(
      {required this.title,
      required this.desc,
      required this.cat,
      required this.date,
      required this.time,
      this.isComplete = false});
  Todo.fromMap(Map map)
      : this.title = map['title'],
        this.desc = map['desc'],
        this.cat = map['cat'],
        this.time = map['time'],
        this.date = map['date'],
        this.isComplete = map['isComplete'];

  Map toMap() {
    return {
      'title': this.title,
      'desc': this.desc,
      'cat': this.cat,
      'date': this.date,
      'time': this.time,
      'isComplete': this.isComplete
    };
  }
}
