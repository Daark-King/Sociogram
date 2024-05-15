import 'package:sociogram/enums/data_sorting.dart';
import 'package:sociogram/state/comments/models/comment.dart';
import 'package:sociogram/state/comments/models/post_comments_request.dart';

extension Sorting on Iterable<Comment> {
  Iterable<Comment> applySortingFrom(RequestForPostAndComments request) {
    if (request.sortByCreatedAt) {
      final sortedDocuments = toList()
        ..sort((a, b) {
          switch (request.dateSorting) {
            case DateSorting.oldestOnTop:
              return a.createdAt.compareTo(b.createdAt);
            case DateSorting.newestOnTop:
              return b.createdAt.compareTo(a.createdAt);
          }
        });
      return sortedDocuments;
    } else {
      return this;
    }
  }
}