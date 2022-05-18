import 'package:flutter/material.dart';

class DropdownMenuPage extends StatefulWidget {
  const DropdownMenuPage({Key? key}) : super(key: key);

  @override
  State<DropdownMenuPage> createState() => _DropdownMenuPageState();
}

class _DropdownMenuPageState extends State<DropdownMenuPage> {
  Map<String, List<String>> dropDownMenu = {
    "英語": [
      "01 不定詞",
      "02 動名詞",
      "03 分詞",
    ],
    "数学": [
      "01 一次関数",
      "02 二次関数",
      "03 微分・積分",
    ],
    "物理": [
      "01 力学",
      "02 波動",
      "03 電磁器",
    ],
  };
  String? _selectedKey;
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drop Down Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Text(
                  'どの科目を学習しますか？',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DropdownButton<String>(
                  value: _selectedKey,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 30,
                  elevation: 16,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: Colors.grey,
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedKey = newValue;
                      _selectedValue = null;
                    });
                  },
                  alignment: Alignment.center,
                  items: dropDownMenu.keys
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            _selectedKey != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      const Text(
                        '単元名を選択',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      DropdownButton<String>(
                        value: _selectedValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 30,
                        elevation: 16,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                        underline: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedValue = newValue;
                          });
                        },
                        alignment: Alignment.center,
                        items: dropDownMenu[_selectedKey]!
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  )
                : Container(key: GlobalKey()),
          ],
        ),
      ),
    );
  }
}
