import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sociogram/state/image_upload/models/image_with_aspect_ratio.dart';
import 'package:sociogram/state/image_upload/models/thumbnail_request.dart';

final thumbnailProvider =
    FutureProvider.family.autoDispose<ImageWithAspectRatio, ThumbnailRequest>((
  ref,
  ThumbnailRequest request,
) async {});
