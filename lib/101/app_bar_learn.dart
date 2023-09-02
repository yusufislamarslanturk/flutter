import 'package:flutter/material.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({super.key});
  final String _title = 'Agartha ERP';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_title),
          leading: const Icon(Icons.chevron_left_sharp),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_home_work_outlined)),
            // const Center(child: CircularProgressIndicator())
          ]),
      body: const Column(children: []),
    );
  }
}
