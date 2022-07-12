import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 132, 255),
        title: const Text('Birmbanawa'),
      ),
      body: Container(
        child: Center(
          child: Text('Home Page Content'),
        ),
      ),
      
    );
  }
}