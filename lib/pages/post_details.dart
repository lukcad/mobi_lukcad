import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'interfaces/post.dart';
import '../menues/vmenu.dart';
import '../menues/hmenu.dart';

// data extractor from remote API abdout Posts
Future<Posts> fetchPostDetails(String id) async {
  final response = await http.get(Uri.parse(
      'https://jsonplaceholder.typicode.com/posts/${id}?_embed=comments'));
  if (response.statusCode == 200) {
    return Posts.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Comments on Post');
  }
}

class PostDetailsPage extends StatefulWidget {
  const PostDetailsPage({super.key, required this.title});

  final String title;

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;

    return Scaffold(
      drawer: const Vmenu(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<Posts>(
          future: fetchPostDetails(args['id'].toString()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // here we create list based on data from snapshot
              return Column(
                children: <Widget>[
                  const Hmenu(),
                  Card(
                      child: ListTile(
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.data!.id.toString()),
                        const Text(' - '),
                        Flexible(
                          child: Text(
                            snapshot.data!.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    subtitle: Text(snapshot.data!.body),
                  )),
                  const Card(child: ListTile(title: Text('Comments:'))),
                  Flexible(
                    child: ListView.builder(
                      itemCount: snapshot.data!.comments.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: ListTile(
                          leading: const Icon(Icons.account_box_rounded),
                          title: Text(snapshot.data!.comments[index].body),
                        ));
                      },
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
