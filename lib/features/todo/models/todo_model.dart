class Todo {
  String? createdAt;
  String? todo;
  String? description;
  String? id;

  Todo({this.createdAt, this.todo, this.description, this.id});

  Todo.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    todo = json['todo'];
    description = json['description'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['todo'] = this.todo;
    data['description'] = this.description;
    data['id'] = this.id;
    return data;
  }
}
