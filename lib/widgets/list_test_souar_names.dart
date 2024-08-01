import 'dart:math';

import 'package:flutter/material.dart';

class ListTestSouarNames extends StatelessWidget {
  final souraName;
  const ListTestSouarNames({super.key, this.souraName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        key: UniqueKey(),
        leading: Container(
          height: 30,
          width: 30,
          decoration:
              BoxDecoration(color: Colors.blueAccent, shape: BoxShape.circle),
          child: Text("${souraName["souraNb"]} ",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white38)),
        ),
        title: Text(
          "${souraName["souraName"]}",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0)),
        ),
        trailing: Container(
          child: Icon(Icons.reorder),
        ));
  }
}
