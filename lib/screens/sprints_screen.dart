//import 'package:asas/sprint-module/sprints_viewer.dart';
import 'package:flutter/material.dart';

class SprintsView extends StatelessWidget {
  const SprintsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('asasto '),
          backgroundColor: Colors.greenAccent.shade100,
          actions: [const Icon(Icons.bakery_dining)],
          elevation: 10,
        ),
        body: Center(
          child: Asasto(),
        ));
  }
}

class Asasto extends StatefulWidget {
  const Asasto({super.key});

  @override
  State<Asasto> createState() => _AsastoState();
}

class _AsastoState extends State<Asasto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stages validated '),
        backgroundColor: Colors.greenAccent.shade100,
        actions: [const Icon(Icons.bakery_dining)],
        elevation: 10,
      ),
      body: Text('//SprintsViewer('),
      //AsastoListViewBuilder()
      //  DropdownMenuExample(),
    );
  }
}
