import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            SizedBox(
              height: 300,
              width: 200,
              child: Image.asset(
                "assets/Apple-Book-PNG-Photos.png",
                fit: BoxFit.cover,
              ),
            )
          ],
        ));
  }
}

class ImageItems {
  final String appleBook = "Apple-Book-PNG-Photos";
}

class PngImage extends StatelessWidget {
  const PngImage({super.key, required this.name});
  final String name;

  String get _nameWithPath => 'assets/png/$name.png';
  @override
  Widget build(BuildContext context) {
    return Image.asset(_nameWithPath);
  }
}
