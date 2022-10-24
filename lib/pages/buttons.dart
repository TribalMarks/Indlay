import 'package:indlay/pages/demo_page.dart';
import 'package:flutter/material.dart';
import 'package:stockholm/stockholm.dart';

class StockholmButtonDemoPage extends StatelessWidget {
  const StockholmButtonDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StockholmDemoPage(children: [
      _NormalButtonsDemo(),
      _LargeButtonsDemo(),
      _CheckboxDemo(),
      _CheckboxDisabledDemo(),
      _RadioButtonDemo(),
      _RadioButtonsDisabledDemo(),
    ]);
  }
}

class _NormalButtonsDemo extends StatelessWidget {
  const _NormalButtonsDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoSection(
      title: 'Buttons',
      child: Row(
        children: [
          StockholmButton(
            onPressed: () {},
            child: const Text('Regular Button'),
          ),
          const SizedBox(
            width: 8,
          ),
          StockholmButton(
            onPressed: () {},
            important: true,
            child: const Text('Important Button'),
          ),
          const SizedBox(
            width: 8,
          ),
          StockholmButton(
            onPressed: () {},
            enabled: false,
            child: const Text('Disabled Button'),
          ),
        ],
      ),
    );
  }
}

class _LargeButtonsDemo extends StatelessWidget {
  const _LargeButtonsDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoSection(
      title: 'Large Buttons',
      child: Row(
        children: [
          StockholmButton(
            onPressed: () {},
            child: const Text('Regular Button'),
            large: true,
          ),
          const SizedBox(
            width: 8,
          ),
          StockholmButton(
            onPressed: () {},
            important: true,
            child: const Text('Important Button'),
            large: true,
          ),
          const SizedBox(
            width: 8,
          ),
          StockholmButton(
            onPressed: () {},
            enabled: false,
            child: const Text('Disabled Button'),
            large: true,
          ),
        ],
      ),
    );
  }
}

class _CheckboxDemo extends StatefulWidget {
  const _CheckboxDemo({Key? key}) : super(key: key);

  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<_CheckboxDemo> {
  bool _checkedFirst = false;
  bool _checkedSecond = true;

  @override
  Widget build(BuildContext context) {
    return DemoSection(
      title: 'Checkboxes',
      child: Row(
        children: [
          StockholmCheckbox(
            value: _checkedFirst,
            label: 'Initially unchecked',
            onChanged: (bool value) {
              setState(() {
                _checkedFirst = value;
              });
            },
          ),
          const SizedBox(
            width: 16,
          ),
          StockholmCheckbox(
            value: _checkedSecond,
            label: 'Initially checked',
            onChanged: (bool value) {
              setState(() {
                _checkedSecond = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class _CheckboxDisabledDemo extends StatelessWidget {
  const _CheckboxDisabledDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoSection(
      title: 'Disabled checkboxes',
      child: Row(
        children: const [
          StockholmCheckbox(
            value: false,
            label: 'Disabled unchecked',
          ),
          SizedBox(
            width: 16,
          ),
          StockholmCheckbox(
            value: true,
            label: 'Disabled checked',
          ),
        ],
      ),
    );
  }
}

enum UIStyle {
  cupertino,
  mountainView,
  stockholm,
}

class _RadioButtonDemo extends StatefulWidget {
  const _RadioButtonDemo({Key? key}) : super(key: key);

  @override
  _RadioButtonDemoState createState() => _RadioButtonDemoState();
}

class _RadioButtonDemoState extends State<_RadioButtonDemo> {
  UIStyle _uiStyle = UIStyle.stockholm;

  @override
  Widget build(BuildContext context) {
    return DemoSection(
      title: 'Radio buttons',
      child: Row(
        children: [
          StockholmRadioButton<UIStyle>(
            value: UIStyle.cupertino,
            groupValue: _uiStyle,
            label: 'Cupertino',
            onChanged: (value) {
              setState(() {
                _uiStyle = value;
              });
            },
          ),
          const SizedBox(
            width: 16,
          ),
          StockholmRadioButton<UIStyle>(
            value: UIStyle.mountainView,
            groupValue: _uiStyle,
            label: 'Mountain View',
            onChanged: (value) {
              setState(() {
                _uiStyle = value;
              });
            },
          ),
          const SizedBox(
            width: 16,
          ),
          StockholmRadioButton<UIStyle>(
            value: UIStyle.stockholm,
            groupValue: _uiStyle,
            label: 'Stockholm',
            onChanged: (value) {
              setState(() {
                _uiStyle = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class _RadioButtonsDisabledDemo extends StatelessWidget {
  const _RadioButtonsDisabledDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoSection(
      title: 'Disabled radio buttons',
      child: Row(
        children: const [
          StockholmRadioButton<UIStyle>(
            value: UIStyle.cupertino,
            groupValue: UIStyle.stockholm,
            label: 'Cupertino',
          ),
          SizedBox(
            width: 16,
          ),
          StockholmRadioButton<UIStyle>(
            value: UIStyle.mountainView,
            groupValue: UIStyle.stockholm,
            label: 'Mountain View',
          ),
          SizedBox(
            width: 16,
          ),
          StockholmRadioButton<UIStyle>(
            value: UIStyle.stockholm,
            groupValue: UIStyle.stockholm,
            label: 'Stockholm',
          ),
        ],
      ),
    );
  }
}
