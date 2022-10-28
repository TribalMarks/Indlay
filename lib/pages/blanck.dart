import 'package:flutter/material.dart';
import 'package:indlay/pages/toolbar.dart';

class BlanckPage extends StatelessWidget {
  const BlanckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: const [
        Expanded(
            child: Center(
          child: Text('IndLay', style: TextStyle(fontSize: 60)),
        ))
      ],
    ));
  }
}
