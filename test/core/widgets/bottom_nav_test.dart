import 'package:feature_weather/core/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  PageController pageController = PageController();
  testWidgets('click IconButton in nav button to move page 0', (tester) async {
     await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNav(controller: pageController),
        body: PageView(
          controller: pageController,
          children: [
            Container(),
            Container()
          ],
        ),
      )
     ));

     await tester.tap(find.widgetWithIcon(IconButton, Icons.home));
     await tester.pumpAndSettle();

     expect(pageController.page, 0);
  });
}