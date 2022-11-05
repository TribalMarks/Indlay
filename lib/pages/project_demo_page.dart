// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:indlay/pages/project_page.dart';
import 'package:indlay/pages/toolbar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stockholm/stockholm.dart';

import '../main.dart';
import 'newproject.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class ProjectDemoPage extends StatefulWidget {
  var database;
  var database2;
  var databasedit;

  ProjectDemoPage(
      {Key? key,
      required this.database,
      required this.database2,
      required this.databasedit})
      : super(key: key);

  @override
  State<ProjectDemoPage> createState() => _ProjectDemoPageState();
}

class _ProjectDemoPageState extends State<ProjectDemoPage> {
  late TextEditingController nameController = TextEditingController();
  late TextEditingController sourceController = TextEditingController();
  late TextEditingController commentController = TextEditingController();

  int _intValueArea = 100;
  int _intValueQuantity = 4;

  String codeName = '';

  var databaseFactory = databaseFactoryFfi;

  createProject(String facilityName, String source, String comments, int area,
      int quantity) async {
    String facilityNameTrim =
        DateTime.now().millisecondsSinceEpoch.toString().trim();

    codeName = nameController.text.replaceAll(" ", "");

    await widget.database2.insert('myNewProjectsDemo', <String, Object?>{
      'name': facilityName,
      'codename': codeName,
      'source': source,
      'comment': comments,
      'area': area,
      'quantity': quantity
    });

    await widget.database.insert('myProjects',
        <String, Object?>{'title': facilityNameTrim, 'name': facilityName});

    var prjdb = await databaseFactory.openDatabase('$codeName.db');

    await prjdb.execute('''
  CREATE TABLE prjone (
      id INTEGER PRIMARY KEY,
      name TEXT,
      number INTEGER,
      height INTEGER,
      lenght INTEGER,
      color TEXT,
      relaone INTEGER,
      relatwo INTEGER,
      relathree INTEGER,
      relafour INTEGER
  )
  ''');

    await prjdb.execute('''
  CREATE TABLE prjtwo (
      id INTEGER PRIMARY KEY,
      name TEXT,
      number INTEGER,
      height INTEGER,
      lenght INTEGER,
      color TEXT,
      relaone INTEGER,
      relatwo INTEGER,
      relathree INTEGER,
      relafour INTEGER
  )
  ''');

    await prjdb.execute('''
  CREATE TABLE prjthree (
      id INTEGER PRIMARY KEY,
      name TEXT,
      number INTEGER,
      height INTEGER,
      lenght INTEGER,
      color TEXT,
      relaone INTEGER,
      relatwo INTEGER,
      relathree INTEGER,
      relafour INTEGER
  )
  ''');

    await prjdb.execute('''
  CREATE TABLE prjfour (
      id INTEGER PRIMARY KEY,
      name TEXT,
      number INTEGER,
      height INTEGER,
      lenght INTEGER,
      color TEXT,
      relaone INTEGER,
      relatwo INTEGER,
      relathree INTEGER,
      relafour INTEGER
  )
  ''');

    await prjdb.execute('''
  CREATE TABLE prjfive (
      id INTEGER PRIMARY KEY,
      name TEXT,
      number INTEGER,
      height INTEGER,
      lenght INTEGER,
      color TEXT,
      relaone INTEGER,
      relatwo INTEGER,
      relathree INTEGER,
      relafour INTEGER
  )
  ''');

    await prjdb.execute('''
  CREATE TABLE prjsix (
      id INTEGER PRIMARY KEY,
      name TEXT,
      number INTEGER,
      height INTEGER,
      lenght INTEGER,
      color TEXT,
      relaone INTEGER,
      relatwo INTEGER,
      relathree INTEGER,
      relafour INTEGER
  )
  ''');

    await prjdb.execute('''
  CREATE TABLE prjseven (
      id INTEGER PRIMARY KEY,
      name TEXT,
      number INTEGER,
      height INTEGER,
      lenght INTEGER,
      color TEXT,
      relaone INTEGER,
      relatwo INTEGER,
      relathree INTEGER,
      relafour INTEGER
  )
  ''');

    await prjdb.execute('''
  CREATE TABLE prjeight (
      id INTEGER PRIMARY KEY,
      name TEXT,
      number INTEGER,
      height INTEGER,
      lenght INTEGER,
      color TEXT,
      relaone INTEGER,
      relatwo INTEGER,
      relathree INTEGER,
      relafour INTEGER
  )
  ''');

    await prjdb.execute('''
  CREATE TABLE prjnine (
      id INTEGER PRIMARY KEY,
      name TEXT,
      number INTEGER,
      height INTEGER,
      lenght INTEGER,
      color TEXT,
      relaone INTEGER,
      relatwo INTEGER,
      relathree INTEGER,
      relafour INTEGER
  )
  ''');

    await prjdb.execute('''
  CREATE TABLE prjten (
      id INTEGER PRIMARY KEY,
      name TEXT,
      number INTEGER,
      height INTEGER,
      lenght INTEGER,
      color TEXT,
      relaone INTEGER,
      relatwo INTEGER,
      relathree INTEGER,
      relafour INTEGER
  )
  ''');

    await prjdb.execute('''
  CREATE TABLE prjeleven (
      id INTEGER PRIMARY KEY,
      name TEXT,
      number INTEGER,
      height INTEGER,
      lenght INTEGER,
      color TEXT,
      relaone INTEGER,
      relatwo INTEGER,
      relathree INTEGER,
      relafour INTEGER
  )
  ''');

    await prjdb.execute('''
  CREATE TABLE prjtwelve (
      id INTEGER PRIMARY KEY,
      name TEXT,
      number INTEGER,
      height INTEGER,
      lenght INTEGER,
      color TEXT,
      relaone INTEGER,
      relatwo INTEGER,
      relathree INTEGER,
      relafour INTEGER
  )
  ''');

    await prjdb.execute('''
  CREATE TABLE prjthirteen (
      id INTEGER PRIMARY KEY,
      name TEXT,
      number INTEGER,
      height INTEGER,
      lenght INTEGER,
      color TEXT,
      relaone INTEGER,
      relatwo INTEGER,
      relathree INTEGER,
      relafour INTEGER
  )
  ''');

    await prjdb.execute('''
  CREATE TABLE prjfourteen (
      id INTEGER PRIMARY KEY,
      name TEXT,
      number INTEGER,
      height INTEGER,
      lenght INTEGER,
      color TEXT,
      relaone INTEGER,
      relatwo INTEGER,
      relathree INTEGER,
      relafour INTEGER
  )
  ''');

    await prjdb.execute('''
  CREATE TABLE prjfifteen (
      id INTEGER PRIMARY KEY,
      name TEXT,
      number INTEGER,
      height INTEGER,
      lenght INTEGER,
      color TEXT,
      relaone INTEGER,
      relatwo INTEGER,
      relathree INTEGER,
      relafour INTEGER
  )
  ''');

    await prjdb.execute('''
  CREATE TABLE prjsixteen (
      id INTEGER PRIMARY KEY,
      name TEXT,
      number INTEGER,
      height INTEGER,
      lenght INTEGER,
      color TEXT,
      relaone INTEGER,
      relatwo INTEGER,
      relathree INTEGER,
      relafour INTEGER
  )
  ''');

    await prjdb.execute('''
  CREATE TABLE prjseventeen (
      id INTEGER PRIMARY KEY,
      name TEXT,
      number INTEGER,
      height INTEGER,
      lenght INTEGER,
      color TEXT,
      relaone INTEGER,
      relatwo INTEGER,
      relathree INTEGER,
      relafour INTEGER
  )
  ''');

    await prjdb.execute('''
  CREATE TABLE prjeighteen (
      id INTEGER PRIMARY KEY,
      name TEXT,
      number INTEGER,
      height INTEGER,
      lenght INTEGER,
      color TEXT,
      relaone INTEGER,
      relatwo INTEGER,
      relathree INTEGER,
      relafour INTEGER
  )
  ''');

    await prjdb.execute('''
  CREATE TABLE prjnineteen (
      id INTEGER PRIMARY KEY,
      name TEXT,
      number INTEGER,
      height INTEGER,
      lenght INTEGER,
      color TEXT,
      relaone INTEGER,
      relatwo INTEGER,
      relathree INTEGER,
      relafour INTEGER
  )
  ''');

    await prjdb.execute('''
  CREATE TABLE prjtwenty (
      id INTEGER PRIMARY KEY,
      name TEXT,
      number INTEGER,
      height INTEGER,
      lenght INTEGER,
      color TEXT,
      relaone INTEGER,
      relatwo INTEGER,
      relathree INTEGER,
      relafour INTEGER
  )
  ''');

    await prjdb.insert('prjone', <String, Object?>{
      'name': '1',
      'number': 1,
      'height': 30,
      'lenght': 30,
      'color': 'x0ff546789',
      'relaone': 0,
      'relatwo': 0,
      'relathree': 0,
      'relafour': 0,
    });

    await prjdb.insert('prjtwo', <String, Object?>{
      'name': '2',
      'number': 2,
      'height': 30,
      'lenght': 30,
      'color': 'x0ff546789',
      'relaone': 0,
      'relatwo': 0,
      'relathree': 0,
      'relafour': 0,
    });

    await prjdb.insert('prjthree', <String, Object?>{
      'name': '3',
      'number': 3,
      'height': 30,
      'lenght': 30,
      'color': 'x0ff546789',
      'relaone': 0,
      'relatwo': 0,
      'relathree': 0,
      'relafour': 0,
    });

    await prjdb.insert('prjfour', <String, Object?>{
      'name': '4',
      'number': 4,
      'height': 30,
      'lenght': 30,
      'color': 'x0ff546789',
      'relaone': 0,
      'relatwo': 0,
      'relathree': 0,
      'relafour': 0,
    });

    await prjdb.insert('prjfive', <String, Object?>{
      'name': '5',
      'number': 5,
      'height': 30,
      'lenght': 30,
      'color': 'x0ff546789',
      'relaone': 0,
      'relatwo': 0,
      'relathree': 0,
      'relafour': 0,
    });

    await prjdb.insert('prjsix', <String, Object?>{
      'name': '6',
      'number': 6,
      'height': 30,
      'lenght': 30,
      'color': 'x0ff546789',
      'relaone': 0,
      'relatwo': 0,
      'relathree': 0,
      'relafour': 0,
    });

    await prjdb.insert('prjseven', <String, Object?>{
      'name': '7',
      'number': 7,
      'height': 30,
      'lenght': 30,
      'color': 'x0ff546789',
      'relaone': 0,
      'relatwo': 0,
      'relathree': 0,
      'relafour': 0,
    });

    await prjdb.insert('prjeight', <String, Object?>{
      'name': '8',
      'number': 8,
      'height': 30,
      'lenght': 30,
      'color': 'x0ff546789',
      'relaone': 0,
      'relatwo': 0,
      'relathree': 0,
      'relafour': 0,
    });

    await prjdb.insert('prjnine', <String, Object?>{
      'name': '9',
      'number': 9,
      'height': 30,
      'lenght': 30,
      'color': 'x0ff546789',
      'relaone': 0,
      'relatwo': 0,
      'relathree': 0,
      'relafour': 0,
    });

    await prjdb.insert('prjten', <String, Object?>{
      'name': '10',
      'number': 10,
      'height': 30,
      'lenght': 30,
      'color': 'x0ff546789',
      'relaone': 0,
      'relatwo': 0,
      'relathree': 0,
      'relafour': 0,
    });

    await prjdb.insert('prjeleven', <String, Object?>{
      'name': '11',
      'number': 11,
      'height': 30,
      'lenght': 30,
      'color': 'x0ff546789',
      'relaone': 0,
      'relatwo': 0,
      'relathree': 0,
      'relafour': 0,
    });

    await prjdb.insert('prjtwelve', <String, Object?>{
      'name': '12',
      'number': 12,
      'height': 30,
      'lenght': 30,
      'color': 'x0ff546789',
      'relaone': 0,
      'relatwo': 0,
      'relathree': 0,
      'relafour': 0,
    });

    await prjdb.insert('prjthirteen', <String, Object?>{
      'name': '13',
      'number': 13,
      'height': 30,
      'lenght': 30,
      'color': 'x0ff546789',
      'relaone': 0,
      'relatwo': 0,
      'relathree': 0,
      'relafour': 0,
    });

    await prjdb.insert('prjfourteen', <String, Object?>{
      'name': '14',
      'number': 14,
      'height': 30,
      'lenght': 30,
      'color': 'x0ff546789',
      'relaone': 0,
      'relatwo': 0,
      'relathree': 0,
      'relafour': 0,
    });

    await prjdb.insert('prjfifteen', <String, Object?>{
      'name': '15',
      'number': 15,
      'height': 30,
      'lenght': 30,
      'color': 'x0ff546789',
      'relaone': 0,
      'relatwo': 0,
      'relathree': 0,
      'relafour': 0,
    });

    await prjdb.insert('prjsixteen', <String, Object?>{
      'name': '16',
      'number': 16,
      'height': 30,
      'lenght': 30,
      'color': 'x0ff546789',
      'relaone': 0,
      'relatwo': 0,
      'relathree': 0,
      'relafour': 0,
    });

    await prjdb.insert('prjseventeen', <String, Object?>{
      'name': '17',
      'number': 17,
      'height': 30,
      'lenght': 30,
      'color': 'x0ff546789',
      'relaone': 0,
      'relatwo': 0,
      'relathree': 0,
      'relafour': 0,
    });

    await prjdb.insert('prjeighteen', <String, Object?>{
      'name': '18',
      'number': 18,
      'height': 30,
      'lenght': 30,
      'color': 'x0ff546789',
      'relaone': 0,
      'relatwo': 0,
      'relathree': 0,
      'relafour': 0,
    });

    await prjdb.insert('prjnineteen', <String, Object?>{
      'name': '19',
      'number': 19,
      'height': 30,
      'lenght': 30,
      'color': 'x0ff546789',
      'relaone': 0,
      'relatwo': 0,
      'relathree': 0,
      'relafour': 0,
    });

    await prjdb.insert('prjtwenty', <String, Object?>{
      'name': '20',
      'number': 20,
      'height': 30,
      'lenght': 30,
      'color': 'x0ff546789',
      'relaone': 0,
      'relatwo': 0,
      'relathree': 0,
      'relafour': 0,
    });

    //      await prjdb.execute('''
    // CREATE TABLE ralationships (
    //     id INTEGER PRIMARY KEY,
    //     name TEXT,
    //     height INTEGER,
    //     lenght INTEGER,
    //     color TEXT,
    //     relaone INTEGER,
    //     relatwo INTEGER,
    //     relathree INTEGER,
    //     relafour INTEGER
    // )
    // ''');

    // await widget.database2.close();
    // await widget.databasedit.close();
    // await widget.database.close();

    // ignore: use_build_context_synchronously
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewProject(
                database: widget.database,
                database2: widget.database2,
                databasedit: widget.databasedit,
                name: nameController.text.trim())));
  }

  @override
  Widget build(BuildContext context) {
    var appState = StockholmDemoApp.of(context);

    return Scaffold(
        body: Row(
      children: [
        StockholmSideBar(
          footer: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StockholmToolbarButton(
                  height: 22,
                  icon: appState.darkMode
                      ? Ionicons.moon_outline
                      : Ionicons.sunny_outline,
                  onPressed: () {
                    setState(() {
                      appState.darkMode = !appState.darkMode;
                    });
                  },
                ),
                // const Spacer(),
                // ...colorOptionWidgets,
              ],
            ),
          ),
          children: [
            const StockholmListTileHeader(child: Text('New project')),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: StockholmButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProjectPage(
                                  database: widget.database,
                                  database2: widget.database2,
                                  databasedit: widget.databasedit,
                                )));
                  });
                },
                important: true,
                large: true,
                child: const Text('Create'),
              ),
            ),
          ],
        ),
        Expanded(
            child: Column(
          children: [
            ToolbarDemo(
              database: widget.database,
              database2: widget.database2,
              databasedit: widget.databasedit,
              activateArrowBottons: true,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      const Text('Facility Name',
                          style: TextStyle(
                              fontFamily: "Varela",
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 250,
                        child: StockholmTextField(
                          autofocus: true,
                          controller: nameController,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text('Source',
                          style: TextStyle(
                              fontFamily: "Varela",
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 200,
                        child: StockholmTextField(
                          autofocus: true,
                          controller: sourceController,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text('Comments',
                          style: TextStyle(
                              fontFamily: "Varela",
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 400,
                        height: 160,
                        child: StockholmTextField(
                          controller: commentController,
                          autofocus: true,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const StockholmPIDivider(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 200,
                        child: StockholmPIEditableIntProp(
                          name: 'Area of Departments',
                          value: _intValueArea,
                          nameAlignment: TextAlign.start,
                          onChanged: (value) {
                            setState(() {
                              _intValueArea = value;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 200,
                        child: StockholmPIEditableIntProp(
                          name: 'Number of Departments',
                          value: _intValueQuantity,
                          onChanged: (value) {
                            setState(() {
                              _intValueQuantity = value;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 400, right: 400),
                    child: StockholmButton(
                        onPressed: () {
                          if (nameController.text.isEmpty) {
                            showStockholmConfirmationDialog(
                              context: context,
                              onSelection: (result) {
                                // Handle the results here.
                                // True if user clicked primary option (OK).
                              },
                              title: const Text('No Name Dialog'),
                              contents: const Text('Enter Facility Name'),
                            );
                          } else if (_intValueArea == 0) {
                            showStockholmConfirmationDialog(
                              context: context,
                              onSelection: (result) {
                                // Handle the results here.
                                // True if user clicked primary option (OK).
                              },
                              title: const Text('No Area Dialog'),
                              contents: const Text('Enter Facility Area?'),
                            );
                          } else if (_intValueQuantity == 0) {
                            showStockholmConfirmationDialog(
                              context: context,
                              onSelection: (result) {
                                // Handle the results here.
                                // True if user clicked primary option (OK).
                              },
                              title: const Text('No Department size'),
                              contents:
                                  const Text('Enter Number of Departments'),
                            );
                          } else if (_intValueQuantity < 4 ||
                              _intValueQuantity > 20) {
                            showStockholmConfirmationDialog(
                              context: context,
                              onSelection: (result) {
                                // Handle the results here.
                                // True if user clicked primary option (OK).
                              },
                              title: const Text('No Department size'),
                              contents:
                                  const Text('Enter Number of Departments'),
                            );
                          } else {
                            createProject(
                                nameController.text.trim(),
                                sourceController.text.trim(),
                                commentController.text.trim(),
                                _intValueArea,
                                _intValueQuantity);
                          }
                        },
                        important: true,
                        large: true,
                        child: const Text('GO')),
                  ),
                ],
              ),
            ))
          ],
        ))
      ],
    ));
  }
}
