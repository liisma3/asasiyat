import 'package:asasiyat/views/stage_viewer.dart';
import 'package:asasiyat/widgets/soura_navbar.dart';
import 'package:asasiyat/widgets/stage_asasiyat_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StageScreen extends StatelessWidget {
  StageScreen({super.key});
  final GlobalKey scaffoldKey = GlobalKey();
  final int souraNb = int.parse(Get.parameters['souraNb']!);


  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
   
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        child: SouraNavbar(souraNb: souraNb,),
        preferredSize: Size.fromHeight(110),
      ),
      body: StageViewer(souraNb: souraNb),
    );
  }
}
