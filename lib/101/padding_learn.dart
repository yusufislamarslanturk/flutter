import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.all(25),
            child: Container(color: Colors.white24, height: 100)),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: Container(color: Colors.white, height: 110))
      ]),
    );
  }
}
