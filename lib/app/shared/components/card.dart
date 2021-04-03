import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/app/shared/models/task.dart';

class CardComponent extends StatelessWidget {
  final Task task;
  final Function deleteTask;
  final Function editTask;
  final Function doneTask;

  const CardComponent(
      {Key? key,
      required this.task,
      required this.deleteTask,
      required this.editTask,
      required this.doneTask})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.only(
              left: 20,
              top: 20,
              right: 5,
              bottom: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 200,
                  child: Text(
                    task.title!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 150,
                    child: task.done
                        ? Center(
                            child: Text(
                              'Done'.toUpperCase(),
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.green,
                              ),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Container(
                                  child: Ink(
                                    decoration: ShapeDecoration(
                                      color: Colors.transparent,
                                      shape: CircleBorder(),
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.edit),
                                      color: Colors.white,
                                      onPressed: () {
                                        editTask(task);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  child: Ink(
                                    decoration: ShapeDecoration(
                                      color: Colors.transparent,
                                      shape: CircleBorder(),
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.delete),
                                      color: Colors.white,
                                      onPressed: () {
                                        deleteTask(task.id);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  child: Ink(
                                    decoration: ShapeDecoration(
                                      color: Colors.transparent,
                                      shape: CircleBorder(),
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.check),
                                      color: Colors.white,
                                      onPressed: () {
                                        doneTask(task.id);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
