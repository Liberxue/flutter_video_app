///
//  Generated code. Do not modify.
//  source: proto/resource.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'common.pbenum.dart' as $5;

class UploadRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UploadRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..e<$5.ResourceLangType>(1, 'ResourceLangType', $pb.PbFieldType.OE, protoName: 'ResourceLangType', defaultOrMaker: $5.ResourceLangType.ENGLISH, valueOf: $5.ResourceLangType.valueOf, enumValues: $5.ResourceLangType.values)
    ..e<$5.FileType>(2, 'FileType', $pb.PbFieldType.OE, protoName: 'FileType', defaultOrMaker: $5.FileType.MP4, valueOf: $5.FileType.valueOf, enumValues: $5.FileType.values)
    ..a<$core.List<$core.int>>(3, 'Data', $pb.PbFieldType.OY, protoName: 'Data')
    ..aOS(4, 'DataID', protoName: 'DataID')
    ..a<$core.int>(5, 'ChunkSize', $pb.PbFieldType.O3, protoName: 'ChunkSize')
    ..a<$core.int>(6, 'StartOffset', $pb.PbFieldType.O3, protoName: 'StartOffset')
    ..a<$core.int>(7, 'EndOffset', $pb.PbFieldType.O3, protoName: 'EndOffset')
    ..a<$core.int>(8, 'CheckSum', $pb.PbFieldType.O3, protoName: 'CheckSum')
    ..aInt64(9, 'TotalSize', protoName: 'TotalSize')
    ..a<$core.int>(11, 'DataMd5', $pb.PbFieldType.O3, protoName: 'DataMd5')
    ..hasRequiredFields = false
  ;

  UploadRequest._() : super();
  factory UploadRequest() => create();
  factory UploadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UploadRequest clone() => UploadRequest()..mergeFromMessage(this);
  UploadRequest copyWith(void Function(UploadRequest) updates) => super.copyWith((message) => updates(message as UploadRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UploadRequest create() => UploadRequest._();
  UploadRequest createEmptyInstance() => create();
  static $pb.PbList<UploadRequest> createRepeated() => $pb.PbList<UploadRequest>();
  @$core.pragma('dart2js:noInline')
  static UploadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadRequest>(create);
  static UploadRequest _defaultInstance;

  @$pb.TagNumber(1)
  $5.ResourceLangType get resourceLangType => $_getN(0);
  @$pb.TagNumber(1)
  set resourceLangType($5.ResourceLangType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResourceLangType() => $_has(0);
  @$pb.TagNumber(1)
  void clearResourceLangType() => clearField(1);

  @$pb.TagNumber(2)
  $5.FileType get fileType => $_getN(1);
  @$pb.TagNumber(2)
  set fileType($5.FileType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFileType() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileType() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get dataID => $_getSZ(3);
  @$pb.TagNumber(4)
  set dataID($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDataID() => $_has(3);
  @$pb.TagNumber(4)
  void clearDataID() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get chunkSize => $_getIZ(4);
  @$pb.TagNumber(5)
  set chunkSize($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChunkSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearChunkSize() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get startOffset => $_getIZ(5);
  @$pb.TagNumber(6)
  set startOffset($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStartOffset() => $_has(5);
  @$pb.TagNumber(6)
  void clearStartOffset() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get endOffset => $_getIZ(6);
  @$pb.TagNumber(7)
  set endOffset($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasEndOffset() => $_has(6);
  @$pb.TagNumber(7)
  void clearEndOffset() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get checkSum => $_getIZ(7);
  @$pb.TagNumber(8)
  set checkSum($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCheckSum() => $_has(7);
  @$pb.TagNumber(8)
  void clearCheckSum() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get totalSize => $_getI64(8);
  @$pb.TagNumber(9)
  set totalSize($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasTotalSize() => $_has(8);
  @$pb.TagNumber(9)
  void clearTotalSize() => clearField(9);

  @$pb.TagNumber(11)
  $core.int get dataMd5 => $_getIZ(9);
  @$pb.TagNumber(11)
  set dataMd5($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(11)
  $core.bool hasDataMd5() => $_has(9);
  @$pb.TagNumber(11)
  void clearDataMd5() => clearField(11);
}

class UploadResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UploadResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..e<$5.ResponseCode>(1, 'Code', $pb.PbFieldType.OE, protoName: 'Code', defaultOrMaker: $5.ResponseCode.SUCCESSFUL, valueOf: $5.ResponseCode.valueOf, enumValues: $5.ResponseCode.values)
    ..aOS(2, 'Message', protoName: 'Message')
    ..hasRequiredFields = false
  ;

  UploadResponse._() : super();
  factory UploadResponse() => create();
  factory UploadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UploadResponse clone() => UploadResponse()..mergeFromMessage(this);
  UploadResponse copyWith(void Function(UploadResponse) updates) => super.copyWith((message) => updates(message as UploadResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UploadResponse create() => UploadResponse._();
  UploadResponse createEmptyInstance() => create();
  static $pb.PbList<UploadResponse> createRepeated() => $pb.PbList<UploadResponse>();
  @$core.pragma('dart2js:noInline')
  static UploadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadResponse>(create);
  static UploadResponse _defaultInstance;

  @$pb.TagNumber(1)
  $5.ResponseCode get code => $_getN(0);
  @$pb.TagNumber(1)
  set code($5.ResponseCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class OperationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('OperationRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..pPS(1, 'ResourceID', protoName: 'ResourceID')
    ..e<$5.ResouceAction>(2, 'ResouceAction', $pb.PbFieldType.OE, protoName: 'ResouceAction', defaultOrMaker: $5.ResouceAction.MERGE, valueOf: $5.ResouceAction.valueOf, enumValues: $5.ResouceAction.values)
    ..hasRequiredFields = false
  ;

  OperationRequest._() : super();
  factory OperationRequest() => create();
  factory OperationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OperationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  OperationRequest clone() => OperationRequest()..mergeFromMessage(this);
  OperationRequest copyWith(void Function(OperationRequest) updates) => super.copyWith((message) => updates(message as OperationRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OperationRequest create() => OperationRequest._();
  OperationRequest createEmptyInstance() => create();
  static $pb.PbList<OperationRequest> createRepeated() => $pb.PbList<OperationRequest>();
  @$core.pragma('dart2js:noInline')
  static OperationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OperationRequest>(create);
  static OperationRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get resourceID => $_getList(0);

  @$pb.TagNumber(2)
  $5.ResouceAction get resouceAction => $_getN(1);
  @$pb.TagNumber(2)
  set resouceAction($5.ResouceAction v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasResouceAction() => $_has(1);
  @$pb.TagNumber(2)
  void clearResouceAction() => clearField(2);
}

class OperationResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('OperationResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..e<$5.ResponseCode>(1, 'Code', $pb.PbFieldType.OE, protoName: 'Code', defaultOrMaker: $5.ResponseCode.SUCCESSFUL, valueOf: $5.ResponseCode.valueOf, enumValues: $5.ResponseCode.values)
    ..aOS(2, 'Message', protoName: 'Message')
    ..hasRequiredFields = false
  ;

  OperationResponse._() : super();
  factory OperationResponse() => create();
  factory OperationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OperationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  OperationResponse clone() => OperationResponse()..mergeFromMessage(this);
  OperationResponse copyWith(void Function(OperationResponse) updates) => super.copyWith((message) => updates(message as OperationResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OperationResponse create() => OperationResponse._();
  OperationResponse createEmptyInstance() => create();
  static $pb.PbList<OperationResponse> createRepeated() => $pb.PbList<OperationResponse>();
  @$core.pragma('dart2js:noInline')
  static OperationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OperationResponse>(create);
  static OperationResponse _defaultInstance;

  @$pb.TagNumber(1)
  $5.ResponseCode get code => $_getN(0);
  @$pb.TagNumber(1)
  set code($5.ResponseCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class DownloadRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DownloadRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..pPS(1, 'ResourceID', protoName: 'ResourceID')
    ..hasRequiredFields = false
  ;

  DownloadRequest._() : super();
  factory DownloadRequest() => create();
  factory DownloadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DownloadRequest clone() => DownloadRequest()..mergeFromMessage(this);
  DownloadRequest copyWith(void Function(DownloadRequest) updates) => super.copyWith((message) => updates(message as DownloadRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DownloadRequest create() => DownloadRequest._();
  DownloadRequest createEmptyInstance() => create();
  static $pb.PbList<DownloadRequest> createRepeated() => $pb.PbList<DownloadRequest>();
  @$core.pragma('dart2js:noInline')
  static DownloadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloadRequest>(create);
  static DownloadRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get resourceID => $_getList(0);
}

class DownloadResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DownloadResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..e<$5.ResponseCode>(1, 'Code', $pb.PbFieldType.OE, protoName: 'Code', defaultOrMaker: $5.ResponseCode.SUCCESSFUL, valueOf: $5.ResponseCode.valueOf, enumValues: $5.ResponseCode.values)
    ..aOS(2, 'Message', protoName: 'Message')
    ..a<$core.List<$core.int>>(3, 'Data', $pb.PbFieldType.OY, protoName: 'Data')
    ..aOS(4, 'DataID', protoName: 'DataID')
    ..a<$core.int>(5, 'ChunkSize', $pb.PbFieldType.O3, protoName: 'ChunkSize')
    ..a<$core.int>(6, 'StartOffset', $pb.PbFieldType.O3, protoName: 'StartOffset')
    ..a<$core.int>(7, 'EndOffset', $pb.PbFieldType.O3, protoName: 'EndOffset')
    ..aInt64(8, 'TotalSize', protoName: 'TotalSize')
    ..a<$core.int>(11, 'DataMd5', $pb.PbFieldType.O3, protoName: 'DataMd5')
    ..hasRequiredFields = false
  ;

  DownloadResponse._() : super();
  factory DownloadResponse() => create();
  factory DownloadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DownloadResponse clone() => DownloadResponse()..mergeFromMessage(this);
  DownloadResponse copyWith(void Function(DownloadResponse) updates) => super.copyWith((message) => updates(message as DownloadResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DownloadResponse create() => DownloadResponse._();
  DownloadResponse createEmptyInstance() => create();
  static $pb.PbList<DownloadResponse> createRepeated() => $pb.PbList<DownloadResponse>();
  @$core.pragma('dart2js:noInline')
  static DownloadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloadResponse>(create);
  static DownloadResponse _defaultInstance;

  @$pb.TagNumber(1)
  $5.ResponseCode get code => $_getN(0);
  @$pb.TagNumber(1)
  set code($5.ResponseCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get dataID => $_getSZ(3);
  @$pb.TagNumber(4)
  set dataID($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDataID() => $_has(3);
  @$pb.TagNumber(4)
  void clearDataID() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get chunkSize => $_getIZ(4);
  @$pb.TagNumber(5)
  set chunkSize($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChunkSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearChunkSize() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get startOffset => $_getIZ(5);
  @$pb.TagNumber(6)
  set startOffset($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStartOffset() => $_has(5);
  @$pb.TagNumber(6)
  void clearStartOffset() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get endOffset => $_getIZ(6);
  @$pb.TagNumber(7)
  set endOffset($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasEndOffset() => $_has(6);
  @$pb.TagNumber(7)
  void clearEndOffset() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get totalSize => $_getI64(7);
  @$pb.TagNumber(8)
  set totalSize($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTotalSize() => $_has(7);
  @$pb.TagNumber(8)
  void clearTotalSize() => clearField(8);

  @$pb.TagNumber(11)
  $core.int get dataMd5 => $_getIZ(8);
  @$pb.TagNumber(11)
  set dataMd5($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(11)
  $core.bool hasDataMd5() => $_has(8);
  @$pb.TagNumber(11)
  void clearDataMd5() => clearField(11);
}

