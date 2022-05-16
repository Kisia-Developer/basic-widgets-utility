import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Simple Dialog
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: const Text("Simple Dialogを選びます"),
                      children: <Widget>[
                        // コンテンツ領域
                        SimpleDialogOption(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Simple Dialog"),
                        ),
                        const SimpleDialogOption(
                          child: Text("Spimle Dialog"),
                        ),
                        const SimpleDialogOption(
                          child: Text("Smplie Dialog"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text(
                'Simple Dialog',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // AlertDialog
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Alert Dialog"),
                      content: const Text("ここにメッセージ詳細"),
                      actions: <Widget>[
                        // ボタン領域
                        TextButton(
                          child: const Text("Cancel"),
                          onPressed: () => Navigator.pop(context),
                        ),
                        TextButton(
                          child: const Text("OK"),
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text('OKが押されました'),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                  // ここを追加すると、cancelボタンのみで閉じることができる
                  barrierDismissible: false,
                );
              },
              child: const Text(
                'Alert Dialog',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // CupertinoAlertDialog
            /// CupertinoDialogはDeprecatedではないらしい
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: const Text("Cupertino Alert"),
                      content: const Text("Cupertinoは地名です"),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: const Text("cancel"),
                          onPressed: () => Navigator.pop(context),
                        ),
                        CupertinoDialogAction(
                          child: const Text("そうなのね！"),
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text('そうなんですよね〜'),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text(
                'CupertinoDialog',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // CupertinoModalPopup : for iOS
            // modal_bottom_sheetというpackageでも実装可能
            TextButton(
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) => CupertinoActionSheet(
                    title: const Text('Choose Options'),
                    message: const Text('Your options are '),
                    actions: <Widget>[
                      CupertinoActionSheetAction(
                        child: const Text('One'),
                        onPressed: () {
                          Navigator.pop(context, 'One');
                        },
                      ),
                      CupertinoActionSheetAction(
                        child: const Text('Two'),
                        onPressed: () {
                          Navigator.pop(context, 'Two');
                        },
                      )
                    ],
                    cancelButton: CupertinoActionSheetAction(
                      isDefaultAction: true,
                      onPressed: () {
                        Navigator.pop(context, 'Cancel');
                      },
                      child: const Text('Cancel'),
                    ),
                  ),
                );
              },
              child: const Text(
                'ActionSheet',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
