// import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:internship_subspace/src/models/blogmodel.dart';
import 'package:internship_subspace/src/views/blogdetailspage.dart';

class BlogCard2 extends StatefulWidget {
  final Blog blog;
  const BlogCard2({super.key, required this.blog});

  @override
  State<BlogCard2> createState() => _BlogCard2State();
}

class _BlogCard2State extends State<BlogCard2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 12),
      child: GFListTile(
        radius: 15,
        color: const Color.fromARGB(255, 174, 208, 223),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => BlogDetails(blog: widget.blog)),
          );
        },
        title: Text(widget.blog.title),
        avatar: Hero(
          tag: widget.blog.id,
          child: SizedBox(
            width: 150,
            child: CachedNetworkImage(
              fit: BoxFit.contain,
              imageUrl: widget.blog.image_url,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        icon: IconButton(
          onPressed: () {
            setState(() {
              widget.blog.blogliked = !widget.blog.blogliked;
            });
          },
          icon: Icon(widget.blog.blogliked
              ? Icons.favorite_rounded
              : Icons.favorite_border_rounded),
          color: widget.blog.blogliked ? Colors.red : Colors.black,
        ),
      ),
    );
  }
}
