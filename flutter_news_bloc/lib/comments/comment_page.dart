import 'package:data_repository/data_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/comments/comments_bloc.dart';

class CommentPage extends StatelessWidget {
final int postId;

  const CommentPage({Key key, this.postId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post ID: $postId'),
      ),
      body: BlocBuilder<CommentsBloc,CommentsState>(
        builder: (context, state) {
          if(state is CommentsLoading){
            return Center(child: CupertinoActivityIndicator(radius: 20,));
          }
          if(state is CommentsLoaded){
            return Container(
              child: ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context,index){
                  var data = state.data[index];
                  return Card(
                    margin: EdgeInsets.all(5),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: ListTile(
                        title: Text(data.body),
                        leading: Text('CommentID: ${data.id}'),
                        subtitle: Text("Name: ${data.name}"),
                      ),
                    ),
                  );
                },
              ),
            );
          }

          return Container();
        }
      ),
    );
  }
}
