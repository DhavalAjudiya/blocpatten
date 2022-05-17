import 'dart:convert';
import 'dart:developer';
import 'dart:io' as Io;
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class ImageToPdf extends StatefulWidget {
  const ImageToPdf({Key? key}) : super(key: key);

  @override
  State<ImageToPdf> createState() => _ImageToPdfState();
}

class _ImageToPdfState extends State<ImageToPdf> {
  String base64Image = "";
  String pickedImageFile = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell
              (
              onTap: () {
                pickImage();
              },
              child: Column(
                children: [
                  Container(
                    width: 400,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.cloud_upload),
                            Text(
                              "uploadImgOrFile",
                              style: TextStyle(fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 12,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.blue)),
                        onPressed:
                            () {

                            _convertImageToPDF();

                        },
                        child: Text(
                          pickedImageFile.toString(),
                          style: TextStyle(fontSize: 12, color: Colors.red,),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],),
      ),
      backgroundColor: Colors.grey,
    );
  }

  void pickImage() async {
    FilePickerResult? pickedImage =
    await FilePicker.platform.pickFiles(
        type: FileType.custom allowedExtensions: ['jpg', 'pdf', 'png', 'jpeg'],
        allowMultiple: false);

    final bytes = Io.File(pickedImage?.files.single.path ?? "")
        .readAsBytesSync();
    base64Image = base64Encode(bytes);
    if (pickedImage != null) {
      pickedImageFile = pickedImage.paths.first ?? "";
      log("path${pickedImageFile.length.toString()}");

    }
  }

  Future<List<int>> _readImageData(String name) async {
    final ByteData data = await rootBundle.load('images/$pickedImageFile');


    log("dadasd${pickedImageFile.length}");
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  Future<void> _convertImageToPDF() async {

    log("dadasd${pickedImageFile.length}");
    PdfDocument document = PdfDocument();
    log("-0-0-0-0-0-0-0-");

    PdfPage page = document.pages.add();
    log("-11-");

    final PdfImage image =
    PdfBitmap(await _readImageData('Autumn Leaves.jpg'));
    log("-22-");

    page.graphics.drawImage(
        image, Rect.fromLTWH(0, 0, page.size.width, page.size.height));
    log("-33-");

    List<int> bytes = document.save();
    document.dispose();
    log("bytes$bytes");


  }
}









