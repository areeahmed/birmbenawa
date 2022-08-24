import 'package:flutter/material.dart';

class EditShopingListReminder extends StatelessWidget {
  const EditShopingListReminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    TextEditingController description = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 98, 0, 255),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Container(
                child: Image.asset('assets/images/List_Of_Task.png'),
              ),
              SizedBox(
                height: 8,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: title,
                    decoration: InputDecoration(
                        hintText: 'ناونیشان', hintStyle: TextStyle()),
                    style: TextStyle(
                      fontFamily: 'PeshangBold',
                      fontSize: 20,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: title,
                    decoration: InputDecoration(
                        hintText: 'زانیاری زیاتر...', hintStyle: TextStyle()),
                    style: TextStyle(
                      fontFamily: 'PeshangBold',
                      fontSize: 20,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 98, 0, 255),
                  ),
                  onPressed: () {},
                  child: Text(
                    'خەزن کردن',
                    style: TextStyle(fontFamily: 'PeshangBold'),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
