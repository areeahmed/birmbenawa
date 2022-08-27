import 'package:flutter/material.dart';

class FeedBackScreen extends StatefulWidget {
  FeedBackScreen({Key? key}) : super(key: key);

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Feed Back'),
      ),
      body: Center(
        child: Text('Feed Back Screen'),
      ),
    );
  }
}
