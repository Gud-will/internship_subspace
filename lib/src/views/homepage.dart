import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internship_subspace/src/views/ui/blogcard_1.dart';
import '../methods/blogapi.dart';
import '../models/blogmodel.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(blogDataProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.grey.shade400,
          title: Text("SubSpaces",style:Theme.of(context).textTheme.headlineMedium),
          actions: [
            CircleAvatar(
              backgroundColor: Colors.amber,
              child: Container(),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 9,
          ),
          child: data.when(
            data: (data) {
              List<Blog> bloglists = data.map((e) => e).toList();
              return ListView.builder(
                itemCount: bloglists.length,
                itemBuilder: (ctx, index) {
                  return BlogCard1(blog: bloglists[index]);
                },
              );
            },
            error: (error, stackTrace) => Center(
              child: Text(
                '$error occurred',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
