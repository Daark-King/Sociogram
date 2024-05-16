import 'dart:collection' show MapView;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart' show immutable;
import 'package:sociogram/state/constants/firebase_field_name.dart';

@immutable
class CommentPayload extends MapView<String, dynamic> {
  CommentPayload({
    required String fromUserId,
    required String onPostId,
    required String comment,
  }) : super(
          {
            FirebaseFieldName.userId: fromUserId,
            FirebaseFieldName.postId: onPostId,
            FirebaseFieldName.comment: comment,
            FirebaseFieldName.createdAt: FieldValue.serverTimestamp(),
          },
        );
}
