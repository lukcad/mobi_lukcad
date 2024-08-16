import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'interfaces/post.dart';
import '../menues/vmenu.dart';
import '../menues/hmenu.dart';
import '../menues/mainbar.dart';

// data extractor from remote API abdout Posts
Future<List<Posts>> fetchPost() async {
  final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com//posts?_embed=comments'));
  if (response.statusCode == 200) {
    Iterable l = json.decode(response.body);
    List<Posts> lposts = List<Posts>.from(l.map((i) => Posts.fromJson(i)));
    return lposts;
  } else {
    throw Exception('Failed to load Post');
  }
}

class PostsPage extends StatefulWidget {
  const PostsPage({super.key, required this.title});

  final String title;

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Vmenu(),
      appBar: Mainbar(title: widget.title),
      body: Center(
        child: FutureBuilder<List<Posts>>(
          future: fetchPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // here we create list based on data from snapshot
              return Column(children: <Widget>[
                const Hmenu(),
                Flexible(
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        padding: const EdgeInsets.all(10),
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                              child: ListTile(
                            title: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.data![index].id.toString()),
                                const Text(' - '),
                                Flexible(
                                  child: Text(
                                    snapshot.data![index].title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            subtitle: Column(
                              children: [
                                Text(snapshot.data![index].body),
                              ],
                            ),
                            leading: const Icon(Icons.book_online),
                            onTap: () {
                              Navigator.pushNamed(context, '/postdetails',
                                  arguments: <String, String>{
                                    'id': snapshot.data![index].id.toString()
                                  });
                            },
                          ));
                        })),
              ]);
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
