import 'package:flutter/material.dart';
import 'package:stockholm/stockholm.dart';

class StockholmPropertyInspectorDemoPage extends StatelessWidget {
  const StockholmPropertyInspectorDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Spacer(),
        MyPropertyInspector(),
      ],
    );
  }
}

class MyPropertyInspector extends StatefulWidget {
  const MyPropertyInspector({Key? key}) : super(key: key);

  @override
  _MyPropertyInspectorState createState() => _MyPropertyInspectorState();
}

class _MyPropertyInspectorState extends State<MyPropertyInspector> {
  bool _checkboxValue = true;
  int _intValue = 100;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: StockholmPropertyInspector(
        header: const StockholmPIHeader(
          child: Text('Project inspector'),
        ),
        properties: [
          const SizedBox(
            height: 20,
          ),
          // Text('Department Names'),

          StockholmPIListProp(
            name: 'Departments Names',
            fallbackText: 'Departments',
            list: [
              ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [],
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text('Item 1'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text('Item 2'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text('Item 3'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
