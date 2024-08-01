import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class GuestAuth {
  Function loginWithPhone = ({String phoneNb = '+33 6 99 30 72 23'}) async {
    final phone = '+33 6 99 30 72 23';
    print(phoneNb);
    try {
      if (kIsWeb) {
        try {
          print(phone);

          await FirebaseAuth.instance.verifyPhoneNumber(
            phoneNumber: phone,
            verificationCompleted: (PhoneAuthCredential credential) async {
              try {
                //await FirebaseAuth.instance.signInWithCredential(credential);
                debugPrint(credential.toString());
              } catch (e) {
                debugPrint("credential $e");
              }
            },
            verificationFailed: (FirebaseAuthException e) {
              print("verification failed $e");
            },
            codeSent: (String verificationId, int? resendToken) async {
              var smsCode = "121212";
              var credential = PhoneAuthProvider.credential(
                  verificationId: verificationId, smsCode: smsCode);
              await FirebaseAuth.instance.signInWithCredential(credential);
            },
            codeAutoRetrievalTimeout: (String verificationId) {},
          );
        } catch (e) {
          print('Verify Error $e');
        }
      } else {
        print('here');
      }
    } catch (e) {
      print(e);
    }
  };
  Function getInstanse = () async {
    await FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  };
}
