import 'package:asasiyat/controllers/asas_controller.dart';
import 'package:asasiyat/views/al_asas_pages_viewer.dart';
import 'package:asasiyat/widgets/asasiyat-drawer.dart';
import 'package:asasiyat/widgets/asasiyat_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlAsasScreen extends StatelessWidget {
  AlAsasScreen({super.key});
  final AsasController c = Get.put(AsasController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    return Scaffold(
      key: scaffoldKey,
      drawer: asasdrawer(context: scaffoldKey),
      appBar: AsasiyatNavBar(
          context: context,
          key: scaffoldKey,
          nextRoute: 'stage',
          title: 'alasas'),
      body: AlAsasPagesViewer(),
    );
  }
}
