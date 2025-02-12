import 'package:flutter/material.dart';
import 'dynamic_row_table.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Table Example',
      home: Scaffold(
        appBar: AppBar(title: const Text('Dynamic Table Example')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DynamicRowTableWidget(
            firstIsPrefix: false,
            mainContainerFlex: 1,
            rows: [
              DynamicTableRow(children: [
                const TableRowChild(
                  color: Colors.blue,
                  alignment: Alignment.centerLeft,
                  tableRowCellChildren: [CellText(text: "Name")],
                ),
                TableRowChild(
                  color: Colors.blue.shade100,
                  alignment: Alignment.centerRight,
                  tableRowCellChildren: const [CellText(text: "John Doe")],
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
