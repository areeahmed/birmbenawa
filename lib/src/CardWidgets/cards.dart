import 'package:flutter/material.dart';

class CardsView extends StatefulWidget {
  String? time; //! requeared
  bool? pm; //! requeared
  bool? am; //! requeared
  String? title;
  Icon? icon;
  Color? cardColor;
  CardsView({
    Key? key,
    this.time, //! requeared
    this.am, //! requeared
    this.pm, //! requeared
    this.title,
    this.icon,
    this.cardColor,
  }) : super(key: key);

  @override
  State<CardsView> createState() => _CardsViewState(
        time: time,
        pm: pm,
        am: am,
        title: title,
        icon: icon,
      );
}

class _CardsViewState extends State<CardsView> {
  String? time; //! requeared
  bool? pm; //! requeared
  bool? am; //! requeared
  String? title;
  Icon? icon;
  _CardsViewState({
    this.time, //! requeared
    this.am, //! requeared
    this.pm, //! requeared
    this.title,
    this.icon,
  });
  @override
  Widget build(BuildContext context) {
    bool isSelected = true;
    int indexOfdays = 0;
    final listOfDays = ['SAT', 'SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI'];
    return Container(
      padding: EdgeInsets.only(top: 13),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              padding: EdgeInsets.all(8),
              height: 155,
              width: 376,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 66, 66, 66),
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: Offset(2, 2),
                  ),
                  BoxShadow(
                    color: Color.fromARGB(255, 241, 241, 241),
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(19, 8, 8, 0),
                    child: Row(
                      children: [
                        Text(
                          listOfDays[0],
                          style: TextStyle(
                            color: isSelected ? Colors.pink : Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          listOfDays[1],
                          style: TextStyle(
                            color: isSelected ? Colors.pink : Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          listOfDays[2],
                          style: TextStyle(
                            color: isSelected ? Colors.pink : Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          listOfDays[3],
                          style: TextStyle(
                            color: isSelected ? Colors.pink : Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          listOfDays[4],
                          style: TextStyle(
                            color: isSelected ? Colors.pink : Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          listOfDays[5],
                          style: TextStyle(
                            color: isSelected ? Colors.pink : Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          listOfDays[6],
                          style: TextStyle(
                            color: isSelected ? Colors.pink : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Column(
                          children: [
                            Icon(
                              Icons.person,
                              size: 50,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(110, 0, 20, 10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Title',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'More Detail',
                            ),
                          ],
                        ),
                      ),

                      //! Time Column
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 0, 20),
                            child: Column(
                              children: [
                                Text(
                                  '12:12',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'PM',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
