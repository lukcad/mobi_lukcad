import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:mobi_lukcad/widgets/nav-drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    Widget titleBox(String title) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme.inverseSurface,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(title,
              style: TextStyle(color: colorScheme.onInverseSurface)),
        ),
      );
    }

    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Surface color mapping.
            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                FloatingActionButton.large(
                  foregroundColor: colorScheme.primary,
                  backgroundColor: colorScheme.surface,
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                  child: const Icon(
                    Icons.person_2_rounded,
                    size: 80,
                  ),
                ),
                const SizedBox(height: 30),
                //titleBox('Driver'),
              ],
            ),
            // Secondary color mapping.
            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                FloatingActionButton.large(
                  foregroundColor: colorScheme.onSecondaryContainer,
                  backgroundColor: colorScheme.secondaryContainer,
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                  child: const Icon(
                    Icons.emoji_transportation,
                    size: 80,
                  ),
                ),
                const SizedBox(height: 30),
                //titleBox('Transportation'),
                FloatingActionButton.large(
                  foregroundColor: colorScheme.onTertiaryContainer,
                  backgroundColor: colorScheme.tertiaryContainer,
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                  child: const Icon(
                    Icons.message,
                    size: 80,
                  ),
                ),
                const SizedBox(height: 30),
                //titleBox('Messages'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
