import 'package:indlay/pages/demo_page.dart';
import 'package:flutter/material.dart';
import 'package:stockholm/stockholm.dart';

class StockholmMenuDemoPage extends StatelessWidget {
  const StockholmMenuDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StockholmDemoPage(children: [
      _PopupMenuDemo(),
      _DropdownButtonsDemo(),
      _ContextMenuDemo(),
    ]);
  }
}

class _DropdownButtonsDemo extends StatefulWidget {
  const _DropdownButtonsDemo({Key? key}) : super(key: key);

  @override
  __DropdownButtonsDemoState createState() => __DropdownButtonsDemoState();
}

class __DropdownButtonsDemoState extends State<_DropdownButtonsDemo> {
  int _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return DemoSection(
      title: 'Dropdown buttons',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          StockholmDropdownButton<int>(
            width: 150,
            items: const [
              StockholmDropdownItem<int>(value: 0, child: Text('Item 0')),
              StockholmDropdownItem<int>(value: 1, child: Text('Item 1')),
              StockholmDropdownItem<int>(value: 2, child: Text('Item 2')),
              StockholmDropdownItem<int>(value: 3, child: Text('Item 3')),
              StockholmDropdownItem<int>(value: 4, child: Text('Item 4')),
            ],
            value: _selectedValue,
            onChanged: (value) {
              setState(() {
                _selectedValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class _PopupMenuDemo extends StatelessWidget {
  const _PopupMenuDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoSection(
      title: 'Popup menu',
      child: Row(
        children: [
          // We need to use a builder to get a new context with the correct
          // bounds for the button. This makes sure we place the menu in the
          // correct spot.
          Builder(builder: (context) {
            return StockholmButton(
              onPressed: () {
                var bounds = getGlobalBoundsForContext(context);
                showStockholmMenu(
                  context: context,
                  preferredAnchorPoint: Offset(bounds.left, bounds.bottom + 4),
                  menu: StockholmMenu(items: [
                    StockholmMenuItem(
                      onSelected: () {
                        // Selected item 1
                      },
                      child: const Text('Item 1'),
                    ),
                    const StockholmMenuItem(
                      child: Text('Item 2 (Disabled)'),
                    ),
                    StockholmMenuItem(
                      onSelected: () {
                        // Selected item 3
                      },
                      child: const Text('Item 3'),
                    ),
                    const StockholmMenuItemDivider(),
                    StockholmMenuItem(
                      onSelected: () {
                        // Selected item 4
                      },
                      child: const Text('Item 4 - Last Item Is Much Longer'),
                    ),
                  ]),
                );
              },
              child: const Text('Open Popup Menu'),
            );
          }),
        ],
      ),
    );
  }
}

class _ContextMenuDemo extends StatelessWidget {
  const _ContextMenuDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoSection(
      title: 'Context menu',
      child: Row(
        children: [
          StockholmContextMenu(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              width: 200,
              height: 150,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StockholmButton(
                    child: const Text('Right click me'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            menu: StockholmMenu(items: [
              StockholmMenuItem(
                onSelected: () {
                  // Cut
                },
                child: const Text('Cut'),
              ),
              StockholmMenuItem(
                onSelected: () {
                  // Copy
                },
                child: const Text('Copy'),
              ),
              StockholmMenuItem(
                onSelected: () {
                  // Paste
                },
                child: const Text('Paste'),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
