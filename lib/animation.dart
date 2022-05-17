import 'package:blocpatten/widget/date_picker_flair.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimationState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimationStateState();
}

class AnimationStateState extends State<AnimationState>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0))
        .animate(controller!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Center(
            child: GestureDetector(
              onVerticalDragUpdate: (dragUpdateDetails) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DatePicker(),
                    ));
              },
            ),
            // child: ElevatedButton(
            //   onLongPress: () {},
            //   onPressed: () {
            //     // DatePicker();
            //     controller!.reverse();
            //   },
            //   child: Text("SWIP"),
            // ),
            // child: RaisedButton(
            //   child: Text('Show / Hide'),
            //   onPressed: () {
            //     switch (controller!.status) {
            //       case AnimationStatus.completed:
            //         controller!.reverse();
            //         break;
            //       case AnimationStatus.dismissed:
            //         controller!.forward();
            //         break;
            //       default:
            //     }
            //   },
            // ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: SlideTransition(
          //     position: offset,
          //     child: Padding(
          //       padding: EdgeInsets.all(50.0),
          //       child: Container(
          //         width: 800,
          //         height: 500,
          //         color: Colors.red,
          //         child: IconButton(
          //           onPressed: () {
          //             controller!.forward();
          //           },
          //           icon: Icon(Icons.clear),
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
