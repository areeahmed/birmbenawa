import 'package:birmbenawa/src/models/shop_list_remider_model.dart';
import 'package:flutter/material.dart';

class ShopingReminderPage extends StatefulWidget {
  const ShopingReminderPage({Key? key}) : super(key: key);

  @override
  State<ShopingReminderPage> createState() => _ShopingReminderPageState();
}

class _ShopingReminderPageState extends State<ShopingReminderPage> {
  ShopingListRemiderModelClass shopingListReminderModelClass =
      ShopingListRemiderModelClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 70),
        child: SingleChildScrollView(
          child: Column(
            children: [
              shopingListReminderModelClass.listTileWidgetComponent(),
              shopingListReminderModelClass.listTileWidgetComponent(),
            ],
          ),
        ),
      ),
      floatingActionButton:
          shopingListReminderModelClass.floatingActionButton(),
    );
  }
}
