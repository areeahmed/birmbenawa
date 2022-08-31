import 'package:birmbenawa/src/widgets/general_custom_button.dart';
import 'package:birmbenawa/src/service/phone_number_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberVerificationWidget extends StatefulWidget {
  String verificationId;
  PhoneNumberVerificationWidget({
    Key? key,
    required this.verificationId,
  }) : super(key: key);

  @override
  State<PhoneNumberVerificationWidget> createState() =>
      // ignore: no_logic_in_create_state
      _PhoneNumberVerificationWidgetState(
        verificationId: verificationId,
      );
}

class _PhoneNumberVerificationWidgetState
    extends State<PhoneNumberVerificationWidget> {
  Auth authClass = Auth();
  String? smsCodeControllerCollectionInString;
  TextEditingController firstNumnberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();
  TextEditingController thirdNumberController = TextEditingController();
  TextEditingController fourthNumberController = TextEditingController();
  TextEditingController fifthNumberController = TextEditingController();
  TextEditingController sixthNumberController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId;
  _PhoneNumberVerificationWidgetState({
    required this.verificationId,
    this.smsCodeControllerCollectionInString,
  });
  final TextEditingController smsCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              VerificationNumberInputFormWidget(),
              SizedBox(
                height: 20,
              ),
              SignInButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget SignInButtonWidget() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.fromLTRB(8, 6, 0, 0),
      child: GeneralCustomButtonWidget(
        customHeight: 46,
        customWidth: 200,
        ontap: () async {
          if (firstNumnberController.text == '' ||
              secondNumberController.text == '' ||
              thirdNumberController.text == '' ||
              fourthNumberController.text == '' ||
              fifthNumberController.text == '' ||
              sixthNumberController.text == '') {
            final snackBar = SnackBar(
              duration: Duration(milliseconds: 800),
              content: Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  'خانەکان بە دروستی پڕبکەوە تکایە',
                  style: TextStyle(fontSize: 24, fontFamily: 'RaberR'),
                ),
              ),
              backgroundColor: Colors.red,
            );
            // showing snackbar at the bottom of the screen.
            ScaffoldMessenger.of(context)
              ..removeCurrentMaterialBanner()
              ..showSnackBar(snackBar);
          } else {
            setState(() {
              final snackBar = SnackBar(
                duration: Duration(milliseconds: 800),
                content: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    'جێبەجێکرا',
                    style: TextStyle(fontSize: 24, fontFamily: 'RaberR'),
                  ),
                ),
                backgroundColor: Colors.green,
              );
              // showing snackbar at the bottom of the screen.
              ScaffoldMessenger.of(context)
                ..removeCurrentMaterialBanner()
                ..showSnackBar(snackBar);
              smsCodeControllerCollectionInString =
                  firstNumnberController.text +
                      secondNumberController.text +
                      thirdNumberController.text +
                      fourthNumberController.text +
                      fifthNumberController.text +
                      sixthNumberController.text;
            });

            authClass.sendVerificationCode(
                context, verificationId, smsCodeControllerCollectionInString!);
          }
        },
        itemText: 'Sign In',
      ),
    );
  }

  Widget VerificationNumberInputFormWidget() {
    return Form(
      child: Row(
        children: [
          //! First
          Container(
            height: 62,
            color: Colors.grey.shade300,
            margin: EdgeInsets.only(
              left: 55,
            ),
            child: SizedBox(
              height: 40,
              width: 40,
              child: TextFormField(
                controller: firstNumnberController,
                onChanged: ((value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                }),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                  hintText: '0',
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.done,
                style: Theme.of(context).textTheme.headline6,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),
          //! Second
          Container(
            height: 62,
            color: Colors.grey.shade300,
            margin: EdgeInsets.only(
              left: 10,
            ),
            child: SizedBox(
              height: 40,
              width: 40,
              child: TextFormField(
                controller: secondNumberController,
                onChanged: ((value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                }),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                  hintText: '0',
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.done,
                style: Theme.of(context).textTheme.headline6,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),
          //! Third
          Container(
            height: 62,
            color: Colors.grey.shade300,
            margin: EdgeInsets.only(
              left: 10,
            ),
            child: SizedBox(
              height: 40,
              width: 40,
              child: TextFormField(
                controller: thirdNumberController,
                onChanged: ((value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                }),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                  hintText: '0',
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.done,
                style: Theme.of(context).textTheme.headline6,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),
          //! Field 4
          Container(
            height: 62,
            color: Colors.grey.shade300,
            margin: EdgeInsets.only(
              left: 10,
            ),
            child: SizedBox(
              height: 40,
              width: 40,
              child: TextFormField(
                controller: fourthNumberController,
                onChanged: ((value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                }),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                  hintText: '0',
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.done,
                style: Theme.of(context).textTheme.headline6,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),
          //! Field 5
          Container(
            height: 62,
            color: Colors.grey.shade300,
            margin: EdgeInsets.only(
              left: 10,
            ),
            child: SizedBox(
              height: 40,
              width: 40,
              child: TextFormField(
                controller: fifthNumberController,
                onChanged: ((value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                }),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                  hintText: '0',
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.done,
                style: Theme.of(context).textTheme.headline6,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),
          //! Field 6
          Container(
            height: 62,
            color: Colors.grey.shade300,
            margin: EdgeInsets.only(
              left: 10,
            ),
            child: SizedBox(
              height: 40,
              width: 40,
              child: TextFormField(
                controller: sixthNumberController,
                onChanged: ((value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                }),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                  hintText: '0',
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.done,
                style: Theme.of(context).textTheme.headline6,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
