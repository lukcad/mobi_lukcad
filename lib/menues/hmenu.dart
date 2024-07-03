import 'package:flutter/material.dart';

class Hmenu extends StatelessWidget {
  const Hmenu({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle styleBtn = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold));

    return Card(
      child: Row(
        children: [
          ElevatedButton(
              style: styleBtn,
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Home')),
          ElevatedButton(
              style: styleBtn,
              onPressed: () {
                Navigator.pushNamed(context, '/posts');
              },
              child: const Text('Posts'))
        ],
      ),
    );
  }
}
