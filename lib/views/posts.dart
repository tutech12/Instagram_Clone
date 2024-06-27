

import 'package:flutter/material.dart';
import 'package:instargramclone/models/post.dart';
import 'package:instargramclone/services/remote_service.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     getData();
    //fetch data from api
  }

  getData() async {
    posts =await RemoteService().getPosts();
    if(posts != null){
      setState(() {
        isLoaded=true;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Post')),
    body: Visibility(
      visible: isLoaded,
      child: ListView.builder(
        itemCount: posts?.length,
        itemBuilder: (context, index) {
        return Container(child: Text(posts![index].title),);
      },),
      replacement: const Center(child: CircularProgressIndicator()),
    ),);
  }
}
