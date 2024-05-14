import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sociogram/state/comments/notifiers/send_comment_notifier.dart';
import 'package:sociogram/state/image_upload/typedefs/is_loading.dart';

final sendCommentProvider =
    StateNotifierProvider<SendCommentNotifier, IsLoading>((_) {
  return SendCommentNotifier();
});
