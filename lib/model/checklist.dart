class Checklist {
  String item = "";
  bool isComplete = false;

  Checklist({required this.item, this.isComplete = false});
  Checklist.fromMap(Map map)
      : this.item = map['item'],
        this.isComplete = map['isComplete'];

  Map toMap() {
    return {'item': this.item, 'isComplete': this.isComplete};
  }
}
