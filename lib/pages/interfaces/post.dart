//https://jsonplaceholder.typicode.com//posts?_embed=comments

class Posts {
  int? id;
  int? userid;
  String title;
  String body;
  List<Comment> comments;

  Posts({
    required this.id,
    required this.userid,
    required this.title,
    required this.body,
    required this.comments,
  });

  //factory Posts.fromJson(String str) => Posts.fromMap(json.decode(str));

  //String toJson() => json.encode(toMap());

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      id: json['id'],
      userid: json['userid'],
      title: json['title'],
      body: json['body'],
      comments: json['comments'] != null
          ? List<Comment>.from(json['comments'].map((x) => Comment.fromJson(x)))
          : [],
    );
  }

/*   Map<String, dynamic> toMap() => {
        "userid": userid,
        "id": id,
        "title": title,
        "body": body,
        "comments": List<dynamic>.from(comments.map((x) => x.toMap())),
      }; */
}

class Comment {
  int? postid;
  int? id;
  String name;
  String email;
  String body;

  Comment({
    required this.postid,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  //factory Comment.fromJson(String str) => Comment.fromMap(json.decode(str));

  //String toJson() => json.encode(toMap());

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        postid: json["postid"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

/*   Map<String, dynamic> toMap() => {
        "postid": postid,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      }; */
}
