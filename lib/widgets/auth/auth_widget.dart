import 'package:flutter/material.dart';
import 'package:moviedb/theme/app_btn_style.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("login to account")),
      ),
      body: ListView(children: const [_HeaderWidget()]),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16, color: Colors.black);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          const _FormWidget(),
          const SizedBox(height: 25),
          const Text(
            'In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple.',
            style: textStyle,
          ),
          const SizedBox(height: 5),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: const Text('Register'),
          ),
          const SizedBox(height: 25),
          const Text(
            "If you signed up but didn't get your verification email",
            style: textStyle,
          ),
          const SizedBox(height: 5),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: const Text('Verify email'),
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  String? errorText;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;
      //Navigator.of(context).pushNamed('/main_screen');
      Navigator.of(context).pushReplacementNamed('/main_screen');
    } else {
      errorText = 'Неверный логин или пароль';
      // ignore: avoid_print
      print("shoe error");
    }
    setState(() {});
  }

  void _resetPassword() {
    // ignore: avoid_print
    print('reset password');
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16, color: Color(0xFF212529));
    const color = Color(0xFF0184E4);
    const textFieldDecoration = InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      isCollapsed: true,
    );
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
            errorText,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 15),
        ],
        const Text(
          'Username',
          style: textStyle,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecoration,
        ),
        const SizedBox(height: 20),
        const Text(
          'Password',
          style: textStyle,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecoration,
          obscureText: true,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            ElevatedButton(
              onPressed: _auth,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(color),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  textStyle: MaterialStateProperty.all(const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700)),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  )),
              child: const Text("Login"),
            ),
            const SizedBox(width: 30),
            TextButton(
              onPressed: _resetPassword,
              style: AppButtonStyle.linkButton,
              child: const Text("Reset password"),
            ),
          ],
        ),
      ],
    );
  }
}
