import 'package:appscrip1/constants.dart';
import 'package:appscrip1/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class LoginScreen extends StatelessWidget {
  final _controller = Get.put(FormController()); //object
  TextEditingController em = TextEditingController(); //email controller
  TextEditingController pass = TextEditingController();
  Widget checkMarks() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Obx(
                  () => Icon(
                    Icons.check_circle_rounded,
                    color: _controller.checkColor.value,
                  ),
                ),
                const Text('More than\n 6 characters'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Obx(
                  () => Icon(
                    Icons.check_circle_rounded,
                    color: _controller.checkColor.value,
                  ),
                ),
                const Text('One special\n character'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Obx(
                  () => Icon(
                    Icons.check_circle_rounded,
                    color: _controller.checkColor.value,
                  ),
                ),
                const Text('one\ndigit'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Obx(
                  () => Icon(
                    Icons.check_circle_rounded,
                    color: _controller.checkColor.value,
                  ),
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
          child: GetBuilder<FormController>(
            builder: (_) => _.c == 1 && _.d == 2
                ? Container()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextField(
                          controller: em,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            _controller.checkEmail(value);
                          },
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Enter your email')),
                      const SizedBox(
                        height: 8.0,
                      ),
                      TextField(
                          controller: pass,
                          obscureText: true,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.black),
                          onChanged: (value) {
                            _controller.checkPassword(value);
                          },
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Enter your password'),),
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
                              _controller.login();
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
