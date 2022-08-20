import 'package:birmbenawa/src/models/auth_provider.dart';
import 'package:birmbenawa/src/widgets/general_custom_button.dart';
import 'package:birmbenawa/src/models/phone_number_auth_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RegistrationWidget extends StatefulWidget {
  RegistrationWidget({Key? key}) : super(key: key);

  @override
  State<RegistrationWidget> createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  bool isLoading = false;
  Auth _auth = Auth();
  String userName = '';
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  final String signUpPath = 'assets/images/slider/SignUp.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade300,
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            padding: const EdgeInsets.all(32),
            child: Column(
              textDirection: TextDirection.rtl,
              children: [
                //* Photo
                AppLogInShowingInTheAppBar(),
                //* Sign Up Text it is not the text of button
                Container(
                  padding: EdgeInsets.only(top: 0),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontFamily: 'PeshangBold', fontSize: 22),
                  ),
                ),

                TextFieldBoxWidget(),
                SignInButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // //? navigating to another screen
  // void goToHome(context) => Navigator.of(context).push(
  //     MaterialPageRoute(builder: (context) => ));

  //* the Person Icon a the top of the screen check the icon
  Widget AppLogInShowingInTheAppBar() {
    return Container(
        padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
        child: Image.asset(
          signUpPath,
          height: 150,
        ));
  }

  //* Sign In Button ( Sign Up )  [ Button ]
  Widget SignInButtonWidget() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.fromLTRB(8, 6, 0, 0),
      child: GeneralCustomButtonWidget(
        customHeight: 46,
        customWidth: 200,
        ontap: () async {
          /* //TODO phone and name authentication and hunddle it.
               TODO  Send the phone number and name to other screen using provider.
          */
          context.read<AuthProvider>().changeAuthData(
              name: fullNameController.text, Phone: phoneNumberController.text);
          if (phoneNumberController.text == '' ||
              fullNameController.text == '') {
            Get.snackbar('نرخی نادیار', 'ببوورە هەندێک نرخ نادیارە');
          } else {
            await Get.defaultDialog(
                title: 'نرخەکان',
                content: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 2, right: 4),
                          child: Icon(FontAwesomeIcons.phone),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text('${phoneNumberController.text}'),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    Divider(thickness: 2),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 2, right: 4),
                          child: Icon(FontAwesomeIcons.person),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text('${fullNameController.text}'),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    Text('Are you sure?'),
                    SizedBox(height: 12),
                    ElevatedButton(
                      // Yes Button
                      onPressed: () {
                        //TODO authentication happen
                        _auth.verifyPhoneNumber(
                            context, phoneNumberController.text);
                        Navigator.of(context).pop();
                      },
                      child: Text('Yes'),
                    ),
                  ],
                ));
          }
        },
        itemText: 'Sign Up',
      ),
    );
  }

  //* Background Design of the Text Fields ( Phone Number ) and ( Full Name )
  Widget TextFieldBoxWidget() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 20,
              spreadRadius: 2,
              offset: Offset(4, 4),
            ),
            BoxShadow(
              color: Colors.white,
              blurRadius: 20,
              spreadRadius: 2,
              offset: Offset(-4, -4),
            )
          ]),
      margin: const EdgeInsets.fromLTRB(20, 40, 20, 60),
      padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
      child: Column(
        children: [
          Row(
            children: [
              //TODO add country code picker here
              // Expanded(child: ,),
              OneTextFieldFullName(
                cardIcons: Icons.person,
                labelTextView: 'Full Name',
                hintTextView: 'Enter your full name',
              ),
            ],
          ),
          Divider(thickness: 4),
          OneTextFieldPhoneNumber(
            cardIcons: Icons.call,
            labelTextView: 'Phone Number',
            hintTextView: '700 000 0000',
          ),
        ],
      ),
    );
  }

  //* Collection of the phone number Text Field
  Widget OneTextFieldPhoneNumber({
    required String labelTextView,
    required IconData? cardIcons,
    required String hintTextView,
  }) {
    return TextField(
      controller: phoneNumberController,
      decoration: InputDecoration(
          border: InputBorder.none,
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 98, 0, 255),
          ),
          prefixIcon: Icon(
            cardIcons,
            color: Color.fromARGB(255, 98, 0, 255),
          ),
          prefixIconColor: Color.fromARGB(255, 98, 0, 255),
          labelText: labelTextView,
          hintText: hintTextView),
    );
  }

  //* Collection of the Full Name Text Field
  Widget OneTextFieldFullName({
    required String labelTextView,
    required IconData? cardIcons,
    required String hintTextView,
  }) {
    return TextField(
      controller: fullNameController,
      style: TextStyle(),
      decoration: InputDecoration(
          border: InputBorder.none,
          labelStyle: TextStyle(
            fontFamily: 'PeshangBold',
            color: Color.fromARGB(255, 98, 0, 255),
          ),
          prefixIcon: Icon(
            cardIcons,
            color: Color.fromARGB(255, 98, 0, 255),
          ),
          prefixIconColor: Color.fromARGB(255, 98, 0, 255),
          labelText: labelTextView,
          hintText: hintTextView),
      onChanged: (text) {},
    );
  }
}
