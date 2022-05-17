import 'package:blocpatten/widget/date_picker_flair.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    // child = Container(
    //   child: Center(
    //     child: Text(
    //       'Main',
    //       style: TextStyle(fontSize: 18.0),
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  switchInCurve: Curves.easeIn,
                  switchOutCurve: Curves.easeOut,
                  transitionBuilder: (child, animation) {
                    return SlideTransition(
                      position: Tween<Offset>(
                              begin: Offset(1.2, 0), end: Offset(0, 0))
                          .animate(animation),
                      child: Text("Swip"),
                    );
                  },
                  // layoutBuilder: (currentChild, _) => currentChild!,
                  child: Dismissible(
                    key: UniqueKey(),
                    // resizeDuration: null,
                    onDismissed: _onHorizontalSwipe,
                    direction: DismissDirection.vertical,
                    child: Text("Swip"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onHorizontalSwipe(DismissDirection direction) {
    if (direction == DismissDirection.endToStart) {
      setState(() {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DatePicker(),
            ));
      });
    }
    // else {
    //   setState(() {
    //     child = Page2();
    //   });
    // }
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Center(
        child: Text(
          'Left side page',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Center(
        child: Text(
          'Right side page',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
