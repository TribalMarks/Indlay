import 'package:indlay/pages/demo_page.dart';
import 'package:flutter/material.dart';
import 'package:stockholm/stockholm.dart';

class StockholmTextFieldDemoPage extends StatelessWidget {
  const StockholmTextFieldDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StockholmDemoPage(children: [
      _TextFieldDemo(),
    ]);
  }
}

class _TextFieldDemo extends StatelessWidget {
  const _TextFieldDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoSection(
      title: 'Text fields',
      child: Row(
        children: const [
          SizedBox(
            width: 200,
            child: StockholmTextField(
              autofocus: true,
            ),
          )
        ],
      ),
    );
  }
}
