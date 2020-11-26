// cache/entity/person.dart

import 'dart:ffi';

import 'package:floor/floor.dart';

@entity
class ResourceSection {
  @primaryKey
  final int resourceId;

  final double duration;

  final String sourceName;

  final int emotionCode;

  final String resourceAddress;

  final String sourceId;

  final bool isFavorite;

  final bool isDownload;

  final String name;

  final String resourceAddressCachePath;

  ResourceSection(
      this.resourceId,
      this.duration,
      this.sourceName,
      this.emotionCode,
      this.resourceAddress,
      this.sourceId,
      this.isFavorite,
      this.isDownload,
      this.name,
      this.resourceAddressCachePath);
}
