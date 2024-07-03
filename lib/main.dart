import 'package:flutter/material.dart';
import 'package:mobi_lukcad/pages/home.dart';
import 'pages/posts.dart';
import 'pages/post_details.dart';

void main() => runApp(const MyApp());

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
        routes: {
          '/': (context) => const MyHomePage(title: 'Home'),
          '/posts': (context) => const PostsPage(title: 'Posts'),
          '/postdetails': (context) => const PostDetailsPage(title: 'Comments'),
        });
  }
}
