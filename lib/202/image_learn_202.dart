import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:provider/provider.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({super.key});

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<ResourceContext>().Clear();
              },
              icon: const Icon(Icons.assistant_direction))
        ],
        title: Text(context
                .read<ResourceContext>()
                .resourceModel
                ?.data
                ?.length
                .toString() ??
            '0'),
      ),
      body: Column(
        children: [
          ImagePaths.apple_book.toWidget(width: 200, height: 200),
        ],
      ),
    );
  }
}

enum ImagePaths {
  // ignore: constant_identifier_names
  apple_book,
  // ignore: constant_identifier_names
  logo,
  // ignore: constant_identifier_names
  Random_image
}

extension ImagePathOnExtension on ImagePaths {
  String path() {
    return 'assets/png/$name.png';
  }

  Widget toWidget({double height = 80, double width = 80}) {
    return Image.asset(
      path(),
      height: height,
      width: width,
    );
  }
}
