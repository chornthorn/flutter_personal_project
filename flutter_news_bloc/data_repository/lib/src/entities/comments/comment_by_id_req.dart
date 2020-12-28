import 'package:data_repository/data_repository.dart';
class CommentByIdReq extends BaseReq{
  CommentByIdReqData data;

  CommentByIdReq({this.data});

  CommentByIdReq.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new CommentByIdReqData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class CommentByIdReqData {
  int postId;

  CommentByIdReqData({this.postId});

  CommentByIdReqData.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    return data;
  }
}
