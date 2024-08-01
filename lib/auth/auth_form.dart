//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:asasiyat/auth/firebase_guest_controller.dart';
import 'package:asasiyat/controllers/stage_controller.dart';
import 'package:asasiyat/models/guest_auth.dart';
import 'package:asasiyat/widgets/top_navbar.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthForm extends StatefulWidget {
  AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final GlobalKey scaffoldKey = GlobalKey();

  Country? countryState;
  TextEditingController guestController = TextEditingController();

  TextEditingController hostController = TextEditingController();

  TextEditingController phoneNbController = TextEditingController();

  bool selected = false;
  var storage = GetStorage('asasStorage');

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    phoneNbController.dispose();
    guestController.dispose();
    hostController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  final controller = Get.put(StageController());
  var guest;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneNbController.addListener(
      () => {print(phoneNbController.text)},
    );
  }

  @override
  Widget build(BuildContext context) {
/*    final key = enc.Key.fromSecureRandom(32);
    final iv = enc.IV.fromSecureRandom(16);
    final encrypter = enc.Encrypter(enc.AES(key));

    final encrypted = encrypter.encrypt(phoneNbController.text, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    print(decrypted);
    print(encrypted.bytes);
    print(encrypted.base16);*/

    return Scaffold(
      key: scaffoldKey,
      appBar: topNavigationBar(context, scaffoldKey),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton.icon(
                    onPressed: () => {
                          setState(() {
                            selected = !selected;
                          })
                        },
                    // ignore: dead_code
                    label: selected
                        ? Text(
                            " REGISTER By  your phone number and host token   ??? ")
                        : Text('You have not REGISTER  YET   ??? '),
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.resolveWith<Color?>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) {
                            return Colors.white;
                          }
                          return null; // defer to the defaults
                        },
                      ),
                      backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) {
                            return Colors.indigo;
                          }
                          return null; // defer to the defaults
                        },
                      ),
                    )),
                // PaddingTextField(title: 'phone', controller: phoneNbController, isGuest: true),
                const SizedBox(height: 40),

                selected
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLength: 10,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value == null || value!.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.number,
                          controller: phoneNbController,
                          onChanged: (value) {
                            //setState(() {});
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your phone number',
                            suffixIcon: InkWell(
                              onTap: () async {
                                await GuestAuth().loginWithPhone(
                                    phoneNb: phoneNbController.text);
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.greenAccent.shade200,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                            prefixIcon: Container(
                                padding: EdgeInsets.all(10),
                                child: InkWell(
                                  child: countryState != null
                                      ? Text(
                                          "  ${countryState?.flagEmoji} + [${countryState?.phoneCode} ]  ")
                                      : Icon(Icons.phone),
                                  onTap: () {
                                    //
                                    showCountryPicker(
                                        context: context,
                                        //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                                        exclude: <String>['KN', 'MF'],
                                        favorite: <String>['SE'],
                                        //Optional. Shows phone code before the country name.
                                        showPhoneCode: true,
                                        onSelect: (Country country) {
                                          setState(() {
                                            countryState = country;
                                          });
                                        },

                                        // Optional. Sheet moves when keyboard opens.
                                        moveAlongWithKeyboard: false,
                                        // Optional. Sets the theme for the country list picker.
                                        countryListTheme: CountryListThemeData(
                                          // Optional. Sets the border radius for the bottomsheet.
                                          //bottomSheetHeight: 400,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(40.0),
                                            topRight: Radius.circular(40.0),
                                          ),
                                          // Optional. Styles the search field.
                                          inputDecoration: InputDecoration(
                                            labelText: 'Search',
                                            hintText: 'Start typing to search',
                                            prefixIcon:
                                                const Icon(Icons.search),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: const Color(0xFF8C98A8)
                                                    .withOpacity(0.2),
                                              ),
                                            ),
                                          ),
                                        ));

//_____________
                                  },
                                )),
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            label: Text(
                              'Guest Phone Number',
                              style: TextStyle(fontSize: 24),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      )
                    : const SizedBox(height: 20),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLength: 3,
                    validator: (value) {
                      if (value == null || value!.isEmpty) {
                        return 'Please enter your token';
                      }
                    },
                    keyboardType: TextInputType.number,
                    controller: guestController,
                    onChanged: (value) {
                      setState(() {
                        guestController.text = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Guest token',
                      prefixIcon: Icon(Icons.login),
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      label: Text(
                        'Guest Token',
                        style: TextStyle(fontSize: 24),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLength: 3,
                    keyboardType: TextInputType.phone,
                    controller: hostController,
                    validator: (value) {
                      if (value == null || value!.isEmpty) {
                        return 'Please enter host token';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      //        hostController.text = value;
                    },
                    decoration: InputDecoration(
                      hintText: '0-99',
                      prefixIcon: Icon(Icons.group),
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      label: Text(
                        'Host Token',
                        style: TextStyle(fontSize: 24),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    //enabled: selected ? true : false,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async => {
                            hostController.text = '0',
                            print(
                              "${phoneNbController.text} // ${guestController.text} // ${hostController.text}",
                            ),
                            if (int.parse(guestController.text) >= 100 &&
                                int.parse(guestController.text) < 200 &&
                                int.parse(hostController.text) == 0 &&
                                selected)
                              {
                                controller.setGuestRegistred =
                                    int.parse(guestController.text),
                                controller.setPhoneRegistred =
                                    int.parse(phoneNbController.text),
                                controller.setHostRegistred =
                                    int.parse(hostController.text),
                                /* storage.write(
                                  "guestToken ",
                                  int.parse(guestController.text),
                                ),
                                storage.write(
                                    "hostToken", int.parse(hostController.text)),
                                storage.write(
                                    "phoneNb", int.parse(phoneNbController.text)), */

                                await FirebaseGuestController().registerGuest(
                                    phoneNb: phoneNbController.text,
                                    guest: int.parse(guestController.text),
                                    host: int.parse(hostController.text)),
                                Get.offAndToNamed(
                                    '/stages/${guestController.text.toString()}'),
                              }
                            else if (int.parse(guestController.text) >= 100 &&
                                int.parse(guestController.text) < 200 &&
                                !selected)
                              {
                                print(guestController.text),
                                print(hostController.text),
                                controller.setGuestRegistred =
                                    int.parse(guestController.text),
                                controller.setHostRegistred =
                                    int.parse(hostController.text),
                                await FirebaseGuestController().loginGuest(
                                    guest: int.parse(guestController.text),
                                    host: int.parse(hostController.text)),
                                /*  storage.write(
                                    "guestToken ", guestController.text),
                                storage.write("hostToken", 0),
                   */
                                Get.offAndToNamed(
                                    '/stages/${guestController.text.toString()}'),
                              },
                            Get.snackbar('asasiyat liisamiil ',
                                'welcom  guest ${guestController.text} ',
                                snackPosition: SnackPosition.BOTTOM),
                            /*   debugPrint(storage.getValues()),
                            print("$phoneNb    $guestToken   $hostToken"),
                            print("/stages/${guestController.text}"),
                            Get.toNamed('/stages/${guestController.text}}'), */
                          },
                      /*  else
                              {
                                Get.snackbar('All fields must be filled',
                                    'organisators must have between 100 and 200'),
                              } */

                      child: selected
                          ? Text('Guest Register')
                          : Text('Guest Login')),
                ),
                const SizedBox(height: 20),
                //Text(" tokenId is ${storage.read('guestToken')}")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
