import 'package:flutter/material.dart';

class Mainbar extends StatelessWidget implements PreferredSizeWidget {
  Mainbar({super.key, required this.title});
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  StatelessElement createElement() {
    _beforecreate();
    return super.createElement();
  }

  static String user_active = '';
  static Iterable<String> transactions = {};
  static Iterable<String> transactionsoperator = {};

  void _beforecreate() async {
    transactions = {'Settings', 'Cancel'};
    transactionsoperator = {'Settings', 'Logout'};
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      backgroundColor:
          Colors.green, //Theme.of(context).colorScheme.inversePrimary,
      title: Text(title),
      actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.settings),
          onSelected: (value) {
            handleClickDriver(value, context);
          },
          itemBuilder: (BuildContext context) {
            return transactionsoperator.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
        PopupMenuButton<String>(
          onSelected: (value) {
            handleClick3Dot(value, context);
          },
          itemBuilder: (BuildContext context) {
            return transactions.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ],
    );
  }

  void handleClick3Dot(String value, BuildContext context) {
    switch (value) {
      case 'Settings':
        {
          Navigator.pushNamed(context, '/settings');
        }
      case 'Cancel':
        break;
    }
  }

  void handleClickDriver(String value, BuildContext context) {
    switch (value) {
      case 'Settings':
        Navigator.pushNamed(context, '/settings');
      case 'Logout':
        Navigator.pushNamed(context, '/logout');
    }
  }
}
