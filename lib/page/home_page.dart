import 'dart:developer';

import 'package:consume_api/controllers/post_controller.dart';
import 'package:consume_api/models/post.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PostController postController = PostController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Post>>(
          future: postController.fetchAll(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                inspect(snapshot.data!);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(snapshot.data![index].title),
                          subtitle: Text(snapshot.data![index].body),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: size.height * 0.01,
                      );
                    },
                    itemCount: snapshot.data!.length,
                  ),
                );
              } else {
                return const Text("Tidak Ada Data");
              }
            } else {
              return const Text("Error");
            }
          },
        ),
      ),
    );
  }
}
