import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextButton(
                onPressed: () {},
                child:
                    Text('Save', style: Theme.of(context).textTheme.subtitle2),
                style: ButtonStyle(backgroundColor:
                    MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.green;
                  }
                  return Colors.amber;
                }))),
            ElevatedButton(onPressed: () {}, child: const Text('data')),
            IconButton(onPressed: () {}, icon: const Icon(Icons.abc_sharp)),
            FloatingActionButton(
                onPressed: () {}, child: const Icon(Icons.add)),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blueGrey, shape: CircleBorder()),
                onPressed: () {},
                child: const Text('data')),
            InkWell(onTap: () {}, child: const Text('custom')),
          ],
        ));
  }
}
