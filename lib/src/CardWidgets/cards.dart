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

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.only(top: 13),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(8),
              height: 160,
              width: 376,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  //! Days
                  DaysCheckedView(isSelected: isSelected),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Icon(
                          Icons.person,
                          size: 50,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(110, 0, 20, 10),
                        child: Column(
                          children: const [
                            SizedBox(height: 30),
                            Text(
                              'ناونیشان',
                              style: TextStyle(
                                fontFamily: 'PeshangBold',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
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
                            padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                            child: Column(
                              children: const [
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

  //! for the days you need a model class
  Widget DaysCheckedView({required isSelected}) {
    final listOfDays = ['SAT', 'SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI'];
    return Container(
      padding: const EdgeInsets.fromLTRB(19, 8, 8, 0),
      child: Row(
        children: [
          Text(
            listOfDays[0],
            style: TextStyle(
              color: isSelected ? Colors.pink : Colors.black,
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            listOfDays[1],
            style: TextStyle(
              color: isSelected ? Colors.pink : Colors.black,
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            listOfDays[2],
            style: TextStyle(
              color: isSelected ? Colors.pink : Colors.black,
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            listOfDays[3],
            style: TextStyle(
              color: isSelected ? Colors.pink : Colors.black,
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            listOfDays[4],
            style: TextStyle(
              color: isSelected ? Colors.pink : Colors.black,
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            listOfDays[5],
            style: TextStyle(
              color: isSelected ? Colors.pink : Colors.black,
            ),
          ),
          const SizedBox(
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
    );
  }
}
