import 'package:flutter/material.dart';

class StatefullLifeCycleLearn extends StatefulWidget {
  const StatefullLifeCycleLearn({super.key, required this.message});
  final String message;

  @override
  State<StatefullLifeCycleLearn> createState() =>
      _StatefullLifeCycleLearnState();
}

class _StatefullLifeCycleLearnState
    extends State<StatefullLifeCycleLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: widget.message.length.isOdd
              ? const Text('kelime Tek')
              : const Text('Kelime Çift')),
    );
  }
}
