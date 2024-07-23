import 'package:asasiyat/models/guest_model.dart';

class AuthController {
  Future signGuest(
      {required context,
      required int tokenId,
      int host = 0,
      required phoneNb}) async {
    try {
      Guest guest = Guest(tokenId: tokenId, host: host, phoneNb: phoneNb);
    } catch (e) {}
  }
}
