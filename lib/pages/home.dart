import 'package:flutter/material.dart';
import '../menues/vmenu.dart';
import '../menues/mainbar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

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
      drawer: const Vmenu(),
      appBar: Mainbar(title: title),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Surface color mapping.
            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                titleBox('Profile'),
                const SizedBox(height: 20),
              ],
            ),
            // Secondary color mapping.
            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const SizedBox(height: 20),
                FloatingActionButton.large(
                  foregroundColor: colorScheme.onSecondaryContainer,
                  backgroundColor: colorScheme.secondaryContainer,
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                  child: const Icon(
                    Icons.settings,
                    size: 80,
                  ),
                ),
                const SizedBox(height: 20),
                titleBox('Settings'),
                const SizedBox(height: 20),
                FloatingActionButton.large(
                  foregroundColor: colorScheme.onTertiaryContainer,
                  backgroundColor: colorScheme.tertiaryContainer,
                  onPressed: () {
                    Navigator.pushNamed(context, '/posts');
                  },
                  child: const Icon(
                    Icons.message,
                    size: 80,
                  ),
                ),
                const SizedBox(height: 20),
                titleBox('Posts'),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
