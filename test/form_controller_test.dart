import 'package:appscrip1/form_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'Given c is 1 and d is 2 whne login is called then naviagte to next page',
      (tester) async {
    final form = FormController();
    // ignore: cascade_invocations
    form.login();
  });
}
