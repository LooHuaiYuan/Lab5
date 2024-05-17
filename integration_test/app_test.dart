import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:lab5_2/main.dart' as app;

void main(){
  group('App Test', () {

    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('full app test', (tester) async{
      app.main();
      await tester.pumpAndSettle();

      final emailFormField = find.byKey(Key("email"));
      final agree = find.byType(Checkbox);
      final activateButton = find.byKey(Key("activate"));

      final otpFormField = find.byKey(Key("otp"));
      final otpButton = find.byKey(Key("otpButton"));

      final person = find.byIcon(Icons.person);
      final add = find.byKey(Key("addButton"));
      final nameFormField = find.byKey(Key("name"));
      final phoneFormField = find.byKey(Key("phone"));
      final submit = find.byKey(Key("submit"));

      final home = find.byIcon(Icons.home_outlined);
      final setting = find.byIcon(Icons.settings).last;

      final factory1 = find.byKey(Key("factory1"));
      final factory2 = find.byKey(Key("factory2"));
      final factory3 = find.byKey(Key("factory3"));

      await tester.enterText(emailFormField, "loohuaiyuan@gmial.com");
      await tester.tap(agree);
      await tester.tap(activateButton);
      await tester.pumpAndSettle();

      await tester.enterText(otpFormField, "113677");
      await tester.tap(otpButton);
      await tester.pumpAndSettle();

      await tester.tap(add);
      expect(actual, matcher)
      await tester.enterText(nameFormField, "Alex");
      await tester.enterText(phoneFormField, "1110432199");
      await tester.tap(submit);

      await tester.tap(setting);
      await tester.pumpAndSettle();
      await tester.tap(factory2);
      await tester.pumpAndSettle();
      await tester.tap(factory1);
      await tester.pumpAndSettle();

      await tester.tap(home);
      await tester.pumpAndSettle();
      await tester.tap(factory2);
      await tester.pumpAndSettle();
      await tester.tap(factory1);
      await tester.pumpAndSettle();


    });
  });
}