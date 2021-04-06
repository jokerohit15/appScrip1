import 'package:appscrip1/blank_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  var checkColor = Colors.black.obs;
  int c = 0, d = 0; //to check the update status of the validators
  void updateColor(Color color) {
    checkColor = color.obs;
  }

  void checkEmail(String value) {
    //validates the email
    if (value.isEmpty) {
      print('Email cannot be empty');
    } else if (EmailValidator.validate(value) == false) {
      print('Email Invalid');
    } else {
      c = 1; //update
      update();
    }
  }

  void checkPassword(String value) {
    //validates the password
    if (value.isEmpty) {
      print('Password cannot be empty');
    } else if (value.length > 6 ||
        !value.contains(RegExp(r'[A-Z]')) ||
        !value.contains(RegExp(r'[0-9]')) ||
        !value.contains(RegExp(r'[^<>()[\]\\.,;:\s@\"!]'))) {
      updateColor(Colors.black);
      print('Conditions not fulfilled');
      update();
    } else {
      d = 2; //update
      updateColor(Colors.green);
      update();
    }
  }

  void login() {
    //checks the form validation and navigates
    print(c + d);
    if (c == 1 && d == 2 && checkColor == Colors.green.obs) {
      Get.to<Navigator>(BlankScreen()); //Navigates to the other page
    }
  }
}
