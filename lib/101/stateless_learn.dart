import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget {
  const StatelessLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        const TitleTextWidget(
          text: 'data1',
        ),
        _emptyBox(),
        const TitleTextWidget(
          text: 'data2',
        ),
        _emptyBox(),
        const TitleTextWidget(text: 'data3'),
        const _CustomContainer(),
        _emptyBox(),
      ]),
    );
  }

  SizedBox _emptyBox() => SizedBox(height: 20);
}

class _CustomContainer extends StatelessWidget {
  const _CustomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({super.key, this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
