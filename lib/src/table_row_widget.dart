import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DynamicTableRow extends Equatable {
  final List<TableRowChild> children;

  const DynamicTableRow({required this.children});

  @override
  List<Object?> get props => [children];
}

class TableRowChild extends Equatable {
  final Color? color;
  final Alignment alignment;
  final List<CellText> tableRowCellChildren;
  final int? flex;

  const TableRowChild({
    this.color,
    required this.alignment,
    required this.tableRowCellChildren,
    this.flex,
  });

  @override
  List<Object?> get props => [color, alignment, tableRowCellChildren, flex];
}

class CellText extends Equatable {
  final String text;
  final Color? fillColor;
  final bool strike;
  final TextAlign textAlign;
  final TextStyle? customStyle;

  const CellText({
    required this.text,
    this.fillColor,
    this.strike = false,
    this.textAlign = TextAlign.left,
    this.customStyle,
  });

  @override
  List<Object?> get props => [text, fillColor, strike, textAlign, customStyle];
}
