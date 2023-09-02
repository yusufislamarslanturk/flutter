import 'package:flutter/material.dart';
import 'package:flutter_full_learn/core/random_image.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({super.key});
  final _cardHeight = 50.0;
  final _cardWidth = 200.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                      bottom: _cardHeight / 2,
                      child: const RandomImage()),
                  Positioned(
                      height: _cardHeight,
                      bottom: 0,
                      width: _cardWidth,
                      child: const _customCard())
                ],
              )),
          const Spacer(
            flex: 6,
          )
        ],
      ),
    );
  }
}

class _customCard extends StatelessWidget {
  const _customCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(),
    );
  }
}
