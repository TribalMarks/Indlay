import 'package:flutter/material.dart';
import 'package:indlay/pages/toolbar.dart';
import 'package:stockholm/stockholm.dart';
import 'package:indlay/pages/newproject.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class ProjectPage extends StatefulWidget {
  var database;
  var database2;
  var databasedit;
  ProjectPage(
      {Key? key,
      required this.database,
      required this.database2,
      required this.databasedit})
      : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  late TextEditingController nameController = TextEditingController();
  late TextEditingController sourceController = TextEditingController();
  late TextEditingController commentController = TextEditingController();

  int _intValueArea = 100;
  int _intValueQuantity = 4;

  String codeName = '';

  createProject(String facilityName, String source, String comments, int area,
      int quantity) async {
    String facilityCodeTitle =
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
        <String, Object?>{'title': facilityCodeTitle, 'name': facilityName});

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
                  name: nameController.text.trim(),
                )));
  }

  @override
  void dispose() {
    nameController.dispose();
    sourceController.dispose();
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                        contents: const Text('Enter Number of Departments'),
                      );
                    } else if (_intValueQuantity < 4 ||
                        _intValueQuantity > 20) {
                      showStockholmConfirmationDialog(
                        context: context,
                        onSelection: (result) {
                          // Handle the results here.
                          // True if user clicked primary option (OK).
                        },
                        title: const Text('Department size Error'),
                        contents: const Text(
                            'Number of Departments should be less than 20'),
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
      ),
    );
  }
}
