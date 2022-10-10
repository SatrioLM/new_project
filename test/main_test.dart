import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_project/detail.dart';

import 'package:new_project/models/model.dart';
import 'package:new_project/widgets/list_item.dart';
import 'package:new_project/widgets/simple_search_bar.dart';

void main() {
  mockFunction(String s) => () {};
  TextEditingController mockcontroller = TextEditingController();
  List<Datum> items = [Datum(1, "test", "testbody")];

  Widget toBetested = MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
          children: [
            SimpleSearchBar(
                filterFunction: mockFunction,
                textEditingController: mockcontroller),
            ListItem(items)
          ],
        ),
      ),
    ),
  );

  testWidgets("Search Bar", (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(toBetested);

    // Verify there is only a single textfield of search bar.
    expect(find.widgetWithIcon(TextField, Icons.search), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });
  testWidgets("Item List", (WidgetTester tester) async {
    await tester.pumpWidget(toBetested);

    //Verify there is only a single listview widget
    expect(find.byType(ListView), findsOneWidget);

    //Verify there is only a single listtile inside of listview
    expect(
        find.descendant(
            of: find.byType(ListView),
            matching: find.widgetWithText(ListTile, "test")),
        findsOneWidget);

    //Tap the listtile
    await tester.tap(find.descendant(
        of: find.byType(ListView),
        matching: find.widgetWithText(ListTile, "test")));
    await tester.pumpAndSettle();

    //Verify page changes
    expect(find.byType(DetailPage), findsOneWidget);
  });
}
