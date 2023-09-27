import 'package:flutter/material.dart';
import 'package:flutter_realtime_test/services/auth.dart';
import 'package:flutter_realtime_test/services/custom_router.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Auth.loginUser(_emailController.text, _passwordController.text)
                    .then((value) {
                  if (value == "OK") {
                    Navigator.popAndPushNamed(context, CustomRouter.homepage);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(value),
                      ),
                    );
                  }
                });
              },
              child: const Text("Login")),
          ElevatedButton(
              onPressed: () {
                Auth.registerUser(
                        _emailController.text, _passwordController.text)
                    .then((value) {
                  if (value == "OK") {
                    Navigator.popAndPushNamed(context, CustomRouter.homepage);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(value),
                      ),
                    );
                  }
                });
              },
              child: const Text("Register"))
        ],
      ),
    );
  }
}
