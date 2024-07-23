import 'package:flutter/material.dart';

class PaddingTextField extends StatelessWidget {
  var title;
  late TextEditingController controller;
  late bool isGuest = true;
  PaddingTextField(
      {super.key,
      required String title,
      required controller,
      required isGuest});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter $title';
          }
          try {
            int d = int.parse(value);
            debugPrint("$d");
          } catch (e) {
            return 'Please enter a valid $title';
          }
        },
        keyboardType: TextInputType.phone,
        controller: controller,
        onChanged: (value) {
          try {
            int d = int.parse(value);
            debugPrint(value);
          } catch (e) {
            debugPrint("$e");
          }
        },
        decoration: InputDecoration(
          hintText: 'Enter your Guest $title ',
          hintStyle: TextStyle(color: Colors.grey.shade400),
          label: isGuest ? Text('Guest $title') : Text('Host $title'),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
        ),
      ),
    );
  }
}
