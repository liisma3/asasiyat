import 'dart:math';

import 'package:asasiyat/constants/data_helper.dart';
import 'package:asasiyat/encryption_service.dart';
import 'package:asasiyat/models/guest_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirebaseGuestController {
  var _firestore = FirebaseFirestore.instance;
  Future registerGuest(
      {required int guest,
      required int host,
      required String phoneNb,
      collaboratorId = "O6cKgXEsuPNAuzCMTGeblWW9sWI3"}) async {
    try {
      EncryptionService enc = EncryptionService();
      enc.init();
      String encrypted = enc.encryptData(phoneNb);
      print(encrypted);
      var r = Random();
      final flagIndex = await r.nextInt(DataHelper.flags.length);
      print(flagIndex);

      //print(phoneNb);
      // FirebaseFirestore _firestore = await FirebaseFirestore.instance;
      await _firestore.doc('guests/${guest}').set({
        'host': host,
        'tokenId': guest,
        'encryped': encrypted,
        'flag': DataHelper.flags[flagIndex],
        'collaboratorId': collaboratorId
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
      Get.snackbar(
          'login exception ${e}', 'You can t access your guest account');
    }
  }

  Future loginGuest(
      {required int guest,
      required int host,
      String collaboratorId = "O6cKgXEsuPNAuzCMTGeblWW9sWI3"}) async {
    try {
      print("${host}");

      //FirebaseFirestore _firestore = await FirebaseFirestore.instance;
      await _firestore.doc('guests/${guest}').set(
          {'host': host, 'tokenId': guest, 'collaboratorId': collaboratorId},
          SetOptions(merge: true));
    } catch (e) {
      Get.snackbar(
          'login exception ${e}', 'You can t access your guest account');
    }
  }

  Future signGuest(
      {required context,
      required int tokenId,
      int host = 0,
      required phoneNb}) async {
    try {
      Guest guest = Guest(
          tokenId: tokenId,
          host: host,
          phoneNb: phoneNb,
          collaboratorId: 'O6cKgXEsuPNAuzCMTGeblWW9sWI3');
    } catch (e) {}
  }
}
