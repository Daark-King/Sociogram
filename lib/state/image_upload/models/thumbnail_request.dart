import 'dart:io';
import 'package:flutter/material.dart' show immutable;
import 'package:sociogram/state/image_upload/models/file_type.dart';

@immutable
class ThumbnailRequest {
  final File file;
  final FileType fileType;

  const ThumbnailRequest({
    required this.file,
    required this.fileType,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ThumbnailRequest &&
        other.file == file &&
        other.fileType == fileType;
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        file,
        fileType,
      ]);
}
