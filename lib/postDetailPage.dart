import 'package:flutter/material.dart';
import 'package:personal_blog/post.dart';
import 'package:personal_blog/service.dart';

class PostDetailPage extends StatelessWidget {
  final int postId;
  const PostDetailPage({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: FutureBuilder<Post>(
        future: ApiService.fetchPostById(postId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Post not found.'));
          }

          final post = snapshot.data!;
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 16),
                Divider(color: Colors.grey.shade300, thickness: 1),
                const SizedBox(height: 16),
                Text(
                  post.content,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.7,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
