import 'dart:convert';

List<Todo> postFromJson(String str) =>
    List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));

String postToJson(List<Todo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Todo singlepostFromJson(String str) => Todo.fromJson(json.decode(str));
String singlepostToJson(Todo data) => json.encode(data.toJson());

class Todo {
  Todo({
    required this.id,
    required this.todo,
  });

  int id;
  String todo;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: int.parse(json["id"]),
        todo: json["todo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "todo": todo,
      };
}
