import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class GestureDetectorPage extends StatelessWidget {
  const GestureDetectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gesture Detector'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 500,
                width: MediaQuery.of(context).size.width * 0.8,
                color: Colors.red.withOpacity(0.2),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // シンプルなタップイベント
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 40.0),
                        color: Colors.green,
                        child: GestureDetector(
                          onTap: () {
                            dev.log('simply tapped but only on the child');
                          },
                          // 子ウィジェットのみタップイベントを検知する
                          behavior: HitTestBehavior.deferToChild,
                          child: const Text(
                            'tap only on the child',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          dev.log('tapped');
                        },
                        // opaque : an area of darkness
                        /// パディングについてもイベントを検知
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 40.0),
                          color: Colors.blue,
                          child: const Text(
                            'tap with opaque',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      // タップが離れるとイベント検知
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 40.0),
                        color: Colors.purple.shade200,
                        child: GestureDetector(
                          // ( )内のプロパティ名（ここではdetails）は好みで
                          onTapUp: (details) {
                            dev.log('onTapUp');
                            // details.globalPositionは、アプリ内の絶対位置を取得できる
                            /// 平面座標なので、x座標：dx(dimension x)とy座標；dy(dimension y)で取得
                            dev.log(
                                'position =>  ${details.globalPosition.dx} , ${details.globalPosition.dy}');
                            // details.kindは入力デバイスを識別
                            dev.log('kind of device => ${details.kind}');
                          },
                          behavior: HitTestBehavior.deferToChild,
                          child: const Text(
                            'onTapUp gesture',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // TextFormFieldのフォーカス解除のデモ
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'フォーム外タップでFocusNode解除',
                  ),
                  onChanged: (text) {
                    dev.log(text);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
