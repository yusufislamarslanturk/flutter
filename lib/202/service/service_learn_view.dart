// ignore_for_file: unused_field

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/package/loading_bar.dart';
import 'package:flutter_full_learn/202/service/comment_learn_view.dart';
import 'package:flutter_full_learn/202/service/post_service.dart';
import 'package:flutter_full_learn/202/service/service_post_learn_view.dart';
import 'post_model.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({Key? key}) : super(key: key);

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items;
  String? name;
  bool _isLoading = false;
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';

  // TEST EDIELBIR KOD BASLADI
  late final IPostService _postService;

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    _postService = PostService();
    name = 'Service Data';

    fetchPostItemsAdvance();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItems() async {
    _changeLoading();
    final response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;

      if (datas is List) {
        setState(() {
          _items = datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }
    _changeLoading();
  }

  Future<void> fetchPostItemsAdvance() async {
    _changeLoading();
    await Future.delayed(const Duration(seconds: 3));
    _items = await _postService.fetchPostItemsAdvance();
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name ?? '',
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          _isLoading
              ? const CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                )
              : IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const ServicePostLearn();
                        },
                        fullscreenDialog: true,
                        settings: const RouteSettings()));
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ))
        ],
      ),
      body: _items == null
          ? const LoadingBar()
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: _items?.length ?? 0,
              itemBuilder: (context, index) {
                return _PostCard(model: _items?[index]);
              },
            ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required PostModel? model,
  })  : _model = model,
        super(key: key);

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                CommentsLearnView(postId: _model?.id),
          ));
        },
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
