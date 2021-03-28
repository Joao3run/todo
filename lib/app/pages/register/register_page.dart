import 'package:flutter/material.dart';
import 'package:todo/app/shared/components/generic_text_field.dart';
import 'package:todo/app/shared/models/task.dart';

class RegisterPage extends StatefulWidget {
  late Task? task;
  late int listSize;
  RegisterPage({required this.listSize, this.task});
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late Task _task;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _task = (widget.task != null ? widget.task : Task())!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _task.id != null ? Text('Edit task') : Text('New task'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GenericTextFormField(
                  initialValue: widget.task != null ? widget.task!.title : '',
                  labelText: 'Title',
                  errorMsg: 'Required',
                  onSaved: (value) => _task.title = value,
                  formKey: _formKey,
                ),
                SizedBox(
                  height: 10,
                ),
                GenericTextFormField(
                  initialValue:
                      widget.task != null ? widget.task!.description : '',
                  labelText: 'Description',
                  errorMsg: 'Required',
                  maxLines: 6,
                  onSaved: (value) => _task.description = value,
                  formKey: _formKey,
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: _save,
                  child: Text('Save'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      if (_task.id == null) {
        _task.id = widget.listSize + 1;
      }
      _formKey.currentState!.save();
      Navigator.of(context).pop<Task>(_task);
    }
  }
}
