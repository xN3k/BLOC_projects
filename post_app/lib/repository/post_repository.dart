import "dart:async";
import "dart:io";

import "package:http/http.dart" as http;
import "package:post_app/models/model.dart";
import 'dart:convert';

class PostRepository {
  final String url = "https://jsonplaceholder.typicode.com/posts";
  Future<List<PostModel>> fetchPost() async {
    try {
      final response = await http.get(Uri.parse(url));
      final body = json.decode(response.body) as List;

      if (response.statusCode == 200) {
        return body.map((dynamic json) {
          final map = json as Map<String, dynamic>;
          return PostModel(
            userId: map['userId'] as int,
            id: map['id'] as int,
            title: map['title'] as String,
            body: map['body'] as String,
          );
        }).toList();
      }
    } on SocketException {
      await Future.delayed(const Duration(milliseconds: 1800));
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception("Time out! Please try again later");
    }
    throw Exception("Error while Fetching Data");
  }
}
