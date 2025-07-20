import 'package:intl/intl.dart';

class Post {
  final int id;
  final String title;
  final String content;
  final DateTime publishedAt;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.publishedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      publishedAt: DateTime.parse(json['publishedAt']),
    );
  }

  String get formattedDate {
    return DateFormat('yyyy-MM-dd').format(publishedAt);
  }
}
