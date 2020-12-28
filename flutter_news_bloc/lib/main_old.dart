import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:news_app/bloc/comments/comments_bloc.dart';
import 'package:news_app/comments/comment_page.dart';
import 'bloc/simple_bloc_observer.dart';
import 'bloc/posts/thorn_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('PNF News'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(child: Column(children: [
                CircleAvatar(radius: 50,),
                SizedBox(height: 10),
                Text('Bong Thorn'),
              ],)),
              ListTile(
                leading: Icon(Icons.collections_bookmark),
                title: Text('Bookmark'),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.payment),
                title: Text('Payment'),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.contact_phone),
                title: Text('Contact'),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                onTap: (){},
              ),
            ],
          ),
        ),
        body: BlocProvider<ThornBloc>(
          create: (context) =>
              ThornBloc(new ThornRepository())..add(LoadThornEvent()),
          child: BlocBuilder<ThornBloc, ThornState>(
            builder: (context, state) {
              if(state is ThornLoading){
                return Center(child: CupertinoActivityIndicator(radius: 20,));
              }
              if (state is ThornLoaded) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      var data = state.data[index];
                      return GestureDetector(
                        child: Card(
                          margin: EdgeInsets.all(5),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: ListTile(
                              title: Text(data.body),
                              leading: Text('PostID: ${data.id}'),
                              subtitle: Text("UserID: ${data.userId}"),
                            ),
                          ),
                        ),
                        onTap: () {
                          MaterialPageRoute route =
                              new MaterialPageRoute(builder: (context) {
                            return BlocProvider<CommentsBloc>(
                              create: (context) => CommentsBloc(
                                  commentRepository: new CommentRepository())
                                ..add(LoadCommentById(postId: data.id)),
                              child: CommentPage(
                                postId: data.id,
                              ),
                            );
                          });
                          Navigator.push(context, route);
                        },
                      );
                    },
                  ),
                );
              }

              return Container();
            },
          ),
        ),
        floatingActionButton:
            FloatingActionButton(onPressed: () {}, child: Icon(Icons.favorite)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.home,
                      color: Colors.blue,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.chat_bubble,
                      color: Colors.grey[600],
                    ),
                    onPressed: () {}),
                SizedBox(
                  width: 16,
                ),
                IconButton(
                    icon: Icon(
                      Icons.bookmark,
                      color: Colors.grey[600],
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.account_circle,
                      color: Colors.grey[600],
                    ),
                    onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
