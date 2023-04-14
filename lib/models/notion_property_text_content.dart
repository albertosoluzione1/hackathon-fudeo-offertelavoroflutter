// ignore_for_file: prefer_const_constructors

import 'package:freezed_annotation/freezed_annotation.dart';

part 'notion_property_text_content.freezed.dart';
part 'notion_property_text_content.g.dart';

@freezed
class NotionPropertyTextContent with _$NotionPropertyTextContent {
  const factory NotionPropertyTextContent({
    required String content,
    String? link,
  }) = _NotionPropertyTextContent;

  factory NotionPropertyTextContent.fromJson(Map<String, dynamic> json) =>
      _$NotionPropertyTextContentFromJson(json);
}
