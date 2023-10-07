import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:internship_subspace/src/models/blogmodel.dart';
import 'package:internship_subspace/src/views/blogdetailspage.dart';

class BlogCard1 extends StatefulWidget {
  final Blog blog;
  const BlogCard1({super.key, required this.blog});

  @override
  State<BlogCard1> createState() => _BlogCard1State();
}

class _BlogCard1State extends State<BlogCard1> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 12),
      child: InkWell(
        onDoubleTap: () {
          setState(() {
            widget.blog.blogliked = !widget.blog.blogliked;  
          });
        },
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => BlogDetails(blog: widget.blog)));
        },
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              margin: const EdgeInsets.only(top:20),
              clipBehavior: Clip.hardEdge,
              padding: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Hero(
                    tag: widget.blog.id,
                    child: CachedNetworkImage(
                      fit: BoxFit.contain,
                      imageUrl: widget.blog.image_url,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.blog.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textScaleFactor: 1.25,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  widget.blog.blogliked=!widget.blog.blogliked;
                });
              },
              child: CircleAvatar(
                backgroundColor: Colors.black12.withOpacity(0.7),
                child: Icon(
                  widget.blog.blogliked
                      ? Icons.favorite_rounded
                      : Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
