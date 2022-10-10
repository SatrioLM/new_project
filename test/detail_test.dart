import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_project/detail.dart';
import 'package:new_project/models/model.dart';

void main() {
  Widget toBeTested =
      MaterialApp(home: DetailPage(datum: Datum(1, "test", "testbody")));

  testWidgets("Detail Page", (WidgetTester tester) async {
    await tester.pumpWidget(toBeTested);

    //Verify there are exactly two text widgets
    expect(find.byType(Text), findsNWidgets(2));

    //Verify there is a single text widget contains title
    expect(find.text("test"), findsOneWidget);

    //Verify tehre is a single text widget conotains body
    expect(find.text("testbody"), findsOneWidget);
  });
}
