// cache/entity/person.dart

import 'dart:ffi';

import 'package:floor/floor.dart';

@entity
class CacheResourceSection {
  @primaryKey
  String resourceId;

  double duration;

  String sourceName;

  int emotionCode;

  String resourceAddress;
  @primaryKey
  String sourceId;

  bool isFavorite;

  bool isDownload;

  String searchText;

  String resourceAddressCachePath;

  CacheResourceSection(
      this.resourceId,
      this.duration,
      this.sourceName,
      this.emotionCode,
      this.resourceAddress,
      this.sourceId,
      this.isFavorite,
      this.isDownload,
      this.searchText,
      this.resourceAddressCachePath);
}
