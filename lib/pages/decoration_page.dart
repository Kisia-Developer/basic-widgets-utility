import 'package:flutter/material.dart';

class DecorationPage extends StatelessWidget {
  const DecorationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container Decoration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // BoxDecorationで色つけ
            Container(
              width: 300,
              height: 90,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            //// 下記内容と一緒です。
            // Container(
            //   width: 300,
            //   height: 90,
            //   color: Colors.blueAccent,
            // ),
            ////
            // Borderをつける
            Container(
              width: 300,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                border: Border.all(
                  color: Colors.amber,
                  width: 5.0,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // BorderRadius with Colors
            Container(
              width: 300,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // BoxShadow
            Container(
              height: 90,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15.0,
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(10, 15),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // LinearGradient
            Container(
              height: 90,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.9, 0.0),
                  colors: [
                    Color(0xff00d500),
                    Color(0xffaaffaa),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // Flutterロゴを入れる
            Container(
              height: 80,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20.0),
                image: const DecorationImage(
                  // ここにはお好きな画像を入れてみてください。
                  image: AssetImage("assets/images/sample.jpeg"),
                  fit: BoxFit.cover,
                  opacity: 0.2,
                ),
              ),
              child: const Center(
                child: Text(
                  'TEXT',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
