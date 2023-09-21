// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/widget/button/answer_button.dart';
import 'package:flutter_full_learn/product/widget/button/loading_button.dart';
import 'package:flutter_full_learn/product/widget/callback_dropdown.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({super.key});

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Call Back'),
      ),
      body: Column(
        children: [
          CallBackDropDown(onUserSelected: (CallBackUser user) {
            // ignore: avoid_print
            print(user.id);
          }),
          AnswerButton(onNumber: (number) {
            return number % 3 == 1;
          }),
          LoadingButton(
            title: 'Loading Button',
            onPressed: () async {
              await Future.delayed(const Duration(seconds: 5));
            },
          )
        ],
      ),
    );
  }
}

class CallBackUser {
  final String name;
  final String id;

  CallBackUser(this.name, this.id);

  static List<CallBackUser> dummyUsers() {
    return [CallBackUser('ysf', '123'), CallBackUser('ysf2', '124')];
  }

  @override
  bool operator ==(covariant CallBackUser other) {
    if (identical(this, other)) return true;

    return other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
