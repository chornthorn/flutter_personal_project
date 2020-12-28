class CommentByIdRes {
  List<CommentByIdResData> data;

  CommentByIdRes({this.data});

  factory CommentByIdRes.fromJson(List<dynamic> json) {
    List<CommentByIdResData> posts = List<CommentByIdResData>();
    posts = json.map((post) => CommentByIdResData.fromJson(post)).toList();

    return CommentByIdRes(
      data: posts,
    );
  }

//  CommentByIdRes.fromJson(Map<String, dynamic> json) {
//    if (json['data'] != null) {
//      data = new List<CommentByIdResData>();
//      json['data'].forEach((v) {
//        data.add(new CommentByIdResData.fromJson(v));
//      });
//    }
//  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CommentByIdResData {
  int postId;
  int id;
  String name;
  String email;
  String body;

  CommentByIdResData({this.postId, this.id, this.name, this.email, this.body});

  CommentByIdResData.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['body'] = this.body;
    return data;
  }
}
