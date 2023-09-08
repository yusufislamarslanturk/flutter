import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
  const ColorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
              child: Text('data',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(
                          color: Theme.of(context).splashColor)))
        ],
      ),
    );
  }
}

class ColorsItems {
  static const Color sari = Color(0xffEd8f70);
  static const Color yesil = Color.fromARGB(198, 237, 97, 1);
}
