import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/post_model.dart';
import 'package:flutter_full_learn/202/service/post_service.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView>
    with AutomaticKeepAliveClientMixin {
  final IPostService _postService = PostService();
  late final Future<List<PostModel>?> _itemsFuture;

  @override
  void initState() {
    super.initState();
    _itemsFuture = _postService.fetchPostItemsAdvance();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
      ),
      appBar: AppBar(
        title: const Text('Feed View'),
      ),
      body: _FeedFutureBuilder(itemsFuture: _itemsFuture),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _FeedFutureBuilder extends StatelessWidget {
  const _FeedFutureBuilder({
    // ignore: unused_element
    super.key,
    required Future<List<PostModel>?> itemsFuture,
  }) : _itemsFuture = itemsFuture;

  final Future<List<PostModel>?> _itemsFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PostModel>?>(
      future: _itemsFuture,
      builder: (BuildContext context,
          AsyncSnapshot<List<PostModel>?> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Center(
              child: Text('None'),
            );
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case ConnectionState.done:
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(snapshot.data![index].title ?? ''),
                  subtitle: Text(snapshot.data![index].body ?? ''),
                );
              },
            );
        }
      },
    );
  }
}
