///
//  Generated code. Do not modify.
//  source: proto/resource.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'resource.pb.dart' as $2;
import 'search.pb.dart' as $1;
export 'resource.pb.dart';

class ResouceServiceClient extends $grpc.Client {
  static final _$upload =
      $grpc.ClientMethod<$2.UploadRequest, $2.UploadResponse>(
          '/proto.ResouceService/Upload',
          ($2.UploadRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.UploadResponse.fromBuffer(value));
  static final _$search =
      $grpc.ClientMethod<$1.SearchRequest, $1.SearchResponse>(
          '/proto.ResouceService/Search',
          ($1.SearchRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.SearchResponse.fromBuffer(value));
  static final _$operation =
      $grpc.ClientMethod<$2.OperationRequest, $2.OperationResponse>(
          '/proto.ResouceService/Operation',
          ($2.OperationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.OperationResponse.fromBuffer(value));
  static final _$download =
      $grpc.ClientMethod<$2.DownloadRequest, $2.DownloadResponse>(
          '/proto.ResouceService/Download',
          ($2.DownloadRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.DownloadResponse.fromBuffer(value));

  ResouceServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$2.UploadResponse> upload(
      $async.Stream<$2.UploadRequest> request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$upload, request, options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.SearchResponse> search($1.SearchRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$search, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.OperationResponse> operation(
      $2.OperationRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$operation, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<$2.DownloadResponse> download($2.DownloadRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$download, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }
}

abstract class ResouceServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.ResouceService';

  ResouceServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.UploadRequest, $2.UploadResponse>(
        'Upload',
        upload,
        true,
        false,
        ($core.List<$core.int> value) => $2.UploadRequest.fromBuffer(value),
        ($2.UploadResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SearchRequest, $1.SearchResponse>(
        'Search',
        search_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.SearchRequest.fromBuffer(value),
        ($1.SearchResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.OperationRequest, $2.OperationResponse>(
        'Operation',
        operation_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.OperationRequest.fromBuffer(value),
        ($2.OperationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.DownloadRequest, $2.DownloadResponse>(
        'Download',
        download_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $2.DownloadRequest.fromBuffer(value),
        ($2.DownloadResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.SearchResponse> search_Pre(
      $grpc.ServiceCall call, $async.Future<$1.SearchRequest> request) async {
    return search(call, await request);
  }

  $async.Future<$2.OperationResponse> operation_Pre($grpc.ServiceCall call,
      $async.Future<$2.OperationRequest> request) async {
    return operation(call, await request);
  }

  $async.Stream<$2.DownloadResponse> download_Pre($grpc.ServiceCall call,
      $async.Future<$2.DownloadRequest> request) async* {
    yield* download(call, await request);
  }

  $async.Future<$2.UploadResponse> upload(
      $grpc.ServiceCall call, $async.Stream<$2.UploadRequest> request);
  $async.Future<$1.SearchResponse> search(
      $grpc.ServiceCall call, $1.SearchRequest request);
  $async.Future<$2.OperationResponse> operation(
      $grpc.ServiceCall call, $2.OperationRequest request);
  $async.Stream<$2.DownloadResponse> download(
      $grpc.ServiceCall call, $2.DownloadRequest request);
}
