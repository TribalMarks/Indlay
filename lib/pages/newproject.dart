import 'package:flutter/material.dart';
import 'package:indlay/pages/toolbar.dart';
import 'package:stockholm/stockholm.dart';

import 'inspector.dart';

// ignore: must_be_immutable
class NewProject extends StatefulWidget {
  var database;
  var database2;
  var databasedit;

  NewProject(
      {Key? key,
      required this.database,
      required this.database2,
      required this.databasedit})
      : super(key: key);

  @override
  State<NewProject> createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          StockholmSideBar(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: const [
                  SizedBox(
                    height: 30,
                  ),
                  Text('Project Name:',
                      style: TextStyle(
                          fontFamily: "Varela",
                          fontSize: 15,
                          fontWeight: FontWeight.bold))
                ],
              ),
            )
          ]),
          Expanded(
              child: Column(
            children: [
              ToolbarDemo(
                database: widget.database,
                database2: widget.database2,
                databasedit: widget.databasedit,
                activateArrowBottons: false,
              ),
              Expanded(child: Container())
            ],
          )),
          Spacer(),
          MyPropertyInspector(),
        ],
      ),
    );
  }
}
