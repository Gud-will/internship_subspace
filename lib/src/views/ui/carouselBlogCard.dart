import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:internship_subspace/src/models/blogmodel.dart';

class BlogCarouselCard extends StatelessWidget {
  final Blog blog;
  const BlogCarouselCard({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CachedNetworkImage(
          fit: BoxFit.fill,
          color: Colors.black45,
          colorBlendMode: BlendMode.darken,
          imageUrl: blog.image_url,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      blog.title,
                      textAlign: TextAlign.left,
                      textStyle:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                    )
                  ],
                ),
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.favorite_border,
                    size: 20,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.save_alt_rounded,
                    size: 20,
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
