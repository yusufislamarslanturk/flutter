import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Text('nu' * 500),
          ),
          const SizedBox.shrink(),
          SizedBox.square(
            dimension: 50,
            child: Text('u' * 10),
          ),
          Container(
              height: 50,
              constraints: const BoxConstraints(
                  maxWidth: 150, minWidth: 50, maxHeight: 100),
              padding: const EdgeInsets.all(1),
              margin: const EdgeInsets.all(130),
              decoration: Projectutility.boxDecoration,
              child: Text(
                'n' * 8,
              ))
        ]));
  }
}

class Projectutility {
  static BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: const LinearGradient(colors: [Colors.red, Colors.black]),
      boxShadow: const [
        BoxShadow(color: Colors.green, offset: Offset(0.1, 1), blurRadius: 12)
      ],
      border: Border.all(width: 10, color: Colors.white12));
}

class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
            borderRadius: BorderRadius.circular(100),
            gradient: const LinearGradient(colors: [Colors.red, Colors.black]),
            boxShadow: const [
              BoxShadow(
                  color: Colors.green, offset: Offset(0.1, 1), blurRadius: 12)
            ],
            border: Border.all(width: 10, color: Colors.white12));
}
