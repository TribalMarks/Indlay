import 'package:flutter/material.dart';
import 'package:stockholm/stockholm.dart';

class NewProject extends StatefulWidget {
  NewProject({Key? key}) : super(key: key);

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
                children: const [Text('Project Name:')],
              ),
            )
          ])
        ],
      ),
    );
  }
}
