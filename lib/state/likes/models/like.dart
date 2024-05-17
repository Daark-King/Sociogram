import 'dart:collection' show MapView;
import 'package:flutter/material.dart' show immutable;
import 'package:sociogram/state/constants/firebase_field_name.dart';
import 'package:sociogram/state/posts/typedefs/post_id.dart';
import 'package:sociogram/state/posts/typedefs/user_id.dart';

@immutable
class Like extends MapView<String, String> {
  Like({
    required PostId postId,
    required UserId likedBy,
    required DateTime date,
  }) : super({
          FirebaseFieldName.postId: postId,
          FirebaseFieldName.userId: likedBy,
          FirebaseFieldName.createdAt: date.toIso8601String(),
        });
}
