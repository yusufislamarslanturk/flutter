import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/counter_hello_button.dart';
import 'package:flutter_full_learn/product/language/language_items.dart';

class StatefullLearn extends StatefulWidget {
  const StatefullLearn({super.key});

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

class _StatefullLearnState extends State<StatefullLearn> {
  int _countValue = 0;

  void _updatecounter(bool isIncrement) {
    if (isIncrement) {
      _countValue = _countValue + 1;
    } else {
      _countValue = _countValue - 1;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LanguageItems.welcomeTitle),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [_incrementButton(), _deincrementButton()],
      ),
      body: Column(
        children: [
          Center(
              child: Text(_countValue.toString(),
                  style: Theme.of(context).textTheme.headlineLarge)),
          const Placeholder(),
          const CounterHelloButton(),
        ],
      ),
    );
  }

  Padding _deincrementButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: FloatingActionButton(
          onPressed: () {
            _updatecounter(false);
          },
          child: const Icon(Icons.remove)),
    );
  }

  FloatingActionButton _incrementButton() {
    return FloatingActionButton(
        onPressed: () {
          _updatecounter(true);
        },
        child: const Icon(Icons.add));
  }
}
