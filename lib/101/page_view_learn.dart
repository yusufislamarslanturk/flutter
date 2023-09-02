import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/list_tile_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController();
  int _currentPageIndex = 0;
  void _updatePageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _currentPageIndex.toString(),
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: Colors.red),
            ),
            FloatingActionButton(
              onPressed: () {
                _pageController.previousPage(
                    duration: _DurationUtility._durationLow,
                    curve: Curves.fastLinearToSlowEaseIn);
              },
              child: Icon(Icons.chevron_left),
            ),
            FloatingActionButton(
              onPressed: () {
                _pageController.nextPage(
                    duration: _DurationUtility._durationLow,
                    curve: Curves.fastLinearToSlowEaseIn);
              },
              child: Icon(Icons.chevron_right),
            ),
          ],
        ),
        appBar: AppBar(),
        body: PageView(
          padEnds: false,
          controller: _pageController,
          onPageChanged: _updatePageIndex,
          children: [
            const ListTileLearn(),
            Container(
              color: Colors.amber,
            ),
            Container(
              color: Colors.white70,
            )
          ],
        ));
  }
}

class _DurationUtility {
  static const _durationLow = Duration(seconds: 1);
}
