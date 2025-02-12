## README.md

# Dynamic Row Table

A Flutter widget for building dynamic tables with multiple lines per cell. This package allows you to create flexible and customizable tables where each cell can contain multiple lines of data.

## Features

- Customizable table with multiple lines per cell.
- Supports dynamic row and column counts.
- Easily configurable styles.
- Lightweight and efficient.

## Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  dynamic_row_table: ^1.0.0
```

Then run:

```sh
flutter pub get
```

## Usage

Import the package:

```dart
import 'package:dynamic_row_table/dynamic_row_table.dart';
```

### Example

```dart
DynamicRowTableWidget(
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
)
```

## Contribution

Feel free to open an issue or submit a pull request if you'd like to contribute!
