import 'package:flutter/material.dart';

class ShopingReminderPage extends StatefulWidget {
  const ShopingReminderPage({Key? key}) : super(key: key);

  @override
  State<ShopingReminderPage> createState() => _ShopingReminderPageState();
}

class _ShopingReminderPageState extends State<ShopingReminderPage> {
  bool? value = false;
  final String logoPath = 'assets/images/slider/logo.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 70),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ExpansionTile(
                leading: Icon(
                  Icons.call,
                ),
                title: Text('Title'),
                subtitle: Text('more detail'),
                children: [
                  Container(
                    child: Row(children: [
                      buildCheckBox(),
                      Text(
                        'Your Task is Here...',
                        style: TextStyle(
                          color: value! ? Colors.grey.shade600 : Colors.black,
                          decorationThickness: 4,
                          decoration:
                              value! ? TextDecoration.lineThrough : null,
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    child: Row(children: [
                      buildCheckBox(),
                      Text(
                        'Your Task is Here...',
                        style: TextStyle(
                          color: value! ? Colors.grey.shade600 : Colors.black,
                          decorationThickness: 4,
                          decoration:
                              value! ? TextDecoration.lineThrough : null,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
              ExpansionTile(
                leading: Icon(
                  Icons.call,
                ),
                title: Text('Title'),
                subtitle: Text('more detail'),
                children: [
                  Container(
                    child: Row(children: [
                      buildCheckBox(),
                      Text(
                        'Your Task is Here...',
                        style: TextStyle(
                          color: value! ? Colors.grey.shade600 : Colors.black,
                          decorationThickness: 4,
                          decoration:
                              value! ? TextDecoration.lineThrough : null,
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    child: Row(children: [
                      buildCheckBox(),
                      Text(
                        'Your Task is Here...',
                        style: TextStyle(
                          color: value! ? Colors.grey.shade600 : Colors.black,
                          decorationThickness: 4,
                          decoration:
                              value! ? TextDecoration.lineThrough : null,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
              ExpansionTile(
                leading: Icon(
                  Icons.call,
                ),
                title: Text('Title'),
                subtitle: Text('more detail'),
                children: [
                  Container(
                    child: Row(children: [
                      buildCheckBox(),
                      Text(
                        'Your Task is Here...',
                        style: TextStyle(
                          color: value! ? Colors.grey.shade600 : Colors.black,
                          decorationThickness: 4,
                          decoration:
                              value! ? TextDecoration.lineThrough : null,
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    child: Row(children: [
                      buildCheckBox(),
                      Text(
                        'Your Task is Here...',
                        style: TextStyle(
                          color: value! ? Colors.grey.shade600 : Colors.black,
                          decorationThickness: 4,
                          decoration:
                              value! ? TextDecoration.lineThrough : null,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildCheckBox() => Checkbox(
        value: value,
        onChanged: (value) {
          setState(() {
            this.value = value;
          });
        },
      );
}

class CheckBoxChecked {
  bool? checked;

  CheckBoxChecked({
    this.checked,
  });
}
