import 'dart:math';

import 'package:asasiyat/constants/data_helper.dart';
import 'package:flutter/material.dart';

class AlAsasPagesViewer extends StatefulWidget {
  const AlAsasPagesViewer({Key? key}) : super(key: key);

  @override
  State<AlAsasPagesViewer> createState() => _AlAsasPagesViewerState();
}

class _AlAsasPagesViewerState extends State<AlAsasPagesViewer> {
  var categories = ["TIWAL", "MIIN", "MATHANI", "MOFASAL"];

  var category = "";
  var souraNbSelected = -1;
  var _souraAlAsasList = DataHelper.tiwal;
  //late int alAsasListLength = _souraAlAsasList.length;
  late List _shuffeledSoura;

  bool test = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    category = categories[0];
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    /*  List<Widget> _al_asas_views = [
      Center(child: AlAsasViewerOrdered(souraAlAsasList: _souraAlAsasList)),
      //Center(child: AlAsasViewerShuffeled(shuffeledSoura: _shuffeledSoura)),
    ]; */
    PageController controller = PageController();

    int currentPage = 0;
    return Scaffold(
        /*   resizeToAvoidBottomPadding: false, */
        backgroundColor: Colors.white.withOpacity(.2),
        appBar: AppBar(
          title: Text('al asas :  order souras '),
        ),
        body: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton(
                items: categories.map((String catItem) {
                  return DropdownMenuItem<String>(
                      child: Text("$catItem"), value: catItem);
                }).toList(),
                onChanged: (value) => {
                  categoryItemSelected(value!),
                },
                value: category,
              ),
              /*  DropdownButton(
                items: DataHelper.CategoryLabel[category]
                    .map((Map<String, dynamic> souraItem) {
                  return DropdownMenuItem<String>(
                      child: Text("$souraItem['souraName']"),
                      value: souraItem['souraNb']);
                }).toList(),
                onChanged: (value) => souraItemSelected(souraNb: 0),
                value: souraNbSelected.toString(),
              ), */
              Text('Hide Numbers'),
              Switch(
                onChanged: (value) {
                  setState(() {
                    test = !test;
                  });
                  shuffleSoura();
                },
                value: test,
                activeColor: Colors.greenAccent.shade200,
              )
            ],
          ),
          /* PageView(
            controller: controller,
            children: _al_asas_views,
            onPageChanged: (currentPage) {
              setState(() {
                currentPage = currentPage;
              });
            }, */
        ]));
  }

  void categoryItemSelected(String catItemSelected) {
    setState(() {
      category = catItemSelected;
    });
  }

  void souraItemSelected({int souraNb = 0}) {
    setState(() {
      souraNbSelected = souraNb;
    });
  }

  void shuffleSoura() {
    var random = new Random();
    for (var soura in _souraAlAsasList) {
      print("${soura["souraName"]} : ${soura["souraNb"]}");
    }
    List _shuffled = new List<Map<String, Object>>.from(_souraAlAsasList);
    // Go through all elements.
    for (var i = _souraAlAsasList.length - 1; i > 0; i--) {
      // Pick a pseudorandom number according to the list length
      var n = random.nextInt(i + 1);

      var temp = _shuffled[i];
      _shuffled[i] = _shuffled[n];
      _shuffled[n] = temp;
    }
    setState(() {
      _shuffeledSoura = _shuffled;
    });
  }
}
