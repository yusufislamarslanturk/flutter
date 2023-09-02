import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/101/list_view_builder_learn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(
          useMaterial3: true,
        ).copyWith(
            listTileTheme:
                ListTileThemeData(contentPadding: EdgeInsets.zero),
            progressIndicatorTheme:
                ProgressIndicatorThemeData(color: Colors.white),
            splashColor: Colors.white70,
            appBarTheme: const AppBarTheme(
              centerTitle: true,
              systemOverlayStyle: SystemUiOverlayStyle.light,
              backgroundColor: Colors.black87,
              elevation: 0,
            )),
        home: const ListViewBuilderLearn());
  }
}
