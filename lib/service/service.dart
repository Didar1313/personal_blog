import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:personal_blog/model/post.dart';

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8081/api';

  static Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  static Future<Post> fetchPostById(int id) async {
    final url = '$baseUrl/posts/$id';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

}
