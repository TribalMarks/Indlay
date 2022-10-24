// ignore_for_file: library_private_types_in_public_api, sort_child_properties_last

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

enum _DemoPage {
  project,
  blanck,
  buttons,
  menus,
  tables,
  dialogs,
  toolbar,
  colors,
  textFields,
  propertyInspector,
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

  runApp(StockholmDemoApp(
    openCondition: appOpen,
    database: db,
  ));
}

class StockholmDemoApp extends StatefulWidget {
  bool? openCondition;
  var database;
  StockholmDemoApp({Key? key, required this.openCondition, this.database})
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

  var databaseAvail;

  checkDataBase() async {
    var result = await widget.database.query('Projects');
    if (result != '') {
      setState(() {
        databaseAvail = true;
      });
    } else {
      setState(() {
        databaseAvail = false;
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
  CREATE TABLE Projects (
      id INTEGER PRIMARY KEY,
      title TEXT
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
      ),
    );
  }
}

class IndLayHomePage extends StatefulWidget {
  bool? openApp;
  var availability;

  IndLayHomePage({Key? key, required this.openApp, required this.availability})
      : super(key: key);

  @override
  State<IndLayHomePage> createState() => _IndLayHomePageState();
}

class _IndLayHomePageState extends State<IndLayHomePage> {
  _DemoPage _selectedPage = _DemoPage.blanck;

  @override
  Widget build(BuildContext context) {
    Widget page;

    var appState = StockholmDemoApp.of(context);

    switch (_selectedPage) {
      case _DemoPage.project:
        page = const ProjectPage();
        break;
      case _DemoPage.buttons:
        page = const StockholmButtonDemoPage();
        break;
      case _DemoPage.tables:
        page = const StockholmTableDemoPage();
        break;
      case _DemoPage.menus:
        page = const StockholmMenuDemoPage();
        break;
      case _DemoPage.dialogs:
        page = const StockholmDialogDemoPage();
        break;
      case _DemoPage.toolbar:
        page = const StockholmToolbarDemoPage();
        break;
      case _DemoPage.colors:
        page = const StockholmColorDemoPage();
        break;
      case _DemoPage.textFields:
        page = const StockholmTextFieldDemoPage();
        break;
      case _DemoPage.propertyInspector:
        page = const StockholmPropertyInspectorDemoPage();
        break;
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
                    children: [const ToolbarDemo(), Expanded(child: page)],
                  ))
                ],
              )
            : Row(
                children: [
                  StockholmSideBar(
                    children: [
                      const StockholmListTileHeader(child: Text('Controls')),
                      StockholmListTile(
                        leading: const Icon(Ionicons.toggle_outline),
                        child: const Text('Buttons'),
                        selected: _selectedPage == _DemoPage.buttons,
                        onPressed: () {
                          setState(() {
                            _selectedPage = _DemoPage.buttons;
                          });
                        },
                      ),
                      StockholmListTile(
                        leading: const Icon(Ionicons.reader_outline),
                        child: const Text('Menus'),
                        selected: _selectedPage == _DemoPage.menus,
                        onPressed: () {
                          setState(() {
                            _selectedPage = _DemoPage.menus;
                          });
                        },
                      ),
                      StockholmListTile(
                        leading: const Icon(Ionicons.text),
                        child: const Text('Text fields'),
                        selected: _selectedPage == _DemoPage.textFields,
                        onPressed: () {
                          setState(() {
                            _selectedPage = _DemoPage.textFields;
                          });
                        },
                      ),
                      const StockholmListTileHeader(child: Text('Layouts')),
                      StockholmListTile(
                        leading: const Icon(Ionicons.browsers_outline),
                        child: const Text('Tables'),
                        selected: _selectedPage == _DemoPage.tables,
                        onPressed: () {
                          setState(() {
                            _selectedPage = _DemoPage.tables;
                          });
                        },
                      ),
                      StockholmListTile(
                        leading: const Icon(Ionicons.chatbubble_outline),
                        child: const Text('Dialogs'),
                        selected: _selectedPage == _DemoPage.dialogs,
                        onPressed: () {
                          setState(() {
                            _selectedPage = _DemoPage.dialogs;
                          });
                        },
                      ),
                      StockholmListTile(
                        leading: const Icon(Ionicons.build_outline),
                        child: const Text('Toolbars'),
                        selected: _selectedPage == _DemoPage.toolbar,
                        onPressed: () {
                          setState(() {
                            _selectedPage = _DemoPage.toolbar;
                          });
                        },
                      ),
                      StockholmListTile(
                        leading: const Icon(Ionicons.list_outline),
                        child: const Text('Property inspector'),
                        selected: _selectedPage == _DemoPage.propertyInspector,
                        onPressed: () {
                          setState(() {
                            _selectedPage = _DemoPage.propertyInspector;
                          });
                        },
                      ),
                      const StockholmListTileHeader(child: Text('Misc')),
                      StockholmListTile(
                        leading: const Icon(Ionicons.color_palette_outline),
                        child: const Text('Colors'),
                        selected: _selectedPage == _DemoPage.colors,
                        onPressed: () {
                          setState(() {
                            _selectedPage = _DemoPage.colors;
                          });
                        },
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
                    children: [const ToolbarDemo(), Expanded(child: page)],
                  ))
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
