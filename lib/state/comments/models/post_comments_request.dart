import 'package:flutter/foundation.dart' show immutable;
import 'package:sociogram/enums/data_sorting.dart';
import 'package:sociogram/state/posts/typedefs/post_id.dart';

@immutable
class RequestForPostAndComments {
  final PostId postId;
  final bool sortByCreatedAt;
  final DateSorting dateSorting;
  final int? limit;
  const RequestForPostAndComments({
    required this.postId,
    this.sortByCreatedAt = true,
    this.dateSorting = DateSorting.newestOnTop,
    this.limit,
  });

  @override
  bool operator ==(covariant RequestForPostAndComments other) =>
      postId == other.postId &&
      sortByCreatedAt == other.sortByCreatedAt &&
      dateSorting == other.dateSorting &&
      limit == other.limit;

  @override
  int get hashCode => Object.hashAll(
        [
          postId,
          sortByCreatedAt,
          dateSorting,
          limit,
        ],
      );
}
