import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lottie Learn'),
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
          child: SizedBox(
              width: 150,
              child: Lottie.asset(
                'assets/lottie/flightv2.json',
              ))),
    );
  }
}
