import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sociogram/state/auth/providers/user_id_provider.dart';
import 'package:sociogram/state/posts/models/post.dart';

final canCurrentUserDeletePostProvider =
    StreamProvider.family.autoDispose<bool, Post>(
  (
    ref,
    Post post,
  ) async* {
    //without using stream controller we are yeilding bool value using async*
    final userId = ref.watch(userIdProvider);
    yield userId == post.userId;
  },
);
