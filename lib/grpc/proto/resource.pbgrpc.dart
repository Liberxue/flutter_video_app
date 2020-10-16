///
//  Generated code. Do not modify.
//  source: proto/resource.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'resource.pb.dart' as $3;
import 'search.pb.dart' as $2;
export 'resource.pb.dart';

class ResouceClient extends $grpc.Client {
  static final _$upload =
      $grpc.ClientMethod<$3.UploadRequest, $3.UploadResponse>(
          '/proto.Resouce/Upload',
          ($3.UploadRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.UploadResponse.fromBuffer(value));
  static final _$search =
      $grpc.ClientMethod<$2.SearchRequest, $2.SearchResponse>(
          '/proto.Resouce/Search',
          ($2.SearchRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.SearchResponse.fromBuffer(value));
  static final _$operation =
      $grpc.ClientMethod<$3.OperationRequest, $3.OperationResponse>(
          '/proto.Resouce/Operation',
          ($3.OperationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.OperationResponse.fromBuffer(value));
  static final _$download =
      $grpc.ClientMethod<$3.DownloadRequest, $3.DownloadResponse>(
          '/proto.Resouce/Download',
          ($3.DownloadRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.DownloadResponse.fromBuffer(value));

  ResouceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$3.UploadResponse> upload(
      $async.Stream<$3.UploadRequest> request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$upload, request, options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.SearchResponse> search($2.SearchRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$search, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$3.OperationResponse> operation(
      $3.OperationRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$operation, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<$3.DownloadResponse> download($3.DownloadRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$download, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }
}

abstract class ResouceServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.Resouce';

  ResouceServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.UploadRequest, $3.UploadResponse>(
        'Upload',
        upload,
        true,
        false,
        ($core.List<$core.int> value) => $3.UploadRequest.fromBuffer(value),
        ($3.UploadResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.SearchRequest, $2.SearchResponse>(
        'Search',
        search_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.SearchRequest.fromBuffer(value),
        ($2.SearchResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.OperationRequest, $3.OperationResponse>(
        'Operation',
        operation_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.OperationRequest.fromBuffer(value),
        ($3.OperationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.DownloadRequest, $3.DownloadResponse>(
        'Download',
        download_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $3.DownloadRequest.fromBuffer(value),
        ($3.DownloadResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.SearchResponse> search_Pre(
      $grpc.ServiceCall call, $async.Future<$2.SearchRequest> request) async {
    return search(call, await request);
  }

  $async.Future<$3.OperationResponse> operation_Pre($grpc.ServiceCall call,
      $async.Future<$3.OperationRequest> request) async {
    return operation(call, await request);
  }

  $async.Stream<$3.DownloadResponse> download_Pre($grpc.ServiceCall call,
      $async.Future<$3.DownloadRequest> request) async* {
    yield* download(call, await request);
  }

  $async.Future<$3.UploadResponse> upload(
      $grpc.ServiceCall call, $async.Stream<$3.UploadRequest> request);
  $async.Future<$2.SearchResponse> search(
      $grpc.ServiceCall call, $2.SearchRequest request);
  $async.Future<$3.OperationResponse> operation(
      $grpc.ServiceCall call, $3.OperationRequest request);
  $async.Stream<$3.DownloadResponse> download(
      $grpc.ServiceCall call, $3.DownloadRequest request);
}
