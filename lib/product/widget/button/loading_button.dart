import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton(
      {super.key, required this.title, required this.onPressed});
  final String title;
  final Future<void> Function() onPressed;
  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool _isLoading = false;

  // ignore: non_constant_identifier_names
  void _ChangeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (_isLoading) return;
        _ChangeLoading();
        await widget.onPressed.call();
        _ChangeLoading();
      },
      child: _isLoading
          ? const SpinKitCircle(
              duration: Duration(seconds: 1),
              color: Colors.white,
            )
          : Center(child: Text(widget.title)),
    );
  }
}
