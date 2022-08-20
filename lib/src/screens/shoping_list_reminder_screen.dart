import 'package:birmbenawa/src/provider/shop_list_remider_model.dart';
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
      floatingActionButton:
          shopingListReminderModelClass.floatingActionButton(),
    );
  }
}
