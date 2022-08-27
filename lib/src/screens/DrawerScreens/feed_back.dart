import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FeedBackScreen extends StatefulWidget {
  FeedBackScreen({Key? key}) : super(key: key);

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameOfUser = TextEditingController();
    TextEditingController emailOfUser = TextEditingController();
    TextEditingController subjectOfUser = TextEditingController();
    TextEditingController messageOfUser = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 98, 0, 255),
        centerTitle: true,
        title: Text('Feed Back'),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: TextField(
                controller: nameOfUser,
                decoration: InputDecoration(
                  hintText: 'Your name',
                  border: OutlineInputBorder(),
                ),
              ),
            ), // user name
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: TextField(
                controller: emailOfUser,
                enableSuggestions: true,
                decoration: InputDecoration(
                  hintText: 'example@example.com',
                  border: OutlineInputBorder(),
                ),
              ),
            ), // User Email
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Subject',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: TextField(
                controller: subjectOfUser,
                decoration: InputDecoration(
                  hintText: 'What\'s the issus title?',
                  border: OutlineInputBorder(),
                ),
              ),
            ), // the subject or the feedback that
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Message',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: TextField(
                controller: messageOfUser,
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: 'Write more Details Here...',
                  border: OutlineInputBorder(),
                ),
              ),
            ), // for user Message

            Container(
                margin: EdgeInsets.only(left: 100, top: 20),
                height: 60,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO send the feed back with email to us
                    //TODO show the dialog and tell the user to be patent for response
                  },
                  child: Icon(Icons.send),
                  style: ButtonStyle(),
                ))
          ],
        ),
      )),
    );
  }
}
