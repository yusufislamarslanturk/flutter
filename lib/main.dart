import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/demos/login_page_demos/login_page.dart';

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
        theme: ThemeData(useMaterial3: true).copyWith(
            actionIconTheme: ActionIconThemeData(
                closeButtonIconBuilder: (context) => const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    )),
            tabBarTheme: const TabBarTheme(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab),
            listTileTheme: const ListTileThemeData(
                contentPadding: EdgeInsets.zero),
            progressIndicatorTheme:
                const ProgressIndicatorThemeData(color: Colors.white),
            splashColor: Colors.white70,
            appBarTheme: const AppBarTheme(
              centerTitle: true,
              systemOverlayStyle: SystemUiOverlayStyle.light,
              // Color.fromARGB(255, 140, 94, 20)
              backgroundColor: Colors.black,
              elevation: 0,
            )),
        home: const LoginPage());
  }
}
