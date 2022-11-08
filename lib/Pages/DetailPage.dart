import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_http_library/Model/Post.dart';

class DetailPage extends StatelessWidget {
  Post _post;
  DetailPage(this._post ) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15.0),
        child: ListView(
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children:[
               Icon(Icons.person_rounded),
               Text("User Id: ",style: TextStyle(fontSize: 17,),),
               Text(_post.userId.toString(),style: TextStyle(fontSize: 17,),),
             ]
           ),
           SizedBox(height: 20,),
           Text(_post.title.toString(),style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
           Divider(color: Colors.black45,),
           SizedBox(height: 15,),

           Container(
             color: Colors.orange.shade100,
               padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
               child: Text(_post.body.toString(),style: TextStyle(fontSize: 18,),)),
         ],
        ),
      ),
    );
  }
}
