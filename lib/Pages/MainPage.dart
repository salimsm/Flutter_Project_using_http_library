import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_http_library/Pages/DetailPage.dart';
import 'package:flutter_project_http_library/Service.dart';

import '../Model/Post.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Post>? _postList;
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    Service.getPosts().then((postList){
      setState(() {
        _postList =postList;
        _loading=false;
      });
    } );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_loading?'Loading...':'User Post'),),
      body:_loading?Center(child: CircularProgressIndicator()):ListView.builder(
        itemCount:_postList==null?0:_postList?.length ,
        itemExtent: 80,
        itemBuilder: (context, index)=>ListTile(
          title:Text(_postList![index].title.toString(),
            overflow: TextOverflow.ellipsis,
            style:TextStyle(
              fontSize: 18,
            ),
          ),
          trailing: CircleAvatar(child: Icon(Icons.arrow_forward_ios)),
          subtitle: Text(_postList![index].body.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailPage(_postList![index])));
            },
          //moveToDetailScreen(_postList![index]),
        ) ,
      ),

    );
  }


}
