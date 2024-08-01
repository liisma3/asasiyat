import 'dart:collection';

import 'package:asasiyat/models/guest_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class GuestController extends GetxController {
  late final RxList<Guest>? _guests = [].obs as RxList<Guest>?;
  //static const _categories = ["TIWAL", "MIIN", "MATHANI", "MOFASAL"];
  late final Guest _guest;
  final isLoggedIn = FirebaseAuth.instance.currentUser != null;
  List<Guest>? get guests => _guests!.value;
  set setGuests(List<Guest> gsts) {
    _guests!.value = gsts;
  }

  Status _status = Status.Uninitialized;

  RxInt _guestToken = 0.obs;
  int get guestToken => _guestToken.value;

  set setGuestToken(int tokenI) {
    _guestToken.value = tokenI;
  }

  RxBool _isLogged = false.obs;

  RxBool _isHost = false.obs;

  RxInt _phoneNb = 0.obs;

  RxString _uid = ''.obs;

  UnmodifiableListView<Guest> get mes_guests =>
      UnmodifiableListView(guests as Iterable<Guest>);
  void findGuestById(int tokenId) => {
        // return _guests.value.firstWhere((Guest gst)=> gsr.tokenId == tokenId );
      };
}
