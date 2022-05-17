import 'package:flutter/material.dart';

class PageSwipe2 extends StatelessWidget {
  const PageSwipe2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: (DragStartDetails details) {},
      onVerticalDragUpdate: (details) {},
      onHorizontalDragUpdate: (details) {
        if (details.delta.direction <= 0) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        body: Center(
          child: Container(color: Colors.yellow),
        ),
      ),
    );
  }
}
