import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String? id;
  String? title;
  String? description;
  bool done;

  Task({
    this.id,
    this.title,
    this.description,
    this.done = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'done': done,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map, String documentId) {
    return Task(
      id: documentId,
      title: map['title'],
      description: map['description'],
      done: map['done'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source, String documentId) =>
      Task.fromMap(json.decode(source), documentId);
}
