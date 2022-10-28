// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:indlay/pages/project_page.dart';
import 'package:indlay/pages/toolbar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stockholm/stockholm.dart';

import '../main.dart';
import 'newproject.dart';

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

  createProject(String facilityName, String source, String comments, int area,
      int quantity) async {
    String facilityNameTrim =
        DateTime.now().millisecondsSinceEpoch.toString().trim();

    await widget.database2.insert('myNewProjects', <String, Object?>{
      'name': facilityName,
      'source': source,
      'comment': comments,
      'area': area,
      'quantity': quantity
    });

    await widget.database.insert('myProjects',
        <String, Object?>{'title': facilityNameTrim, 'name': facilityName});

    await widget.database2.close();
    await widget.databasedit.close();
    await widget.database.close();

    // ignore: use_build_context_synchronously
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewProject(
                  database: widget.database,
                  database2: widget.database2,
                  databasedit: widget.databasedit,
                )));
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