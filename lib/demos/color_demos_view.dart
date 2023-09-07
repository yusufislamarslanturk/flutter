import 'dart:developer';

import 'package:flutter/material.dart';

class ColorDemos extends StatefulWidget {
  const ColorDemos({super.key, required this.initialColor});
  final Color? initialColor;
  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  Color? _backgroundColor = Colors.transparent;
  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.initialColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant ColorDemos oldWidget) {
    super.didUpdateWidget(oldWidget);
    inspect(widget);
    if (widget.initialColor != _backgroundColor &&
        widget.initialColor != null) {
      changeBackgroundColor(widget.initialColor!);
    }
  }

  void changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _colorOnTap,
        items: const [
          BottomNavigationBarItem(
              icon: _colorContainer(
                color: Colors.red,
              ),
              label: 'Red'),
          BottomNavigationBarItem(
              icon: _colorContainer(color: Colors.yellow),
              label: 'Yellow'),
          BottomNavigationBarItem(
              icon: _colorContainer(color: Colors.green),
              label: 'Green')
        ],
      ),
    );
  }

  void _colorOnTap(int value) {
    if (value == _MyColors.red.index) {
      changeBackgroundColor(Colors.red);
    } else if (value == _MyColors.green.index) {
      changeBackgroundColor(Colors.green);
    } else if (value == _MyColors.yellow.index) {
      changeBackgroundColor(Colors.yellow);
    }
  }
}

enum _MyColors { red, yellow, green }

class _colorContainer extends StatelessWidget {
  const _colorContainer({
    required this.color,
  });
  final color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 10,
      height: 10,
    );
  }
}
