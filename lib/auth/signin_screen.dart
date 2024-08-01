import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProviders = <AuthProvider>[
      EmailAuthProvider(),
      PhoneAuthProvider(),
    ];
    return SignInScreen(
      providers: authProviders,
      actions: [
        AuthStateChangeAction<SignedIn>(
          (context, state) {
            print("User $state");
            //  Get.offAndToNamed('/stages/${state.toString()}');
            Get.offAndToNamed("/stages/${state.user}");
          },
        ),
        AuthStateChangeAction<UserCreated>(
          (context, state) {
            print("credential $state");
            //  Get.offAndToNamed('/stages/${state.toString()}');
            Get.offAndToNamed("/stages/3");
          },
        ),
      ],
    );
    /* PhoneInputScreen(actions: [
      SMSCodeRequestedAction((context, action, flowKey, phoneNumber) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SMSCodeInputScreen(
              flowKey: flowKey,
            ),
          ),
        );
      }),
    ]); */
  }
}
