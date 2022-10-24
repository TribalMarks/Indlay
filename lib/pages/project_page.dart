import 'package:flutter/material.dart';
import 'package:indlay/pages/toolbar.dart';
import 'package:stockholm/stockholm.dart';
import 'package:indlay/pages/newproject.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
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
              children: const [
                Text('Facility Name'),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 250,
                  child: StockholmTextField(
                    autofocus: true,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Text('Source'),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 200,
                  child: StockholmTextField(
                    autofocus: true,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Text('Comments'),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 400,
                  height: 160,
                  child: StockholmTextField(
                    autofocus: true,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              children: const [
                Text('Area of Departments'),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 100,
                  child: StockholmTextField(
                    autofocus: true,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: const [
                Text('Number of Departments'),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 100,
                  child: StockholmTextField(
                    autofocus: true,
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NewProject()));
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
