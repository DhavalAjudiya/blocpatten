import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

late List<CameraDescription> cameras;

class CameraApp extends StatefulWidget {
  const CameraApp({Key? key}) : super(key: key);

  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;
  bool showFocusCircle = false;
  double x = 0;
  double y = 0;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return GestureDetector(
        onTapUp: (details) {
          _onTap(details);
        },
        child: Stack(
          children: [
            Center(child: CameraPreview(controller)),
            if (showFocusCircle)
              Positioned(
                  top: y - 20,
                  left: x - 20,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1.5)),
                  ))
          ],
        ));
  }

  Future<void> _onTap(TapUpDetails details) async {
    if (controller.value.isInitialized) {
      showFocusCircle = true;
      x = details.localPosition.dx;
      y = details.localPosition.dy;

      double fullWidth = MediaQuery.of(context).size.width;
      double cameraHeight = fullWidth * controller.value.aspectRatio;

      double xp = x / fullWidth;
      double yp = y / cameraHeight;

      Offset point = Offset(xp, yp);
      print("point : $point");

      // Manually focus
      await controller.setFocusPoint(point);

      // Manually set light exposure
      //controller.setExposurePoint(point);

      setState(() {
        Future.delayed(const Duration(seconds: 2)).whenComplete(() {
          setState(() {
            showFocusCircle = false;
          });
        });
      });
    }
  }
}
// import 'package:adv_camera/adv_camera.dart';
// import 'package:flutter/material.dart';
//
// class CameraApp extends StatefulWidget {
//   final String id;
//
//   const CameraApp({Key? key, required this.id}) : super(key: key);
//
//   @override
//   _CameraAppState createState() => _CameraAppState();
// }
//
// class _CameraAppState extends State<CameraApp> {
//   List<String> pictureSizes = <String>[];
//   String? imagePath;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('AdvCamera Example'),
//       ),
//       body: SafeArea(
//         child: AdvCamera(
//           initialCameraType: CameraType.rear,
//           onCameraCreated: _onCameraCreated,
//           onImageCaptured: (String path) {
//             if (this.mounted)
//               setState(() {
//                 imagePath = path;
//               });
//           },
//           cameraPreviewRatio: CameraPreviewRatio.r16_9,
//           focusRectColor: Colors.purple,
//           focusRectSize: 200,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         heroTag: "capture",
//         child: Icon(Icons.camera),
//         onPressed: () {
//           cameraController!.captureImage();
//         },
//       ),
//     );
//   }
//
//   AdvCameraController? cameraController;
//
//   _onCameraCreated(AdvCameraController controller) {
//     this.cameraController = controller;
//
//     this.cameraController!.getPictureSizes().then((pictureSizes) {
//       setState(() {
//         this.pictureSizes = pictureSizes ?? <String>[];
//       });
//     });
//   }
// }
