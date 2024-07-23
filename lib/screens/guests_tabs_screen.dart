import 'package:asasiyat/widgets/asasiyat-drawer.dart';
import 'package:asasiyat/widgets/bottom_navigation.dart';
import 'package:asasiyat/widgets/top_navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GuestsTabsViewer extends StatefulWidget {
  GuestsTabsViewer({Key? key}) : super(key: key);
  GlobalKey scaffoldKey = GlobalKey();
  @override
  State<GuestsTabsViewer> createState() => _GuestsTabsViewerState();
}

class _GuestsTabsViewerState extends State<GuestsTabsViewer> {
  bool isLoading = true;
  late List<dynamic> guests = [];

  void getGuests() async {
    try {
      var db = FirebaseFirestore.instance;
      // FirebaseFirestore _firestore = await FirebaseFirestore.instance
      print(db);
      db.collection("guests").get().then(
        (querySnapshot) {
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs) {
            guests.add(docSnapshot.data());
            print('${docSnapshot.id} => ${docSnapshot.data()}');
          }
        },
        onError: (e) => print("Error completing: $e"),
      );
      // final _allguests = db.collection("guests");
      //   debugPrint("$guests");

      // final String response = await rootBundle.loadString('shares/guests.json');
      // final _guests = await json.decode(response);
      //    debugPrint("$response");
      isLoading = false;
      setState(() {});
    } catch (e) {
      debugPrint("$e");
      isLoading = false;
      setState(() {});
      //throw e;
    }
  }

  // TODO: implement initState
  @override
  void initState() {
    super.initState();
    //getGuests();
  }

  bool test = false;

  @override
  Widget build(
    BuildContext context,
  ) {
    //getGuests();

    return Scaffold(
      key: widget.scaffoldKey,
      appBar: topNavigationBar(context, widget.scaffoldKey),
      body: Column(children: [
        ElevatedButton(
          child: Text("guests"),
          onPressed: () {
            print('guest');
            getGuests();
          },
        ),
        Expanded(
          child: ListView.builder(
              itemCount: guests.length,
              itemBuilder: (context, index) {
                debugPrint(guests[index]["tokenId"]);
                return Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: ListTile(
                        title: GestureDetector(
                            onTap: () {
                              debugPrint(guests[index]["tokenId"]);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${guests[index]["tokenId"]}"),
                                // Text("${_souraAlAsasList[index]["souraNb"]}"),
                              ],
                            ))));
              }),
        ),
        BottomNavigation(),
      ]),
      drawer: asasdrawer(context: widget.scaffoldKey),
    );
  }
}
      /**  Expanded(
        child: ListView.builder(
            itemCount: guests.length,
            itemBuilder: (context, index) {
              debugPrint(guests[index]["tokenId"]);
              return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: ListTile(
                      title: GestureDetector(
                          onTap: () {
                            debugPrint(guests[index]["tokenId"]);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${guests[index]["tokenId"]}"),
                              // Text("${_souraAlAsasList[index]["souraNb"]}"),
                            ],
                          ))));
            }),
      )*/
    
        /**
         * 
         * 
         * */

