import 'package:asasiyat/asas_module/asas_viewer.dart';
import 'package:asasiyat/widgets/asasiyat-drawer.dart';
import 'package:asasiyat/widgets/asasiyat_navbar.dart';
import 'package:flutter/material.dart';

class AsasScreen extends StatelessWidget {
  AsasScreen({super.key});

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
          nextRoute: 'alasas',
          title: 'asas'),
      body: AsasViewer(),
    );
  }
}
