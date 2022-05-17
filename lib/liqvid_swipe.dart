import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class ItemData {
  final Color color;
  final String image;
  final String text1;
  final String text2;
  final String text3;

  ItemData(this.color, this.image, this.text1, this.text2, this.text3);
}

class WithBuilder extends StatefulWidget {
  @override
  _WithBuilder createState() => _WithBuilder();
}

class _WithBuilder extends State<WithBuilder> {
  int page = 0;
  LiquidController? liquidController;
  UpdateType? updateType;
  List<ItemData> data = [
    ItemData(Colors.blue, "assets/1.png", "Hi", "It's Me", "Sahdeep"),
    ItemData(Colors.deepPurpleAccent, "assets/1.png", "Take a", "Look At",
        "Liquid Swipe"),
    ItemData(Colors.green, "assets/1.png", "Liked?", "Fork!", "Give Star!"),
    ItemData(Colors.yellow, "assets/1.png", "Can be", "Used for",
        "Onboarding design"),
    ItemData(Colors.red, "assets/1.png", "Do", "try it", "Thank you"),
  ];
  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return new Container(
      width: 25.0,
      child: new Center(
        child: new Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: new Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            LiquidSwipe.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  color: data[index].color,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      // Image.asset(
                      //   data[index].image,
                      //   height: 400,
                      //   fit: BoxFit.contain,
                      // ),
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            data[index].text1,
                            // style: WithPages.style,
                          ),
                          Text(
                            data[index].text2,
                            // style: WithPages.style,
                          ),
                          Text(
                            data[index].text3,
                            // style: WithPages.style,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              // positionSlideIcon: 0.8,
              // slideIconWidget: const Icon(Icons.arrow_back_ios),
              onPageChangeCallback: pageChangeCallback,
              liquidController: liquidController,
              fullTransitionValue: 880,
              enableSideReveal: true,
              // enableLoop: true,
              // ignoreUserGestureWhileAnimating: true,
              // ),
              // Padding(
              //   padding: EdgeInsets.all(20),
              //   child: Column(
              //     children: <Widget>[
              //       Expanded(child: SizedBox()),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: List<Widget>.generate(data.length, _buildDot),
              //       ),
              //     ],
              //   ),
              // ),
              // Align(
              //   alignment: Alignment.bottomRight,
              //   child: Padding(
              //     padding: const EdgeInsets.all(25.0),
              //     child: FlatButton(
              //       onPressed: () {
              //         liquidController!
              //             .animateToPage(page: data.length - 1, duration: 700);
              //       },
              //       child: Text("Skip to End"),
              //       color: Colors.white.withOpacity(0.01),
              //     ),
              //   ),
              // ),
              // Align(
              //   alignment: Alignment.bottomLeft,
              //   child: Padding(
              //     padding: const EdgeInsets.all(25.0),
              //     child: FlatButton(
              //       onPressed: () {
              //         liquidController!.jumpToPage(
              //             page:
              //                 liquidController!.currentPage + 1 > data.length - 1
              //                     ? 0
              //                     : liquidController!.currentPage + 1);
              //       },
              //       child: Text("Next"),
              //       color: Colors.white.withOpacity(0.01),
              //     ),
              //   ),
            )
          ],
        ),
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
