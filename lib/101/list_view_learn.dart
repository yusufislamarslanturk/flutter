import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({super.key});

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: FittedBox(
              child: Text('Merhaba',
                  style: Theme.of(context).textTheme.headlineLarge),
            ),
          ),
          Container(
            color: Colors.red,
            height: 300,
          ),
          Divider(),
          SizedBox(
            height: 300,
            child:
                ListView(scrollDirection: Axis.horizontal, children: [
              Container(
                color: Colors.white,
                width: 100,
              ),
              Container(
                color: Colors.transparent,
                width: 10,
              ),
              Container(
                color: Colors.white,
                width: 100,
              ),
              Container(
                color: Colors.transparent,
                width: 10,
              ),
              Container(
                color: Colors.white,
                width: 100,
              ),
              Container(
                color: Colors.transparent,
                width: 10,
              ),
              Container(
                color: Colors.white,
                width: 100,
              ),
              Container(
                color: Colors.transparent,
                width: 10,
              ),
              Container(
                color: Colors.white,
                width: 100,
              ),
              Container(
                color: Colors.transparent,
                width: 10,
              ),
              Container(
                color: Colors.white,
                width: 100,
              ),
              Container(
                color: Colors.transparent,
                width: 10,
              ),
              Container(
                color: Colors.white,
                width: 100,
              ),
            ]),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.close,
              ))
        ],
      ),
    );
  }
}
