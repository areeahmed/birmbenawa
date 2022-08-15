import 'package:flutter/material.dart';

class DebtScreenView extends StatefulWidget {
  DebtScreenView({Key? key}) : super(key: key);

  @override
  State<DebtScreenView> createState() => _DebtScreenViewState();
}

//! this screen is on developing
class _DebtScreenViewState extends State<DebtScreenView> {
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
