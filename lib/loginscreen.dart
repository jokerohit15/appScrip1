import 'package:appscrip1/blank_screen.dart';
import 'package:appscrip1/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class LoginScreen extends StatelessWidget {
  String email;
  String password;
  bool showSpinner = false;
  final _formKey = GlobalKey<FormState>();
  Color checkColor = Colors.black;
  Widget checkMarks() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  color: checkColor,
                ),
                const Text('More than\n 6 characters'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  color: checkColor,
                ),
                const Text('One special\n character'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  color: checkColor,
                ),
                const Text('one\ndigit'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  color: checkColor,
                ),
                const Text('one upper \n case'),
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Email cannot be empty';
                      } else if (EmailValidator.validate(value) == false) {
                        return 'Email Invalid';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your email')),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Password cannot be empty';
                      } else if (value.length > 6 ||
                          !value.contains(RegExp(r'[A-Z]')) ||
                          !value.contains(RegExp(r'[0-9]')) ||
                          !value.contains(RegExp(r'[^<>()[\]\\.,;:\s@\"!]'))) {
                        return 'Conditions not fulfilled';
                      }
                      checkColor = Colors.green;
                      return null;
                    },
                    obscureText: true,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your password')),
                checkMarks(),
                const SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    elevation: 5.0,
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Get.to(BlankScreen());
                        }
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
