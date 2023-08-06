import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BottomNav extends StatelessWidget {
  final PageController controller;
  const BottomNav({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      color: primaryColor,
      child: SizedBox(
          height: 63,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    controller.animateToPage(0,
                        duration: const Duration(microseconds: 300),
                        curve: Curves.easeInOut);
                  },
                  icon: const Icon(Icons.home)),
              const SizedBox(),
              IconButton(
                  onPressed: () {
                    controller.animateToPage(1,
                        duration: const Duration(microseconds: 300),
                        curve: Curves.easeInOut);
                  },
                  icon: const Icon(Icons.bookmark)),
            ],
          )),
    );
  }
}
