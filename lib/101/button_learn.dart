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
                style: ButtonStyle(backgroundColor:
                    MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.green;
                  }
                  return Colors.amber;
                })),
                child:
                    Text('Save', style: Theme.of(context).textTheme.titleSmall)),
            ElevatedButton(onPressed: () {}, child: const Text('data')),
            IconButton(onPressed: () {}, icon: const Icon(Icons.abc_sharp)),
            FloatingActionButton(
                onPressed: () {}, child: const Icon(Icons.add)),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blueGrey, shape: const CircleBorder()),
                onPressed: () {},
                child: const Text('data')),
            InkWell(onTap: () {}, child: const Text('custom')),
          ],
        ));
  }
}
