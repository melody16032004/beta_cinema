import 'package:flutter/material.dart';

class Line extends StatefulWidget {
  final double _height;
  final double _width;
  final Color? _color;
  const Line({
    super.key,
    required double height,
    required double width,
    Color? color,
  })  : _height = height,
        _width = width,
        _color = color;

  @override
  State<Line> createState() => _LineState();
}

class _LineState extends State<Line> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget._height,
      width: widget._width,
      color: widget._color,
    );
  }
}
