import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final authProviders = <AuthProvider>[
      EmailAuthProvider(),
      PhoneAuthProvider(),
    ];
    return ProfileScreen(
      avatarSize: 37,
      providers: authProviders,
      actions: [
        SignedOutAction(
          (context) {
            Get.offAndToNamed("/home");
          },
        )
      ],
    );
  }
}
