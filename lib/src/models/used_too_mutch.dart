import 'package:flutter/material.dart';

class UsedTooMutch {
  final String logoPath = 'assets/images/slider/logo.png';
  Widget insideDialog = Text('Dialog is empty');
  Future askedToLead(Widget insideDialog, context) async {
    switch (await showDialog(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.grey.shade300,
          child: SimpleDialog(
            title: Text('Set an Reminder'),
            children: <Widget>[
              insideDialog,
            ],
          ),
        );
      },
    )) {
    }
  }

  Widget FloatingActionButtonTooMutchUsed(onPressed()) {
    return FloatingActionButton(
      backgroundColor: const Color.fromARGB(255, 98, 0, 255),
      onPressed: () => onPressed(),
      child: const Icon(Icons.add),
    );
  }
}
