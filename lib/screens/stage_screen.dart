import 'package:asasiyat/asas_module/views/asas_viewer.dart';
import 'package:asasiyat/controllers/asas_controller.dart';
import 'package:asasiyat/widgets/asasiyat-drawer.dart';
import 'package:asasiyat/widgets/asasiyat_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AsasScreen extends StatelessWidget {
  AsasScreen({super.key});
  final AsasController c = Get.put(AsasController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    return Scaffold(
      key: scaffoldKey,
      drawer: asasdrawer(context: scaffoldKey),
      appBar: AsasiatNavBar(
          context: context,
          key: scaffoldKey,
          nextRoute: 'alasas',
          title: 'asas'),
      body: AsasViewer(),
    );
  }
}
