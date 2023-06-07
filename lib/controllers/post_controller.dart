import 'dart:convert';
import 'dart:io';

import 'package:consume_api/models/post.dart';
import 'package:consume_api/services/post_service.dart';

class PostController {
  Future<List<Post>> fetchAll() async {
    return await PostService().fetch().then((res) {
      if (res.statusCode == HttpStatus.ok) {
        var jsonBody = jsonDecode(res.body);
        return List.generate(
          jsonBody.length,
          (index) => Post.fromMap(
            jsonBody[index],
          ),
        );
      } else {
        throw Exception();
      }
    });
  }
}
