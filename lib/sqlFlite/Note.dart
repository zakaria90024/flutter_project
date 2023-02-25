class Note {
  int? id;
  String? name;

  Note(this.id, this.name);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
    };
    return map;
  }

  Note.fromMap(Map<String, dynamic> result)
      : id = result["id"],
        name = result["name"];
}