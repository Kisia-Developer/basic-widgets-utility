import 'package:flutter/material.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 色付きボタン
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                // ボタンの背景色
                primary: Colors.blue,
                // ボタンの文字色
                onPrimary: Colors.white,
              ),
              onPressed: () {},
              child: const Text('色付きボタン'),
            ),
            const SizedBox(
              height: 10,
            ),
            //  楕円ボタン
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                onPrimary: Colors.black,
                shape: const StadiumBorder(),
              ),
              onPressed: () {},
              child: const Text('横丸ボタン'),
            ),
            const SizedBox(
              height: 10,
            ),
            // 外枠ボーターの横丸ボタン
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                shape: const StadiumBorder(),
                side: const BorderSide(color: Colors.green),
              ),
              onPressed: () {},
              child: const Text('外枠ボーダー'),
            ),
            const SizedBox(
              height: 10,
            ),
            // アイコン入り
            ElevatedButton.icon(
              icon: const Icon(
                Icons.flutter_dash,
                color: Colors.white,
              ),
              label: const Text('アイコン入り '),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
              ),
              onPressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            // テキストボタン
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black,
              ),
              onPressed: () {},
              child: const Text('テキストボタン'),
            ),
            const SizedBox(
              height: 10,
            ),
            // グラデーション
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
              ),
              onPressed: () {},
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Colors.orange.shade300,
                      Colors.orange.shade700,
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: const Text('グラデーション'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // オシャレ？グラデーション
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
              ),
              onPressed: () {},
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    radius: 0.6,
                    colors: <Color>[
                      Colors.orange.shade300,
                      Colors.orange.shade700,
                    ],
                    tileMode: TileMode.repeated,
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: const Text('グラデーション'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // アイコンボタン
            Ink(
              decoration: const ShapeDecoration(
                color: Colors.lightBlue,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(Icons.android),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
