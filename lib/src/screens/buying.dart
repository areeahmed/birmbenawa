import 'package:flutter/material.dart';

class BuyingChatScreenView extends StatefulWidget {
  BuyingChatScreenView({Key? key}) : super(key: key);

  @override
  State<BuyingChatScreenView> createState() => _BuyingChatScreenViewState();
}

class _BuyingChatScreenViewState extends State<BuyingChatScreenView> {
  final developModePathImage = 'assets/images/Developing.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(developModePathImage),
            const Text(
              'On Developing',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
