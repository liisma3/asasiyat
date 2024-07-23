import 'package:asasiyat/models/guest_model.dart';
import 'package:asasiyat/widgets/top_navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  TextEditingController guestController = TextEditingController();

  TextEditingController hostController = TextEditingController();

  TextEditingController phoneNbController = TextEditingController();

  bool selected = false;
  var storage = GetStorage('asasStorage');

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var guestLogged;
    var guestRegistred;

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
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                selected
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLength: 10,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            /*       try {
                              phoneNb = int.parse(value);
                            } catch (e) {
                              return 'Please enter a valid phone number';
                            } */
                            return null;
                          },
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.phone,
                          controller: phoneNbController,
                          onChanged: (value) {
                            /*   try {
                              phoneNb = int.parse(value);
                            } catch (e) {
                              debugPrint("$e");
                            }
  */
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your phone number',
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            label: Text(
                              'Guest Phone Number',
                              style: TextStyle(fontSize: 24),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4)),
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
                      if (value!.isEmpty) {
                        return 'Please enter your token';
                      }
                    },
                    keyboardType: TextInputType.phone,
                    controller: guestController,
                    onChanged: (value) {
                      /* try {
                        guestToken = int.parse(value);
                      } catch (e) {
                        debugPrint("$e");
                      } */
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Guest token',
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      label: Text(
                        'Guest Token',
                        style: TextStyle(fontSize: 24),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
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
                      if (value!.isEmpty) {
                        return 'Please enter host token';
                      }
                      /* try {
                        hostToken = int.parse(value);

                        //  debugPrint("$d");
                      } catch (e) {
                        return 'Please enter a valid host token';
                      } */
                      return null;
                    },
                    onChanged: (value) {
                      /* try {
                        hostToken = int.parse(value);
                        //      int d = int.parse(value);
                      } catch (e) {
                        debugPrint("$e");
                      }
 */
                    },
                    decoration: InputDecoration(
                      hintText: '0-99',
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      label: Text(
                        'Host Token',
                        style: TextStyle(fontSize: 24),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    //enabled: selected ? true : false,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () => {
                          if (int.parse(guestController.text) >= 100 &&
                              int.parse(guestController.text) < 200 &&
                              int.parse(hostController.text) == 0 &&
                              selected)
                            {
                              guestRegistred = Guest(
                                  tokenId: int.parse(guestController.text),
                                  phoneNb: int.parse(phoneNbController.text),
                                  host: int.parse(hostController.text)),
                              storage.write(
                                "guestToken ",
                                int.parse(guestController.text),
                              ),
                              storage.write(
                                  "hostToken", int.parse(hostController.text)),
                              storage.write(
                                  "phoneNb", int.parse(phoneNbController.text)),
                            }
                          else if (int.parse(guestController.text) >= 100 &&
                              int.parse(guestController.text) < 200 &&
                              !selected)
                            {
                              guestLogged = Guest(
                                  tokenId: int.parse(guestController.text),
                                  host: 0),
                              storage.write(
                                  "guestToken ", guestController.text),
                              storage.write("hostToken", 0),
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

void registerGuest(
    {required int tokenId,
    int host = 0,
    String collaboratorId = "O6cKgXEsuPNAuzCMTGeblWW9sWI3"}) async {
  try {} catch (e) {
    FirebaseFirestore _firestore = await FirebaseFirestore.instance;
    await _firestore.doc('guests/$tokenId').set(
        {'host': host, 'tokenId': tokenId, 'collaboratorId': collaboratorId},
        SetOptions(merge: true));
    throw e;
  }
}

void loginGuest(
    {required int tokenId,
    int host = 0,
    String collaboratorId = "O6cKgXEsuPNAuzCMTGeblWW9sWI3"}) async {
  try {
    FirebaseFirestore _firestore = await FirebaseFirestore.instance;
    await _firestore.doc('guests/$tokenId').set(
        {'host': host, 'tokenId': tokenId, 'collaboratorId': collaboratorId},
        SetOptions(merge: true));
  } catch (e) {
    throw e;
  }
}
