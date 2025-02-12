import 'package:dynamic_row_table/dynamic_row_table.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Table Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic Row Table Example')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DynamicRowTableWidget(
          firstIsPrefix: false,
          mainContainerFlex: 1,
          rows: [
            DynamicTableRow(children: [
              TableRowChild(
                color: Colors.blue.shade200,
                alignment: Alignment.centerLeft,
                tableRowCellChildren: const [
                  CellText(
                      text: "ID",
                      customStyle: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              TableRowChild(
                color: Colors.blue.shade100,
                alignment: Alignment.centerLeft,
                tableRowCellChildren: const [CellText(text: "001")],
              ),
            ]),
            DynamicTableRow(children: [
              TableRowChild(
                color: Colors.blue.shade200,
                alignment: Alignment.centerLeft,
                tableRowCellChildren: const [
                  CellText(
                      text: "Name",
                      customStyle: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              TableRowChild(
                color: Colors.blue.shade100,
                alignment: Alignment.centerLeft,
                tableRowCellChildren: const [CellText(text: "John Doe")],
              ),
            ]),
            DynamicTableRow(children: [
              TableRowChild(
                color: Colors.blue.shade200,
                alignment: Alignment.centerLeft,
                tableRowCellChildren: const [
                  CellText(
                      text: "Role",
                      customStyle: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              TableRowChild(
                color: Colors.blue.shade100,
                alignment: Alignment.centerLeft,
                tableRowCellChildren: const [
                  CellText(text: "Software Engineer")
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
