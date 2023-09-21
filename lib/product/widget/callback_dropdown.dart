import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/call_back_learn.dart';

class CallBackDropDown extends StatefulWidget {
  const CallBackDropDown({super.key, required this.onUserSelected});

  final void Function(CallBackUser user) onUserSelected;

  @override
  State<CallBackDropDown> createState() => _CallBackDropDownState();
}

class _CallBackDropDownState extends State<CallBackDropDown> {
  CallBackUser? _user;
  // ignore: non_constant_identifier_names
  void _updateUser(CallBackUser? Item) {
    setState(() {
      _user = Item;
    });
    if (_user != null) {
      widget.onUserSelected.call(_user!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CallBackUser>(
        value: _user,
        items: CallBackUser.dummyUsers().map((e) {
          return DropdownMenuItem(
            value: e,
            child: Text(e.name),
          );
        }).toList(),
        onChanged: _updateUser);
  }
}
