import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/list_tile_learn.dart';
import 'package:flutter_full_learn/demos/login_page_demos/visible_eye.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with _projectUtilities {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          const Text('Kayıt Ol',
              style: TextStyle(color: Colors.white)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.door_back_door_outlined,
                  color: Colors.white)),
        ],
        title: const Text(_projectUtilities.title,
            style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/png/logo.png',
                height: 175, width: 175),
          ),
          _header(),
          Padding(
            padding: _projectPadding.simetrik,
            child: _InputTextField(
              labelText: 'Kullanıcı Adı',
              password: true,
            ),
          ),
          Padding(
            padding: _projectPadding.simetrik,
            child:
                _InputTextField(labelText: 'Parola', password: false),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const _LoginButton(),
          ),
        ],
      ),
    );
  }
}

class _header extends StatelessWidget {
  const _header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Kullanıcı Girişi',
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 46,
            fontFamily: 's3'));
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)),
          fixedSize: const Size(110, 40),
          shadowColor: Colors.amberAccent,
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) {
                  return const ListTileLearn();
                },
                fullscreenDialog: true,
                settings: const RouteSettings()),
          );
        },
        child: const Text('Giriş Yap'));
  }
}

// ignore: must_be_immutable
class _InputTextField extends StatefulWidget {
  _InputTextField(
      {super.key, required this.labelText, required this.password});
  final String labelText;
  final bool password;
  bool isSecured = false;
  @override
  State<_InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<_InputTextField> {
  bool isSecured = true;
  bool password() {
    if (widget.password) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      cursorColor: Colors.amber,
      obscureText: !isSecured,
      decoration: InputDecoration(
        focusColor: Colors.green,
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber)),
        suffixIcon: password()
            ? null
            : VisibleEyeButton(onChanged: (value) {
                password();
                setState(() {
                  isSecured = value;
                });
              }),
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}

mixin _projectUtilities {
  static const String title = 'Agartha ERP';
}

class _projectPadding {
  static const EdgeInsetsGeometry simetrik =
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10);
}
