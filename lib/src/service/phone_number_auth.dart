import 'package:birmbenawa/src/main_screen.dart';
import 'package:birmbenawa/src/screens/phone_number_verification.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;

  verifyPhoneNumber(context, String phoneNumber) async {
    return await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+964 $phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => PhoneNumberVerificationWidget(
              verificationId: verificationId,
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  sendVerificationCode(context, String verificationId,
      String smsCodeControllerCollectionInString) async {
    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCodeControllerCollectionInString);

    // Sign the user in (or link) with the credential
    await auth.signInWithCredential(credential);
    Navigator.of(context).push(
      PageRouteBuilder(pageBuilder: (_, __, ___) => MainPageScreen()),
    );
  }
}
