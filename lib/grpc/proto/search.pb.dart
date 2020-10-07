///
//  Generated code. Do not modify.
//  source: proto/search.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'common.pbenum.dart' as $3;

class ResourceSection extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ResourceSection', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'Source', protoName: 'Source')
    ..a<$core.double>(2, 'Duration', $pb.PbFieldType.OF, protoName: 'Duration')
    ..e<$3.EmotionCode>(3, 'EmotionCode', $pb.PbFieldType.OE, protoName: 'EmotionCode', defaultOrMaker: $3.EmotionCode.AMUSEMENT, valueOf: $3.EmotionCode.valueOf, enumValues: $3.EmotionCode.values)
    ..aOS(4, 'SourceName', protoName: 'SourceName')
    ..aOS(5, 'ResourceAddrees', protoName: 'ResourceAddrees')
    ..aOS(6, 'ResourceID', protoName: 'ResourceID')
    ..aOS(7, 'SourceID', protoName: 'SourceID')
    ..hasRequiredFields = false
  ;

  ResourceSection._() : super();
  factory ResourceSection() => create();
  factory ResourceSection.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResourceSection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ResourceSection clone() => ResourceSection()..mergeFromMessage(this);
  ResourceSection copyWith(void Function(ResourceSection) updates) => super.copyWith((message) => updates(message as ResourceSection));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResourceSection create() => ResourceSection._();
  ResourceSection createEmptyInstance() => create();
  static $pb.PbList<ResourceSection> createRepeated() => $pb.PbList<ResourceSection>();
  @$core.pragma('dart2js:noInline')
  static ResourceSection getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResourceSection>(create);
  static ResourceSection _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get source => $_getSZ(0);
  @$pb.TagNumber(1)
  set source($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSource() => $_has(0);
  @$pb.TagNumber(1)
  void clearSource() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get duration => $_getN(1);
  @$pb.TagNumber(2)
  set duration($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearDuration() => clearField(2);

  @$pb.TagNumber(3)
  $3.EmotionCode get emotionCode => $_getN(2);
  @$pb.TagNumber(3)
  set emotionCode($3.EmotionCode v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmotionCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmotionCode() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sourceName => $_getSZ(3);
  @$pb.TagNumber(4)
  set sourceName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSourceName() => $_has(3);
  @$pb.TagNumber(4)
  void clearSourceName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get resourceAddrees => $_getSZ(4);
  @$pb.TagNumber(5)
  set resourceAddrees($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasResourceAddrees() => $_has(4);
  @$pb.TagNumber(5)
  void clearResourceAddrees() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get resourceID => $_getSZ(5);
  @$pb.TagNumber(6)
  set resourceID($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasResourceID() => $_has(5);
  @$pb.TagNumber(6)
  void clearResourceID() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get sourceID => $_getSZ(6);
  @$pb.TagNumber(7)
  set sourceID($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSourceID() => $_has(6);
  @$pb.TagNumber(7)
  void clearSourceID() => clearField(7);
}

class SearchRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SearchRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'Text', protoName: 'Text')
    ..a<$core.int>(2, 'Limit', $pb.PbFieldType.O3, protoName: 'Limit')
    ..a<$core.int>(3, 'Offest', $pb.PbFieldType.O3, protoName: 'Offest')
    ..pPS(4, 'Tags', protoName: 'Tags')
    ..e<$3.EmotionCode>(5, 'EmotionCode', $pb.PbFieldType.OE, protoName: 'EmotionCode', defaultOrMaker: $3.EmotionCode.AMUSEMENT, valueOf: $3.EmotionCode.valueOf, enumValues: $3.EmotionCode.values)
    ..hasRequiredFields = false
  ;

  SearchRequest._() : super();
  factory SearchRequest() => create();
  factory SearchRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SearchRequest clone() => SearchRequest()..mergeFromMessage(this);
  SearchRequest copyWith(void Function(SearchRequest) updates) => super.copyWith((message) => updates(message as SearchRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SearchRequest create() => SearchRequest._();
  SearchRequest createEmptyInstance() => create();
  static $pb.PbList<SearchRequest> createRepeated() => $pb.PbList<SearchRequest>();
  @$core.pragma('dart2js:noInline')
  static SearchRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchRequest>(create);
  static SearchRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get offest => $_getIZ(2);
  @$pb.TagNumber(3)
  set offest($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOffest() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffest() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get tags => $_getList(3);

  @$pb.TagNumber(5)
  $3.EmotionCode get emotionCode => $_getN(4);
  @$pb.TagNumber(5)
  set emotionCode($3.EmotionCode v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasEmotionCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearEmotionCode() => clearField(5);
}

class SearchResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SearchResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..e<$3.StatusCode>(1, 'StatusCode', $pb.PbFieldType.OE, protoName: 'StatusCode', defaultOrMaker: $3.StatusCode.SUCCESSFUL, valueOf: $3.StatusCode.valueOf, enumValues: $3.StatusCode.values)
    ..aOS(2, 'Message', protoName: 'Message')
    ..pc<ResourceSection>(3, 'ResourceSection', $pb.PbFieldType.PM, protoName: 'ResourceSection', subBuilder: ResourceSection.create)
    ..hasRequiredFields = false
  ;

  SearchResponse._() : super();
  factory SearchResponse() => create();
  factory SearchResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SearchResponse clone() => SearchResponse()..mergeFromMessage(this);
  SearchResponse copyWith(void Function(SearchResponse) updates) => super.copyWith((message) => updates(message as SearchResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SearchResponse create() => SearchResponse._();
  SearchResponse createEmptyInstance() => create();
  static $pb.PbList<SearchResponse> createRepeated() => $pb.PbList<SearchResponse>();
  @$core.pragma('dart2js:noInline')
  static SearchResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchResponse>(create);
  static SearchResponse _defaultInstance;

  @$pb.TagNumber(1)
  $3.StatusCode get statusCode => $_getN(0);
  @$pb.TagNumber(1)
  set statusCode($3.StatusCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatusCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatusCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<ResourceSection> get resourceSection => $_getList(2);
}

