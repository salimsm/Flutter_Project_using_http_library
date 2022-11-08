import 'Model/Post.dart';
import 'package:http/http.dart' as http;
class Service{
  static var uri = 'https://jsonplaceholder.typicode.com/posts';

  static Future<List<Post>> getPosts() async{

    try{
      final response = await http.get(Uri.parse(uri));
      print("the vlaue in response variable = ${response.toString()}");
      if(200 == response.statusCode){

        final List<Post> posts = postFromJson(response.body);
        return posts;
      }else{
        return <Post>[];
      }
    }catch(e){
      // return 'Exception Caught : $e';
      return <Post>[];
    }

  }

}
