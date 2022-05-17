// import 'package:flutter/material.dart';
//
// class Swiped extends StatefulWidget {
//   const Swiped({Key? key}) : super(key: key);
//
//   @override
//   _SwipedState createState() => _SwipedState();
// }
//
// class _SwipedState extends State<Swiped> {
//   late double value;
//   @override
//   void initState() {
//     value = 0.0;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Expanded(child: Text('value = $value')),
//           Expanded(
//             child: Container(
//               color: Colors.red,
//               child: GestureDetector(
//                 onPanUpdate: (DragUpdateDetails details) {
//                   if (details.delta.dx > 0) {
//                     print('right swipe');
//                     //right scroll
//                     //increment counter
//                     setState(() {
//                       value += 0.1;
//                     });
//                   } else if (details.delta.dx < 0) {
//                     print('left swipe');
//                     //left scroll
//                     //decrement counter
//                     setState(() {
//                       value -= 0.1;
//                     });
//                   }
//                 },
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:blocpatten/widget/date_picker_flair.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwipeDetectorExample extends StatefulWidget {
  // final Function() onSwipeUp;
  // final Function() onSwipeDown;
  // final Widget child;

  // const SwipeDetectorExample( this.onSwipeUp,  this.onSwipeDown,  this.child);

  @override
  _SwipeDetectorExampleState createState() => _SwipeDetectorExampleState();
}

class _SwipeDetectorExampleState extends State<SwipeDetectorExample> {
  //Vertical drag details
  DragStartDetails? startVerticalDragDetails;
  DragUpdateDetails? updateVerticalDragDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: GestureDetector(
                  onVerticalDragStart: (dragDetails) {
                    startVerticalDragDetails = dragDetails;
                  },
                  onVerticalDragUpdate: (dragDetails) {
                    updateVerticalDragDetails = dragDetails;
                  },
                  onVerticalDragEnd: (endDetails) {
                    double dx = updateVerticalDragDetails!.globalPosition.dx -
                        startVerticalDragDetails!.globalPosition.dx;
                    double dy = updateVerticalDragDetails!.globalPosition.dy -
                        startVerticalDragDetails!.globalPosition.dy;
                    double? velocity = endDetails.primaryVelocity;

                    //Convert values to be positive
                    if (dx < 0) dx = -dx;
                    if (dy < 0) dy = -dy;

                    if (velocity! < 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DatePicker(),
                          ));
                    } else {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => DatePicker(),
                      //     ));
                    }
                  },
                  child: Text("SWIP")),
            ),
          ),
        ],
      ),
    );
  }
}
