import 'package:flutter/material.dart';
import 'package:flutter_full_learn/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListTile Learn'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: const RandomImage(
                      height: 100,
                    ),
                    onTap: () {},
                    subtitle: const Text('How do use your card'),
                    leading: const Icon(Icons.money),
                    trailing: const Icon(Icons.chevron_right),
                    iconColor: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
