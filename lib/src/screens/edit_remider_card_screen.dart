import 'package:flutter/material.dart';

class EditReminderCardScreen extends StatelessWidget {
  const EditReminderCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //TODO add time icon to the screen
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Title',
                ),
              ),
              //TODO add title ( text field )

              //TODO add description ( text field )
              //TODO add time picker ( Button => open time dialog )
              //TODO add a color picker ( Drop Down Button )
              //TODO add an Icon picker ( Button to open Icon Dialog )
            ],
          ),
        ));
  }
}
