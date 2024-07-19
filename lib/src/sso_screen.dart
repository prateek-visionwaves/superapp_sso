import 'package:flutter/material.dart';

abstract class SsoScreen extends StatelessWidget {

  final String title = 'SSO Screen';
  final String content = 'Login with super app';
  const SsoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: ElevatedButton(onPressed: onLogin, child: const Text('Login'),),
      ),
    );
  }

  void onLogin();
}