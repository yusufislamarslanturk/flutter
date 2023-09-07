import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/package/launch_manager.dart';
import 'package:flutter_full_learn/202/package/loading_bar.dart';

class PackageLearn extends StatefulWidget {
  const PackageLearn({super.key});

  @override
  State<PackageLearn> createState() => _PackageLearnState();
}

class _PackageLearnState extends State<PackageLearn>
    with TickerProviderStateMixin, LaunchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: LoadingBar(size: 45),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          launchURL(Uri.parse('https://www.agarthateknoloji.com.tr'));
        },
      ),
    );
  }
}
