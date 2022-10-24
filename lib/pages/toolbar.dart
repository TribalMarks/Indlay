import 'package:indlay/pages/demo_page.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stockholm/stockholm.dart';

class StockholmToolbarDemoPage extends StatelessWidget {
  const StockholmToolbarDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StockholmDemoPage(
      padding: EdgeInsets.zero,
      children: [
        ToolbarDemo(),
      ],
    );
  }
}

class ToolbarDemo extends StatefulWidget {
  const ToolbarDemo({Key? key}) : super(key: key);

  @override
  _ToolbarDemoState createState() => _ToolbarDemoState();
}

class _ToolbarDemoState extends State<ToolbarDemo> {
  bool _settingsToggled = false;

  @override
  Widget build(BuildContext context) {
    var colors = StockholmColors.fromContext(context);

    return StockholmToolbar(
      children: [
        StockholmToolbarButton(
          icon: Ionicons.folder_outline,
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
                  child: StockholmListTile(
                    leading: const Icon(Ionicons.document_outline),
                    child: const Text('New'),
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                ),
                StockholmMenuItem(
                  onSelected: () {
                    // Selected item 3
                  },
                  child: StockholmListTile(
                    leading: const Icon(Ionicons.folder_open_outline),
                    child: const Text('Open'),
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                ),
                const StockholmMenuItemDivider(),
                StockholmMenuItem(
                  onSelected: () {
                    // Selected item 4
                  },
                  child: StockholmListTile(
                    leading: const Icon(Ionicons.save_outline),
                    child: const Text('Save'),
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                ),
                const StockholmMenuItemDivider(),
                StockholmMenuItem(
                  onSelected: () {
                    // Selected item 4
                  },
                  child: StockholmListTile(
                    leading: const Icon(Ionicons.print_outline),
                    child: const Text('Print'),
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                ),
                const StockholmMenuItemDivider(),
                StockholmMenuItem(
                  onSelected: () {
                    // Selected item 4
                  },
                  child: StockholmListTile(
                    leading: const Icon(Ionicons.exit_outline),
                    child: const Text('Exit'),
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                )
              ]),
            );
          },
        ),
        StockholmToolbarButton(
          icon: Ionicons.help_outline,
          onPressed: () {},
        ),
        const StockholmToolbarDivider(),
      ],
    );
  }
}
