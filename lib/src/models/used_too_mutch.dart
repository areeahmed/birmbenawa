import 'package:flutter/material.dart';

class UsedTooMutch {
  final String logoPath = 'assets/images/slider/logo.png';
  Widget insideDialog = Text('Dialog is empty');
  Future askedToLead(insideDialog, context) async {
    switch (await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('Set an Reminder'),
          children: <Widget>[
            insideDialog,
          ],
        );
      },
    )) {
    }
  }
}
