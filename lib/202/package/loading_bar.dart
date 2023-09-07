import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBar extends StatelessWidget {
  const LoadingBar({this.size, super.key});
  final double? size;
  final _defaultSize = 40.0;
  @override
  Widget build(BuildContext context) {
    return SpinKitSpinningLines(
        color: Colors.lightBlue.shade600, size: size ?? _defaultSize);
  }
}
