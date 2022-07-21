import 'package:flutter/material.dart';

class ShopingReminderPage extends StatefulWidget {
  const ShopingReminderPage({Key? key}) : super(key: key);

  @override
  State<ShopingReminderPage> createState() => _ShopingReminderPageState();
}

class _ShopingReminderPageState extends State<ShopingReminderPage> {
  final String logoPath = 'assets/images/slider/logo.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'List Screen',
          style: TextStyle(fontSize: 40),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
