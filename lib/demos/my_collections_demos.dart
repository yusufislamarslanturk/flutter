import 'package:flutter/material.dart';

class MyCollectionsDemos extends StatefulWidget {
  const MyCollectionsDemos({super.key});

  @override
  State<MyCollectionsDemos> createState() =>
      _MyCollectionsDemosState();
}

class _MyCollectionsDemosState extends State<MyCollectionsDemos> {
  late final List<CollectionModel> _items;
  @override
  void initState() {
    super.initState();
    _items = CollectionItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Collection'),
        ),
        body: ListView.builder(
          padding: paddingUtility().paddingSymmetric,
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return _CategoryCard(model: _items[index]);
          },
        ));
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required CollectionModel model,
  }) : _model = model;

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: paddingUtility().paddingBottom,
      child: SizedBox(
          child: Padding(
        padding: paddingUtility().paddingGeneral,
        child: Column(children: [
          Image.asset(_model.imagePath, fit: BoxFit.fill),
          Padding(
            padding: paddingUtility().paddingTop,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_model.title),
                Text('${_model.price.toString()} eth')
              ],
            ),
          )
        ]),
      )),
    );
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final double price;

  CollectionModel(
      {required this.imagePath,
      required this.title,
      required this.price});
}

class paddingUtility {
  final paddingTop = const EdgeInsets.only(top: 10);
  final paddingBottom = const EdgeInsets.only(bottom: 20);
  final paddingGeneral = const EdgeInsets.all(20);
  final paddingSymmetric = const EdgeInsets.symmetric(horizontal: 20);
}

class CollectionItems {
  late final List<CollectionModel> items;
  CollectionItems() {
    items = [
      CollectionModel(
        imagePath: ProjectImages.imageCollection,
        title: 'Collection 1',
        price: 3.4,
      ),
      CollectionModel(
        imagePath: ProjectImages.imageCollection,
        title: 'Collection 2',
        price: 3.4,
      ),
      CollectionModel(
        imagePath: ProjectImages.imageCollection,
        title: 'Collection 3',
        price: 3.4,
      ),
      CollectionModel(
        imagePath: ProjectImages.imageCollection,
        title: 'Collection 4',
        price: 3.4,
      ),
      CollectionModel(
        imagePath: ProjectImages.imageCollection,
        title: 'Collection 5',
        price: 3.4,
      ),
    ];
  }
}

class ProjectImages {
  static const imageCollection =
      'assets/png/Apple-Book-PNG-Photos.png';
}
