import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/product/language/language_items.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  final key = GlobalKey();
  final focusNodeTextFieldOne = FocusNode();
  final focusNodeTextFieldTwo = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            children: [
              TextField(
                buildCounter: (context,
                    {int? currentLength,
                    bool? isFocused,
                    int? maxLength}) {
                  return _animatedContainer(currentLength);
                },
                focusNode: focusNodeTextFieldOne,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                textInputAction: TextInputAction.next,
                decoration: _inputDecoration().mailDecoration,
              ),
              TextField(
                focusNode: focusNodeTextFieldTwo,
              )
            ],
          ),
        ));
  }

  AnimatedContainer _animatedContainer(int? currentLength) {
    return AnimatedContainer(
      key: key,
      width: 10.0 * (currentLength ?? 0),
      height: 20,
      color: Colors.amber,
      duration: const Duration(milliseconds: 1),
    );
  }
}

class _inputDecoration {
  final mailDecoration = const InputDecoration(
      prefixIcon: Icon(Icons.mail),
      border: OutlineInputBorder(),
      labelText: LanguageItems.mailTitle,
      labelStyle: TextStyle(fontSize: 20));
}
