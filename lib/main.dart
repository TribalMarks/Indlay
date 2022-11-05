// ignore_for_file: library_private_types_in_public_api, sort_child_properties_last, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:indlay/pages/buttons.dart';
import 'package:indlay/pages/colors.dart';
import 'package:indlay/pages/demo_page.dart';
import 'package:indlay/pages/dialogs.dart';
import 'package:indlay/pages/inspector.dart';
import 'package:indlay/pages/menus.dart';
import 'package:indlay/pages/tables.dart';
import 'package:indlay/pages/text_fields.dart';
import 'package:indlay/pages/toolbar.dart';
import 'package:stockholm/stockholm.dart';
import 'package:ionicons/ionicons.dart';
import 'package:indlay/pages/project_page.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:indlay/pages/blanck.dart';
import 'package:flutter_window_close/flutter_window_close.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';

enum _DemoPage {
  project,
  blanck,
  // buttons,
  // menus,
  // tables,
  // dialogs,
  // colors,
  // textFields,
  // propertyInspector,
}

enum _ThemeColor {
  blue,
  purple,
  pink,
  red,
  orange,
  yellow,
  green,
  gray,
}

Future<void> main() async {
  sqfliteFfiInit();

  var databaseFactory = databaseFactoryFfi;

  const _FIRST_OPEN = 'firstopen';

  final prefs = await SharedPreferences.getInstance();
  bool? appOpen = prefs.getBool(_FIRST_OPEN);

  var db = await databaseFactory.openDatabase('myProjects.db');
  var db2 = await databaseFactory.openDatabase('newProjects.db');
  var dbedit = await databaseFactory.openDatabase('newProjectsedit.db');

  runApp(StockholmDemoApp(
    openCondition: appOpen,
    database: db,
    database2: db2,
    databasedit: dbedit,
  ));
}

class StockholmDemoApp extends StatefulWidget {
  bool? openCondition;
  var database;
  var database2;
  var databasedit;
  StockholmDemoApp(
      {Key? key,
      required this.openCondition,
      this.database,
      this.database2,
      this.databasedit})
      : super(key: key);

  @override
  _StockholmDemoAppState createState() => _StockholmDemoAppState();

  static _StockholmDemoAppState of(BuildContext context) {
    return context.findAncestorStateOfType<_StockholmDemoAppState>()!;
  }
}

class _StockholmDemoAppState extends State<StockholmDemoApp> {
  bool _darkMode = false;
  _ThemeColor _themeColor = _ThemeColor.blue;

  bool get darkMode => _darkMode;
  int count = 0;

  var databaseAvail;

  checkDataBase() async {
    var result = await widget.database.query('myProjects');

    if (result.isEmpty) {
      setState(() {
        databaseAvail = true;
      });
    } else {
      setState(() {
        databaseAvail = false;
        count = result.length;
      });
    }
  }

  set darkMode(bool darkMode) {
    setState(() {
      _darkMode = darkMode;
    });
  }

  _ThemeColor get themeColor => _themeColor;

  set themeColor(_ThemeColor themeColor) {
    setState(() {
      _themeColor = themeColor;
    });
  }

  createMyDatabase() async {
    await widget.database.execute('''
    CREATE TABLE myProjects (
        id INTEGER PRIMARY KEY,
        title TEXT,
        name TEXT
    )
    ''');

    await widget.database2.execute('''
  CREATE TABLE myNewProjectsDemo (
      id INTEGER PRIMARY KEY,
      name TEXT,
      codename TEXT,
      source TEXT,
      comment TEXT,
      area INTEGER,
      quantity INTEGER
  )
  ''');

    await widget.databasedit.execute('''
  CREATE TABLE myNewProjectsEditsDemo (
      id INTEGER PRIMARY KEY,
      name TEXT,
      codename TEXT,
      color TEXT
  )
  ''');

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('firstopen', true);
  }

  @override
  void initState() {
    if (widget.openCondition == false) {
      createMyDatabase();
    } else {
      checkDataBase();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Industrial Layout',
      theme: _darkMode
          ? StockholmThemeData.dark(
              accentColor:
                  _themeColorToStockholmColor(_themeColor, Brightness.dark),
            )
          : StockholmThemeData.light(
              accentColor:
                  _themeColorToStockholmColor(_themeColor, Brightness.light),
            ),
      home: IndLayHomePage(
        openApp: widget.openCondition,
        availability: databaseAvail,
        database: widget.database,
        database2: widget.database2,
        databasedit: widget.databasedit,
      ),
    );
  }
}

class IndLayHomePage extends StatefulWidget {
  bool? openApp;
  var availability;
  var database;
  var database2;
  var databasedit;

  IndLayHomePage(
      {Key? key,
      required this.openApp,
      required this.availability,
      required this.database,
      required this.database2,
      required this.databasedit})
      : super(key: key);

  @override
  State<IndLayHomePage> createState() => _IndLayHomePageState();
}

class _IndLayHomePageState extends State<IndLayHomePage> {
  _DemoPage _selectedPage = _DemoPage.blanck;

  var _alertShowing = false;
  final _index = 0;

  String projectName = 'project';
  Map allProjectDetails = {'name': 'projectName'};

