import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:personal_blog/post.dart';




class ApiService {
  static const String baseUrl = 'http://192.168.0.198:8080';

  static Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/api/posts'));

    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      return jsonData.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
