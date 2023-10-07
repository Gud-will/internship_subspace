import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:internship_subspace/src/models/blogmodel.dart';
import 'package:internship_subspace/src/resource/strings.dart';

class BlogDetails extends StatelessWidget {
  final Blog blog;
  const BlogDetails({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SubSpaces",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedTextKit(
                  isRepeatingAnimation: false,
                  displayFullTextOnTap: true,
                  animatedTexts: [
                    TyperAnimatedText(
                      blog.title,
                      textStyle: Theme.of(context).textTheme.headlineSmall,
                    )
                  ],
                ),
              ),
              Container(
                constraints: const BoxConstraints(
                  maxHeight: 400,
                ),
                child: Hero(
                  tag: blog.id,
                  child: CachedNetworkImage(
                    fit: BoxFit.contain,
                    imageUrl: blog.image_url,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                  value: downloadProgress.progress),
                            ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemBuilder: (ctx, index) {
                  return Container(
                    width: 100,
                    height: 100,
                    color: Colors.amber,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
