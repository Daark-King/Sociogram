import 'package:flutter/material.dart'
    show Colors, TextDecoration, TextStyle, VoidCallback, immutable;
import 'package:sociogram/views/components/rich_text/link_text.dart';

@immutable
class BaseText {
  final String text;
  final TextStyle? style;

  const BaseText({required this.text, this.style});

  factory BaseText.plain({
    required String text,
    TextStyle? style = const TextStyle(),
  }) {
    return BaseText(
      text: text,
      style: style,
    );
  }

  factory BaseText.link({
    required String text,
    required VoidCallback onTapped,
    TextStyle? style = const TextStyle(
      color: Colors.blue,
      decoration: TextDecoration.underline,
    ),
  }) {
    return LinkText(
      text: text,
      onTapped: onTapped,
      style: style,
    );
  }
}
