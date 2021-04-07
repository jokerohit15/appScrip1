import 'package:appscrip1/blank_screen.dart';
import 'package:appscrip1/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

final form = FormController();

void main() {
  test('Given color = Colors.green then checkColor = Colors.green.obs',
      () async {
    //Arrange
    Rx<Color> color = Colors.green.obs;
//Act
    form.updateColor(color);
//Assert
    expect(form.checkColor, Colors.green.obs);
  });
  test('Given email is rohit@g.com then c=1', () async {
    //Arrange
    var email = 'rohit@gmail.com';

//Act
    form.checkEmail(email);
//Assert
    expect(form.c, 1);
  });

  test('Given password = Rohit_09 then d=2', () async {
    //Arrange
    var password = 'Rohit_09';
//Act

    form.checkPassword(password);
//Assert

    expect(form.d, 2);
  });
  test('Given c=1 ,d=2 and color =Color.green.obs then currentRoute = BlankScreen ', () async {
    //Arrange

//Act

    form.login();
//Assert
    expect(Get.currentRoute, BlankScreen());
  });
}
