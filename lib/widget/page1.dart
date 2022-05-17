import 'package:blocpatten/widget/date_picker_flair.dart';
import 'package:blocpatten/widget/page2.dart';
import 'package:flutter/material.dart';

class PageSwipe1 extends StatefulWidget {
  const PageSwipe1({Key? key}) : super(key: key);

  @override
  State<PageSwipe1> createState() => _PageSwipe1State();
}

class _PageSwipe1State extends State<PageSwipe1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Dismissible(
        resizeDuration: Duration(seconds: 2),
        // onResize: () {
        //   Navigator.of(context)
        //       .push(MaterialPageRoute(builder: (context) => DatePicker()));
        // },
        background: Container(color: Colors.green),
        // onUpdate: (DismissUpdateDetails d) {
        //   Navigator.of(context)
        //       .push(MaterialPageRoute(builder: (context) => DatePicker()));
        // },
        direction: DismissDirection.up,
        onDismissed: (direction) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DatePicker()));
        },
        key: Key(""),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Center(
                child: Text("Swipe"),
                // child: Dismissible(
                //   background: Container(color: Colors.green),
                //   onUpdate: (DismissUpdateDetails d) {
                //     Navigator.of(context).push(
                //         MaterialPageRoute(builder: (context) => DatePicker()));
                //   },
                //   direction: DismissDirection.up,
                //   onDismissed: (direction) {},
                //   key: Key(""),
                //   child: Text("Swipe"),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
