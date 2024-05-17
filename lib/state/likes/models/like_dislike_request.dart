import 'package:flutter/material.dart' show immutable;
import 'package:sociogram/state/posts/typedefs/post_id.dart';
import 'package:sociogram/state/posts/typedefs/user_id.dart';

@immutable
class LikeDislikeRequest {
  final PostId postId;
  final UserId likedBy;

  const LikeDislikeRequest({
    required this.postId,
    required this.likedBy,
  });
}
