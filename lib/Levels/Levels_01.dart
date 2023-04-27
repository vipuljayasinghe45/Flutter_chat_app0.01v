import 'package:flutter/material.dart';

void main() => runApp(const Level_01());

class Level_01 extends StatelessWidget {
  const Level_01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Level_01StatefulWidget(),
        ),
      );
  }
}

class Level_01StatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Level_01StatefulWidget();
  }
}

class _Level_01StatefulWidget extends State<Level_01StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(20),
      primary: false,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.lightBlueAccent,
          child: ElevatedButton(
            child: Text('Chat APP'),
            onPressed: () {},
            ),
          ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.lightBlueAccent,
          child: ElevatedButton(
            onPressed: () => {},
            child: const Text('Level 01'),
            ),
          ),
      ],
      );
  }
}
