/* import 'package:asas/asas_module/controllers/asas_controller.dart'; */
import 'package:asasiyat/controllers/asas_controller.dart';
import 'package:asasiyat/widgets/asasiyat-drawer.dart';
import 'package:asasiyat/widgets/bottom_navigation.dart';
import 'package:asasiyat/widgets/top_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:google_fonts/google_fonts.dart';

class AppScreen extends StatelessWidget {
  AppScreen({super.key});
  final GlobalKey scaffoldKey = GlobalKey();
  /* final titleStyle = GoogleFonts.montserrat(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: Colors.green.shade700,
  ); */
  AsasController c = Get.find(tag: 'asasInstance');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: topNavigationBar(context, scaffoldKey),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          margin: EdgeInsets.only(top: 150),
          padding: EdgeInsets.fromLTRB(5, 50, 5, 5),
          width: 500,
          height: 400,
          alignment: Alignment.topCenter,
          child: Text(
            "Asas app by toutafait".toUpperCase(),
            style: TextStyle(
              fontSize: 25,
              color: Colors.yellow,
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.blue.shade300,
              //shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: Colors.yellow,
              ),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(150)),
              image: new DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.dstATop),
                image: new AssetImage("assets/liismLogo.png"),
                fit: BoxFit.fitWidth,
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.green.shade100,
                    offset: Offset(10, 10),
                    blurRadius: 30),
                BoxShadow(
                    color: Colors.greenAccent.shade700,
                    offset: Offset(-10, -10),
                    blurRadius: 60),
              ]),
        ),
        BottomNavigation(),
      ]),
      drawer: asasdrawer(context: scaffoldKey),
    );
  }
}
