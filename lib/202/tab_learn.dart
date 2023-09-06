import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/card_learn.dart';
import 'package:flutter_full_learn/101/image_learn.dart';
import 'package:flutter_full_learn/101/padding_learn.dart';
import 'package:flutter_full_learn/101/text_learn_view.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({super.key});

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabViews.values.length,
        child: Scaffold(
          extendBody: true,
          floatingActionButton: FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: () {
                _tabController.animateTo(_MyTabViews.home.index);
              },
              child: const Icon(Icons.flight_outlined)),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              child: TabBar(
                controller: _tabController,
                tabs: _MyTabViews.values
                    .map((e) => Tab(text: e.name.toUpperCase()))
                    .toList(),
              )),
          appBar: AppBar(),
          body:
              TabBarView(controller: _tabController, children: const [
            ImageLearn(),
            CardLearn(),
            PaddingLearn(),
            TextLearnView(),
          ]),
        ));
  }
}

enum _MyTabViews { home, settings, favorite, profile }

extension _MyTabViewExtension on _MyTabViews {}
