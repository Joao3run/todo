import 'package:flutter/material.dart';
import 'package:todo/app/pages/register/register_page.dart';
import 'package:todo/app/shared/components/card.dart';
import 'package:todo/app/shared/models/task.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => CardComponent(
          task: tasks[index],
          editTask: editTask,
          deleteTask: showAlert,
          doneTask: doneTask,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Task? task = await Navigator.of(context).push<Task>(
            MaterialPageRoute(builder: (context) {
              return RegisterPage(listSize: tasks.length);
            }),
          );
          setState(() {
            tasks.add(task!);
          });
        },
      ),
    );
  }

  editTask(Task task) async {
    Task? taskUpdated = await Navigator.of(context).push<Task>(
      MaterialPageRoute(builder: (context) {
        return RegisterPage(listSize: tasks.length, task: task);
      }),
    );

    int index = tasks.indexWhere((element) => element.id == taskUpdated!.id);
    tasks[index].title = taskUpdated!.title;
    tasks[index].description = taskUpdated.description;
    tasks[index] = taskUpdated;
    setState(() {
      tasks = tasks;
    });
  }

  deleteTask(int id) {
    int index = tasks.indexWhere((element) => element.id == id);
    Navigator.pop(context);
    tasks.removeAt(index);
    setState(() {
      tasks = tasks;
    });
  }

  doneTask(int id) {
    int index = tasks.indexWhere((element) => element.id == id);
    tasks[index].done = true;
    setState(() {
      tasks = tasks;
    });
  }

  showAlert(int id) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Do you really want to delete this task?',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              deleteTask(id);
            },
            child: Text('Ok'),
          ),
        ],
      ),
    );
  }
}
