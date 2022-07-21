import 'package:flutter/material.dart';

class CardsView extends StatefulWidget {
  String? count;
  CardsView({
    Key? key,
    this.count,
  }) : super(key: key);

  @override
  State<CardsView> createState() => _CardsViewState(count: count);
}

class _CardsViewState extends State<CardsView> {
  String? count;
  _CardsViewState({
    this.count,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            padding: EdgeInsets.all(8),
            height: 200,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(4, 4),
                ),
                const BoxShadow(
                  color: Color.fromARGB(255, 219, 219, 219),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(-4, -4),
                )
              ],
            ),
            child: Center(child: Text(count ?? 'null')),
          ),
        ],
      ),
    );
  }
}
