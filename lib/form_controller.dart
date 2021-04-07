import 'package:appscrip1/blank_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  var checkColor = Colors.black.obs;
  int c = 0, d = 0; //to check the update status of the validators
  void updateColor(Rx<Color> color) {
    checkColor = color;
  }

  void checkEmail(String email) {
    //validates the email
    if (email.isEmpty) {
      print('Email cannot be empty');
    } else if (EmailValidator.validate(email) == false) {
      print('Email Invalid');
    } else {
      c = 1;//update
      update();
    }
  }

  void checkPassword(String password) {
    //validates the password
    if (password.isEmpty) {
      print('Password cannot be empty');
    } else if (password.length < 6 ||
        !password.contains(RegExp(r'[A-Z]')) ||
        !password.contains(RegExp(r'[0-9]')) ||
        !password.contains(RegExp(r'[^<>()[\]\\.,;:\s@\"!]'))) {
      updateColor(Colors.black.obs);
      print('Conditions not fulfilled');
      update();
    } else {
      d = 2; //update
      updateColor(Colors.green.obs);
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
