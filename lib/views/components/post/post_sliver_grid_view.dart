import 'package:flutter/material.dart';
import 'package:sociogram/state/posts/models/post.dart';
import 'package:sociogram/views/components/post/post_thumbnail_view.dart';
import 'package:sociogram/views/post_details/post_details_view.dart';

class PostSliverGridview extends StatelessWidget {
  final Iterable<Post> posts;

  const PostSliverGridview({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: posts.length,
        (context, index) {
          final post = posts.elementAt(index);
          return PostThumbnailView(
            post: post,
            onTapped: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailsView(
                    post: post,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
