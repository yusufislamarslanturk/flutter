import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({Key? key}) : super(key: key);

  @override
  State<ServicePostLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServicePostLearn> {
  String? name;
  bool _isLoading = false;
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';

  final TextEditingController _titleController =
      TextEditingController();
  final TextEditingController _bodyController =
      TextEditingController();
  final TextEditingController _userIdController =
      TextEditingController();
  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(PostModel postModel) async {
    _changeLoading();
    final response = await _dio.post('posts', data: postModel);

    if (response.statusCode == HttpStatus.created) {
      name = 'Basarili';
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Service Post',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          _isLoading
              ? const CircularProgressIndicator.adaptive()
              : const SizedBox.shrink()
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Title'),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _bodyController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Body'),
              textInputAction: TextInputAction.next,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: _userIdController,
                keyboardType: TextInputType.phone,
                autofillHints: const [AutofillHints.creditCardNumber],
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'UserId')),
          ),
          TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.green)),
              onPressed: _isLoading
                  ? null
                  : () {
                      if (_titleController.text.isNotEmpty &&
                          _bodyController.text.isNotEmpty &&
                          _userIdController.text.isNotEmpty) {
                        final model = PostModel(
                            body: _bodyController.text,
                            title: _titleController.text,
                            userId:
                                int.tryParse(_userIdController.text));

                        _addItemToService(model);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                                backgroundColor: Colors.green,
                                duration: const Duration(seconds: 3),
                                content: Text(
                                  'Kayit Ekleme $name',
                                  textAlign: TextAlign.center,
                                )));
                      }
                    },
              child: const Text(
                'Kayit Ekle',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}

// ignore: unused_element
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
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
