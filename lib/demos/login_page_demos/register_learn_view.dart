import 'package:flutter/material.dart';
import 'package:flutter_full_learn/demos/login_page_demos/login_page.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: const Text(
            'Kayıt Ol',
            style: TextStyle(color: Colors.white),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
              child: Image.asset('assets/png/logo.png',
                  height: 175, width: 175),
            ),
            const _header(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _InputTextField(
                labelText: 'Kullanici Adi',
                password: false,
                autoFill: const [AutofillHints.name],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _InputTextField(
                  labelText: 'Email',
                  password: false,
                  autoFill: const [AutofillHints.email]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _InputTextField(
                labelText: 'Parola',
                password: false,
                autoFill: null,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _InputTextField(
                  labelText: 'Parola Tekrar',
                  password: true,
                  autoFill: null,
                )),
            const _LoginButton()
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
// ignore: must_be_immutable
class _InputTextField extends StatefulWidget {
  _InputTextField(
      {required this.labelText,
      required this.password,
      required this.autoFill});
  final String labelText;
  final bool password;
  // ignore: prefer_typing_uninitialized_variables
  final autoFill;

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
      autofillHints: widget.autoFill,
      textInputAction: TextInputAction.next,
      cursorColor: Colors.amber,
      obscureText: !isSecured,
      decoration: InputDecoration(
        focusColor: Colors.green,
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber)),
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}

// ignore: camel_case_types
class _header extends StatelessWidget {
  const _header();

  @override
  Widget build(BuildContext context) {
    return Text('Kullanıcı Kayıt',
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 46,
            fontFamily: 's3'));
  }
}

class _LoginButton extends StatefulWidget {
  const _LoginButton();

  @override
  State<_LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<_LoginButton> {
  // ignore: non_constant_identifier_names
  Future<void> Register() async {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
        content: Text(
          'Kayit Basarili Giris Icin Ana Ekrana Yonlendiriliyorsunuz...',
          textAlign: TextAlign.center,
        )));
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) {
            return const LoginPage();
          },
          fullscreenDialog: true,
          settings: const RouteSettings()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)),
          shadowColor: Colors.amberAccent,
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        onPressed: () {
          Register();
        },
        child: const Text('Kayıt Ol'));
  }
}
