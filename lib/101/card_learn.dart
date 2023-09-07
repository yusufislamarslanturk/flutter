import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Column(
          children: [
            _CustomCard(
                child: SizedBox(
              height: 80,
              width: 300,
              child: Center(
                child: Text('card1'),
              ),
            )),
            _CustomCard(
                child: SizedBox(
              height: 80,
              width: 300,
              child: Center(
                child: Text('card2'),
              ),
            )),
            _CustomCard(
                child: SizedBox(
              height: 80,
              width: 300,
              child: Center(
                child: Text('card3'),
              ),
            )),
          ],
        ));
  }
}

class Projectmargins {
  static const cardMargin = EdgeInsets.all(20);
}

class _CustomCard extends StatelessWidget {
  const _CustomCard({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: Projectmargins.cardMargin,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: child);
  }
}
