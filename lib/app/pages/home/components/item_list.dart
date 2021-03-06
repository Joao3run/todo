import 'package:flutter/material.dart';
import 'package:todo/app/shared/models/task.dart';

class ItemListaWidget extends StatefulWidget {
  final Task task;

  const ItemListaWidget({Key? key, required this.task}) : super(key: key);

  @override
  _ItemListaWidgetState createState() => _ItemListaWidgetState();
}

class _ItemListaWidgetState extends State<ItemListaWidget> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.task.title!),
      subtitle: Text(widget.task.description!),
      value: widget.task.done,
      onChanged: (bool? value) {
        setState(() {
          widget.task.done = value!;
        });
      },
    );
  }
}