  getLatestProject() async {
    var dbLenght = await widget.database.query('myProjects');
    List<Map> latest = await widget.database
        .rawQuery('SELECT * FROM myProjects WHERE id =?', [(dbLenght.length)]);

    if (latest.isNotEmpty) {
      var data = latest.first;

      setState(() {
        projectName = data['name'];
        getProjectDetails(projectName);
      });
    }

    // latest.map((name) {
    //   setState(() {

    //   });
    // });
  }

  getProjectDetails(String name) async {
    List<Map> details = await widget.database2
        .rawQuery('SELECT * FROM myNewProjectsDemo WHERE name =?', [name]);

    if (details.isNotEmpty) {
      var data = details.first;

      setState(() {
        allProjectDetails = data;
      });
    }
  }

  @override
  void initState() {
    getLatestProject();
    FlutterWindowClose.setWindowShouldCloseHandler(() async {
      if (_index == 0) {
        if (_alertShowing) return false;
        _alertShowing = true;

        return await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: const Text('Do you really want to quit?'),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                          _alertShowing = false;
                        },
                        child: const Text('Yes')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                          _alertShowing = false;
                        },
                        child: const Text('No'))
                  ]);
            });
      } else if (_index == 1) {
        final result = await FlutterPlatformAlert.showCustomAlert(
          windowTitle: "Really?",
          text: "Do you really want to quit?",
          positiveButtonTitle: "Quit",
          negativeButtonTitle: "Cancel",
        );
        return result == CustomButton.positiveButton;
      } else if (_index == 3) {
        return await Future.delayed(const Duration(seconds: 1), () => true);
      }
      return true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget page;

    var appState = StockholmDemoApp.of(context);

    switch (_selectedPage) {
      case _DemoPage.project:
        page = ProjectPage(
          database: widget.database,
          database2: widget.database2,
          databasedit: widget.databasedit,
        );
        break;
      // case _DemoPage.buttons:
      //   page = const StockholmButtonDemoPage();
      //   break;
      // case _DemoPage.tables:
      //   page = const StockholmTableDemoPage();
      //   break;
      // case _DemoPage.menus:
      //   page = const StockholmMenuDemoPage();
      //   break;
      // case _DemoPage.dialogs:
      //   page = const StockholmDialogDemoPage();
      //   break;
      // case _DemoPage.toolbar:
      //   page = const StockholmToolbarDemoPage();
      //   break;
      // case _DemoPage.colors:
      //   page = const StockholmColorDemoPage();
      //   break;
      // case _DemoPage.textFields:
      //   page = const StockholmTextFieldDemoPage();
      //   break;
      // case _DemoPage.propertyInspector:
      //   page = const StockholmPropertyInspectorDemoPage();
      //   break;
      case _DemoPage.blanck:
        page = const BlanckPage();
        break;
    }

    // var colorOptionWidgets = <Widget>[];
    // for (var themeColor in _ThemeColor.values) {
    //   colorOptionWidgets.add(
    //     StockholmToolbarButton(
    //       icon: Ionicons.square,
    //       color: _themeColorToStockholmColor(
    //         themeColor,
    //         appState.darkMode ? Brightness.dark : Brightness.light,
    //       ),
    //       height: 22.0,
    //       minWidth: 0.0,
    //       iconSize: 14.0,
    //       padding: const EdgeInsets.symmetric(horizontal: 4),nvm
    //       selected: appState.themeColor == themeColor,
    //       onPressed: () {
    //         setState(() {
    //           appState.themeColor = themeColor;
    //         });
    //       },
    //     ),
    //   );
    // }

    return Scaffold(
        body: widget.availability == true
            ? Row(
                children: [
                  StockholmSideBar(
                    children: [
                      const StockholmListTileHeader(child: Text('New project')),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: StockholmButton(
                          onPressed: () {
                            setState(() {
                              _selectedPage = _DemoPage.project;
                            });
                          },
                          important: true,
                          child: const Text('Create'),
                          large: true,
                        ),
                      ),
                    ],
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
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      ToolbarDemo(
                        database: widget.database,
                        database2: widget.database2,
                        databasedit: widget.databasedit,
                        activateArrowBottons: false,
                      ),
                      Expanded(child: page)
                    ],
                  ))
                ],
              )
            : Row(
                children: [
                  StockholmSideBar(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Text('Project Name: ${allProjectDetails['name']}',
                                style: const TextStyle(
                                    fontFamily: "Varela",
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      )
                    ],
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
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      ToolbarDemo(
                          database: widget.database,
                          database2: widget.database2,
                          databasedit: widget.databasedit,
                          activateArrowBottons: false),
                      Expanded(child: page),
                    ],
                  )),
                  const Spacer(),
                  const MyPropertyInspector(),
                ],
              ));
  }
}

StockholmColor _themeColorToStockholmColor(
  _ThemeColor color,
  Brightness brightness,
) {
  var colors = StockholmColors.fromBrightness(brightness);

  switch (color) {
    case _ThemeColor.blue:
      return colors.blue;
    case _ThemeColor.purple:
      return colors.purple;
    case _ThemeColor.pink:
      return colors.pink;
    case _ThemeColor.red:
      return colors.red;
    case _ThemeColor.orange:
      return colors.orange;
    case _ThemeColor.yellow:
      return colors.yellow;
    case _ThemeColor.green:
      return colors.green;
    case _ThemeColor.gray:
      return colors.gray;
  }
}
