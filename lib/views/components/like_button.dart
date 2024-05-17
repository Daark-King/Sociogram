import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sociogram/state/auth/providers/user_id_provider.dart';
import 'package:sociogram/state/likes/models/like_dislike_request.dart';
import 'package:sociogram/state/likes/providers/has_liked_post_provider.dart';
import 'package:sociogram/state/likes/providers/like_dislike_post_provider.dart';
import 'package:sociogram/state/posts/typedefs/post_id.dart';
import 'package:sociogram/views/components/animations/small_error_animation_view.dart';

class LikeButton extends ConsumerWidget {
  final PostId postId;

  const LikeButton({
    super.key,
    required this.postId,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasLiked = ref.watch(
      hasLikedPostProvider(
        postId,
      ),
    );

    return hasLiked.when(
      data: (hasLiked) {
        return IconButton(
          icon: Icon(
            hasLiked ? Icons.favorite : Icons.favorite_border,
            color: hasLiked ? Colors.red : null,
          ),
          onPressed: () {
            final userId = ref.read(userIdProvider);
            if (userId == null) {
              return;
            }
            final likeRequest =
                LikeDislikeRequest(postId: postId, likedBy: userId);
            ref.read(
              likeDislikePostProvider(likeRequest),
            );
          },
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      error: (error, stackTrace) {
        return const SmallErrorAnimationView();
      },
    );
  }
}
