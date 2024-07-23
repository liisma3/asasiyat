import 'package:asasiyat/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

Widget asasdrawer({required context}) {
  double guestToken = -1;
  return Drawer(
    backgroundColor: AsasStyle.lightGreyColor,
    child: ListView(
      children: [
        /* UserAccountsDrawerHeader(
                      // decoration: BoxDecoration(borderRadius: BorderRadius.all()),
                      currentAccountPicture: CircleAvatar(
                        child: const Text('G'),
                        backgroundColor: Color(0xFFE0F2E4),
                      ),
                      accountName: const Text('Guest Token'),
                      accountEmail: const Text('Host Token')),
                )
               */
        ElevatedButton(
            onPressed: () {
//              debugPrint('login');
              Get.toNamed('/login');
            },
            child: Text('register / login')),
        ListTile(
          leading: Icon(Icons.hive_outlined),
          title: Text('Stages'),
          // ignore: avoid_print
          onTap: () => {Get.toNamed('/stages/3')},
        ),
        ListTile(
          leading: Icon(Icons.hive_outlined),
          title: Text('Stages + '),
          // ignore: avoid_print
          onTap: () => {Get.toNamed('/stages/4')},
        ),
        ListTile(
          leading: Icon(Icons.hive_outlined),
          title: Text('Stages ++ '),
          // ignore: avoid_print
          onTap: () => {Get.toNamed('/stages/5')},
        ),
        ListTile(
          leading: Icon(Icons.hourglass_bottom_outlined),
          title: Text('Sprints'),
          // ignore: avoid_print
          onTap: () => {Get.toNamed('/sprints'), print('sprints')},
        ),
        ListTile(
          leading: Icon(Icons.handshake),
          title: Text('Hosts'),
          onTap: () => {Get.toNamed('/hosts'), print('hosts')},
        ),
        ListTile(
          leading: Icon(Icons.group_outlined),
          title: Text('Guests'),
          onTap: () => {
            Get.toNamed('/guests'),
            // ignore: avoid_print
            print('guests')
          },
        )
      ],
    ),
  );
}
