import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

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
    String logoPath = 'assets/images/slider/logoNoBackground.png';
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 98, 0, 255)),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'FeedBack',
          style: TextStyle(color: Color.fromARGB(255, 98, 0, 255)),
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'please write your name at the end of message, and write is in English',
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            ),
            // User Email
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
                    launchEmail(
                        toEmail: 'birmbenawa@gmail.com', // Developer Team email
                        subject: subjectOfUser.text,
                        message: messageOfUser.text);
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

  Future launchEmail({
    required String toEmail,
    required String subject,
    required String message,
  }) async {
    final url = Uri(scheme: 'mailto', path: toEmail, queryParameters: {
      'subject': subject,
      'body': message,
    });
    // final url =
    //     'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
