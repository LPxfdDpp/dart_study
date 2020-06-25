import 'package:flutter/cupertino.dart';
import 'package:phone_study/main.dart';
import 'package:flutter_test/flutter_test.dart';



void main(){


    testWidgets('playaround', (tester) async{
        await tester.pumpWidget(Phone_study());

        expect(find.byType(Transform),findsOneWidget);
    });



}