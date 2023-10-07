import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internship_subspace/src/views/ui/blogcard_2.dart';
import 'package:internship_subspace/src/views/ui/carouselBlogCard.dart';
import '../methods/blogapi.dart';
import '../models/blogmodel.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(blogDataProvider);
    return Scaffold(
        body: data.when(
      data: (data) {
        List<Blog> bloglists = data.map((e) => e).toList();
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              /*CarouselSlider.builder(
                itemCount: 9,
                options: CarouselOptions(
                  height: 350,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  scrollDirection: Axis.horizontal,
                ),
                itemBuilder: (context, index, pageindex) {
                  return BlogCarouselCard(blog: bloglists[index]);
                },
              ),*/
              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "Blogs",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Divider(),
              ),
              ListView.builder(
                  itemCount: bloglists.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    return BlogCard2(blog: bloglists[index]);
                  })
            ],
          ),
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
    ));
  }
}
