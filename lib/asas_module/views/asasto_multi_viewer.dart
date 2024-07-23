import 'dart:convert';
import 'dart:math';

import 'package:asasiyat/constants/data_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// DropdownMenuEntry labels and values for the first dropdown menu.

// DropdownMenuEntry labels and values for the second dropdown menu.

class AsastoMultiViewer extends StatefulWidget {
  const AsastoMultiViewer({super.key});

  @override
  State<AsastoMultiViewer> createState() => _AsastoMultiViewer();
}

class _AsastoMultiViewer extends State<AsastoMultiViewer> {
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController souraController = TextEditingController();
  final List<String> categories = [
    ...DataHelper.CategoryLabel.keys.toList(growable: false)
  ];

  var category = "TIWAL";
  var _souraSelectedNb = "-1";

  List<Map<String, dynamic>> _souraAlAsasList =
      DataHelper.CategoryLabel["TIWAL"]!.toList();
  var _souraDropDown = [];
  var _souraGridSelected;
  //late int alAsasListLength = _souraAlAsasList.length;
  var _shuffeledSoura = [];
  var souraData;
  bool test = false;
  bool isCategorySelected = false;
  bool isSouraSelected = false;
  Future<String>? loadData(int souraNb) async {
    debugPrint("$souraNb");
    try {
      var data = await rootBundle.loadString("shares/grids/$souraNb.json");
      debugPrint(data);
      setState(() {
        souraData = json.decode(data);
      });
      return "success";
    } catch (e) {
      showBottomSheet(
        context: context,
        builder: (context) => Text("Soura doesnt exists"),
      );
      debugPrint("error: $e");
      throw e;
    }
  }

  Future getsourasCat(String cat) async {
    setState(() {
      _souraAlAsasList = DataHelper.CategoryLabel[cat]!.toList();
    });

    print(_souraAlAsasList);
  }

  @override
  void initState() {
    // TODO: implement initState
    if (_souraSelectedNb != "-1") {
      // this.loadData();
      category = categories[0];
      getsourasCat(category);
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("asasto try to order grids"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.home_mini_outlined),
              tooltip: 'return to App',
              onPressed: () {
                Get.offAllNamed('/asas');
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    if (categories.isEmpty)
                      const Center(child: CircularProgressIndicator())
                    else
                      Expanded(
                        child: Card(
                            color: Colors.green.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              // Provide a specific height constraint
                              padding: const EdgeInsets.all(15.0),

                              child: DropdownButton<String>(
                                  underline: Container(),
                                  hint: Text("Select category"),
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  isDense: true,
                                  isExpanded: true,
                                  items: categories.map((cat) {
                                    return DropdownMenuItem<String>(
                                      value: cat,
                                      child: Text(cat),
                                    );
                                  }).toList(),
                                  value: category,
                                  onChanged: (value) {
                                    setState(() {
                                      _souraAlAsasList = [];
                                      category = value!;
                                      _souraAlAsasList = DataHelper
                                          .CategoryLabel[value]!
                                          .toList();

                                      isCategorySelected = true;
                                    });
                                  }),
                            )),
                      ),
                    // ignore: unnecessary_null_comparison

                    // SOURA DROPDOWN
                    Expanded(
                      child: Card(
                        color: Colors.greenAccent.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          child: DropdownButton<String>(
                              underline: Container(),
                              hint: Text("Select Soura"),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              isDense: true,
                              isExpanded: true,
                              items: [
                                ..._souraAlAsasList.map((st) {
                                  return DropdownMenuItem<String>(
                                      value: "${st['souraNb']}",
                                      child: Text(
                                          "${st["souraName"]}-${st['souraNb']}"));
                                }).toList()
                              ],
                              value: _souraAlAsasList[0]["souraNb"].toString(),
                              onChanged: (value) {
                                setState(() {
                                  _souraSelectedNb = value!;
                                  _souraGridSelected =
                                      loadData(int.parse(value));

                                  isSouraSelected = true;
                                });
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              (_souraSelectedNb != '-1' && category != "")
                  ? Text('You selected a ${_souraSelectedNb} ${category}')
                  : Text('Please soura .')
            ],
          ),
        ),
      ),
    );
  }

  categoryItemSelected(String catItemSelected) {
    setState(() {
      category = catItemSelected;
    });
  }

  souraItemSelected(int souraNb) {
    setState(() {
      souraNb = souraNb;
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
