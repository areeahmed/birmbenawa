import 'package:birmbenawa/src/widgets/general_custom_button.dart';
import 'package:birmbenawa/src/service/phone_number_auth.dart';
import 'package:flutter/material.dart';

class RegisterationWidget extends StatefulWidget {
  RegisterationWidget({Key? key}) : super(key: key);

  @override
  State<RegisterationWidget> createState() => _RegisterationWidgetState();
}

class _RegisterationWidgetState extends State<RegisterationWidget> {
  Auth _auth = Auth();
  String userName = '';
  TextEditingController phoneNumberController = TextEditingController();
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
                AppLogInShowingInTheAppBar(),
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

  // //! navigating to another screen
  // void goToHome(context) => Navigator.of(context).push(
  //     MaterialPageRoute(builder: (context) => ));

  //! the Person Icon a the top of the screen check the icon
  Widget AppLogInShowingInTheAppBar() {
    return Container(
        padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
        child: Image.asset(
          signUpPath,
          height: 150,
        ));
  }

  //! Sign In Button ( Sign Up )
  Widget SignInButtonWidget() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.fromLTRB(8, 6, 0, 0),
      child: GeneralCustomButtonWidget(
        customHeight: 46,
        customWidth: 200,
        ontap: () {
          _auth.verifyPhoneNumber(context, phoneNumberController.text);
        },
        itemText: 'Sign Up',
      ),
    );
  }

  //! Input Box Phone Number and Password
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
          OneTextFieldFullName(
            cardIcons: Icons.person,
            labelTextView: 'Full Name',
            hintTextView: 'Enter your full name',
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

  Widget OneTextFieldFullName({
    required String labelTextView,
    required IconData? cardIcons,
    required String hintTextView,
  }) {
    return TextField(
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
