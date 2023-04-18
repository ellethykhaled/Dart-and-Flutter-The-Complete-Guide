import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin: const EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      validator: validateEmail,
      onSaved: (newValue) {
        email = newValue!;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      validator: validatePassword,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      onSaved: (newValue) {
        password = newValue!;
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      child: const Text('Submit!'),
      onPressed: () {
        if (formKey.currentState?.validate() == true) {
          formKey.currentState?.save();
          print('Time to post $email and $password to my API');
        }
      },
    );
  }
}
