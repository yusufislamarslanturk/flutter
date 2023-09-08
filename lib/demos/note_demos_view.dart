import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/image_learn.dart';

class NoteDemos extends StatelessWidget {
  const NoteDemos({super.key});

  @override
  Widget build(BuildContext context) {
    var title = 'İlk Notunu Oluştur';
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(),
      body: Padding(
          padding: PaddingItems.horizontalPadding,
          child: Column(
            children: [
              PngImage(name: ImageItems().appleBook),
              _titleWidget(title: title),
              Padding(
                padding: PaddingItems.verticalPadding,
                child: _SubTitleWidget(
                  title: 'test data ali sda ' * 25,
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {},
                  child: const SizedBox(
                      height: 50,
                      child: Center(child: Text('Not Oluştur')))),
              TextButton(
                  onPressed: () {},
                  child: const Text('Önemli  Notlar')),
              const SizedBox(height: 120),
            ],
          )),
    );
  }
}

class _SubTitleWidget extends StatelessWidget {
  const _SubTitleWidget({
    required this.title,
    required this.textAlign,
  });
  final String title;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: textAlign,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.black87, fontWeight: FontWeight.w400));
  }
}

// ignore: camel_case_types
class _titleWidget extends StatelessWidget {
  const _titleWidget({
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.black87, fontWeight: FontWeight.w800));
  }
}

class PaddingItems {
  static const EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets verticalPadding =
      EdgeInsets.symmetric(vertical: 10);
}
