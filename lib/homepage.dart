// ignore_for_file: non_constant_identifier_names
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:human_genx/sketchpad.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<DrawingArea> points = [];
  Widget? predict;
  void display(String obe) async {
    Uint8List cb = base64Decode(obe);
    setState(() {
      // ignore: sized_box_for_whitespace
      predict = Container(
        width: 256,
        height: 256,
        child: Image.memory(
          cb,
          fit: BoxFit.cover,
        ),
      );
    });
  }

  void savepng(List<DrawingArea> points) async {
    final recorder = PictureRecorder();
    final canvas = Canvas(recorder,
        Rect.fromPoints(const Offset(0.0, 0.0), const Offset(200, 200)));
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0;
    final paint2 = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black;

    canvas.drawRect(const Rect.fromLTWH(0, 0, 256, 256), paint2);
    for (var i = 0; i < points.length - 1; i++) {
      if (points[i].point != Offset.zero &&
          points[i + 1].point != Offset.zero) {
        canvas.drawLine(points[i].point, points[i + 1].point, paint);
      }
    }
    final pic = recorder.endRecording();
    final img = await pic.toImage(256, 256);
    final byteData = await img.toByteData(format: ImageByteFormat.png);
    final Uint8List listbyte = byteData!.buffer.asUint8List();
    String babe = base64Encode(listbyte);
    get_out(babe);
  }

  void get_out(var image) async {
    var data = {"image": image};
    var url = Uri.parse('http:1200');
    Map<String, String> headers = {
      "Content-type": 'application/json',
      "Accept": 'application/json',
      "Connection": "Keep-alive",
    };
    var body = json.encode(data);
    try {
      var response = await http.post(url, body: body, headers: headers);
      final Map<String, dynamic> par = json.decode(response.body);
      String ans = par['predictions'];
      display(ans.substring(2, ans.length - 1));
    } catch (e) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: Colors.accents,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 5.0,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: GestureDetector(
                      onPanDown: (details) {
                        setState(
                          () {
                            points.add(DrawingArea(
                                point: details.localPosition,
                                areaPaint: Paint()
                                  ..strokeCap = StrokeCap.round
                                  ..isAntiAlias = true
                                  ..color = Colors.white
                                  ..strokeWidth = 2.0));
                          },
                        );
                      },
                      onPanUpdate: (details) {
                        setState(
                          () {
                            points.add(DrawingArea(
                                point: details.localPosition,
                                areaPaint: Paint()
                                  ..strokeCap = StrokeCap.round
                                  ..isAntiAlias = true
                                  ..color = Colors.white
                                  ..strokeWidth = 2.0));
                          },
                        );
                      },
                      onPanEnd: (details) {
                        savepng(points);
                        setState(() {
                          // Add a unique value to indicate the end of drawing
                          points.add(DrawingArea(
                            point: Offset.zero,
                            // You can use a specific point or create a unique identifier
                            areaPaint: Paint()
                              ..color = Colors
                                  .transparent, // Make it transparent or use a different color
                          ));
                        });
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          child: CustomPaint(
                            painter: My_TouchPad(points: points),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            points.clear();
                          });
                        },
                        icon: const Icon(Icons.delete),
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Center(
                    child: SizedBox(
                      height: 256,
                      width: 256,
                      child: predict,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
