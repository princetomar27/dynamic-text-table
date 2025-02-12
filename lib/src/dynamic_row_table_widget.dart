import 'package:flutter/material.dart';
import 'table_row_widget.dart';

class DynamicRowTableWidget extends StatelessWidget {
  final EdgeInsets margin;
  final bool outsideBorder;
  final int mainContainerFlex;
  final bool firstIsPrefix;
  final bool lastIsSuffix;
  final List<DynamicTableRow> rows;

  const DynamicRowTableWidget({
    Key? key,
    this.margin = EdgeInsets.zero,
    this.outsideBorder = true,
    this.mainContainerFlex = 4,
    this.firstIsPrefix = true,
    this.lastIsSuffix = true,
    required this.rows,
  }) : super(key: key);

  static const _border = BorderSide(color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: outsideBorder ? const Border.fromBorderSide(_border) : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(rows.length, (index) {
            return _buildRow(
              isFirst: index == 0,
              isLast: index == rows.length - 1,
              row: rows[index],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildRow({
    required bool isFirst,
    required bool isLast,
    required DynamicTableRow row,
  }) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: List.generate(row.children.length, (index) {
          final child = row.children[index];
          final isLeading = index == 0;
          final isTrailing = index == row.children.length - 1;

          if (isLeading) {
            return firstIsPrefix
                ? _prefixRowCell(child, isFirst, isLast)
                : _mainRowCell(child, isFirst, isLast, isLeading: true);
          } else if (isTrailing) {
            return lastIsSuffix
                ? _suffixRowCell(child, isFirst, isLast)
                : _mainRowCell(child, isFirst, isLast);
          } else {
            return _mainRowCell(child, isFirst, isLast);
          }
        }),
      ),
    );
  }

  Expanded _suffixRowCell(TableRowChild child, bool isFirst, bool isLast) {
    return Expanded(
      flex: child.flex ?? 3,
      child: Container(
        decoration: BoxDecoration(
          color: child.color,
          border: _cellBorder(isFirst, isLast, false),
        ),
        child: _buildCellContent(child),
      ),
    );
  }

  Expanded _mainRowCell(TableRowChild child, bool isFirst, bool isLast,
      {bool isLeading = false}) {
    return Expanded(
      flex: child.flex ?? mainContainerFlex,
      child: Container(
        decoration: BoxDecoration(
          color: child.color,
          border: _cellBorder(isFirst, isLast, isLeading),
        ),
        child: _buildCellContent(child),
      ),
    );
  }

  Widget _prefixRowCell(TableRowChild child, bool isFirst, bool isLast) {
    return Container(
      decoration: BoxDecoration(
        color: child.color,
        border: _cellBorder(isFirst, isLast, true),
      ),
      child: _buildCellContent(child),
    );
  }

  Widget _buildCellContent(TableRowChild child) {
    return Align(
      alignment: child.alignment,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: child.tableRowCellChildren
            .map((cellText) => _cell(cellText))
            .toList(),
      ),
    );
  }

  Container _cell(CellText cellText) {
    return Container(
      color: cellText.fillColor,
      padding: const EdgeInsets.all(8.0),
      child: Text(
        cellText.text,
        textAlign: cellText.textAlign,
        style: cellText.customStyle?.copyWith(
              decoration: cellText.strike
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ) ??
            const TextStyle(fontSize: 14),
      ),
    );
  }

  Border? _cellBorder(bool isFirst, bool isLast, bool isLeading) {
    return Border(
      bottom: isLast ? BorderSide.none : _border,
      left: isLeading ? BorderSide.none : _border,
    );
  }
}
