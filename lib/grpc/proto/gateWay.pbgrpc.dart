///
//  Generated code. Do not modify.
//  source: proto/gateWay.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'gateWay.pb.dart' as $1;
import 'search.pb.dart' as $2;
import 'favorite.pb.dart' as $3;
export 'gateWay.pb.dart';

class GateWayClient extends $grpc.Client {
  static final _$signIn =
      $grpc.ClientMethod<$1.SignInRequest, $1.SignInResponse>(
          '/proto.GateWay/SignIn',
          ($1.SignInRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.SignInResponse.fromBuffer(value));
  static final _$signUp =
      $grpc.ClientMethod<$1.SignUpRequest, $1.SignUpResponse>(
          '/proto.GateWay/SignUp',
          ($1.SignUpRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.SignUpResponse.fromBuffer(value));
  static final _$search =
      $grpc.ClientMethod<$2.SearchRequest, $2.SearchResponse>(
          '/proto.GateWay/Search',
          ($2.SearchRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.SearchResponse.fromBuffer(value));
  static final _$favoriteAction =
      $grpc.ClientMethod<$3.FavoriteActionRequest, $3.FavoriteActionResponse>(
          '/proto.GateWay/FavoriteAction',
          ($3.FavoriteActionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.FavoriteActionResponse.fromBuffer(value));
  static final _$favoriteList =
      $grpc.ClientMethod<$3.FavoriteListRequest, $3.FavoriteListResponse>(
          '/proto.GateWay/FavoriteList',
          ($3.FavoriteListRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.FavoriteListResponse.fromBuffer(value));
  static final _$resourcePreview =
      $grpc.ClientMethod<$1.ResourcePreviewRequest, $1.ResourcePreviewResponse>(
          '/proto.GateWay/ResourcePreview',
          ($1.ResourcePreviewRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.ResourcePreviewResponse.fromBuffer(value));
  static final _$resourceDownload = $grpc.ClientMethod<
          $1.ResourceDownloadRequest, $1.ResourceDownloadResponse>(
      '/proto.GateWay/ResourceDownload',
      ($1.ResourceDownloadRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.ResourceDownloadResponse.fromBuffer(value));

  GateWayClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.SignInResponse> signIn($1.SignInRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$signIn, request, options: options);
  }

  $grpc.ResponseFuture<$1.SignUpResponse> signUp($1.SignUpRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$signUp, request, options: options);
  }

  $grpc.ResponseFuture<$2.SearchResponse> search($2.SearchRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$search, request, options: options);
  }

  $grpc.ResponseFuture<$3.FavoriteActionResponse> favoriteAction(
      $3.FavoriteActionRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$favoriteAction, request, options: options);
  }

  $grpc.ResponseFuture<$3.FavoriteListResponse> favoriteList(
      $3.FavoriteListRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$favoriteList, request, options: options);
  }

  $grpc.ResponseFuture<$1.ResourcePreviewResponse> resourcePreview(
      $1.ResourcePreviewRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$resourcePreview, request, options: options);
  }

  $grpc.ResponseFuture<$1.ResourceDownloadResponse> resourceDownload(
      $1.ResourceDownloadRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$resourceDownload, request, options: options);
  }
}

abstract class GateWayServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.GateWay';

  GateWayServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.SignInRequest, $1.SignInResponse>(
        'SignIn',
        signIn_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.SignInRequest.fromBuffer(value),
        ($1.SignInResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SignUpRequest, $1.SignUpResponse>(
        'SignUp',
        signUp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.SignUpRequest.fromBuffer(value),
        ($1.SignUpResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.SearchRequest, $2.SearchResponse>(
        'Search',
        search_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.SearchRequest.fromBuffer(value),
        ($2.SearchResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.FavoriteActionRequest,
            $3.FavoriteActionResponse>(
        'FavoriteAction',
        favoriteAction_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.FavoriteActionRequest.fromBuffer(value),
        ($3.FavoriteActionResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$3.FavoriteListRequest, $3.FavoriteListResponse>(
            'FavoriteList',
            favoriteList_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $3.FavoriteListRequest.fromBuffer(value),
            ($3.FavoriteListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ResourcePreviewRequest,
            $1.ResourcePreviewResponse>(
        'ResourcePreview',
        resourcePreview_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.ResourcePreviewRequest.fromBuffer(value),
        ($1.ResourcePreviewResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ResourceDownloadRequest,
            $1.ResourceDownloadResponse>(
        'ResourceDownload',
        resourceDownload_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.ResourceDownloadRequest.fromBuffer(value),
        ($1.ResourceDownloadResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.SignInResponse> signIn_Pre(
      $grpc.ServiceCall call, $async.Future<$1.SignInRequest> request) async {
    return signIn(call, await request);
  }

  $async.Future<$1.SignUpResponse> signUp_Pre(
      $grpc.ServiceCall call, $async.Future<$1.SignUpRequest> request) async {
    return signUp(call, await request);
  }

  $async.Future<$2.SearchResponse> search_Pre(
      $grpc.ServiceCall call, $async.Future<$2.SearchRequest> request) async {
    return search(call, await request);
  }

  $async.Future<$3.FavoriteActionResponse> favoriteAction_Pre(
      $grpc.ServiceCall call,
      $async.Future<$3.FavoriteActionRequest> request) async {
    return favoriteAction(call, await request);
  }

  $async.Future<$3.FavoriteListResponse> favoriteList_Pre(
      $grpc.ServiceCall call,
      $async.Future<$3.FavoriteListRequest> request) async {
    return favoriteList(call, await request);
  }

  $async.Future<$1.ResourcePreviewResponse> resourcePreview_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.ResourcePreviewRequest> request) async {
    return resourcePreview(call, await request);
  }

  $async.Future<$1.ResourceDownloadResponse> resourceDownload_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.ResourceDownloadRequest> request) async {
    return resourceDownload(call, await request);
  }

  $async.Future<$1.SignInResponse> signIn(
      $grpc.ServiceCall call, $1.SignInRequest request);
  $async.Future<$1.SignUpResponse> signUp(
      $grpc.ServiceCall call, $1.SignUpRequest request);
  $async.Future<$2.SearchResponse> search(
      $grpc.ServiceCall call, $2.SearchRequest request);
  $async.Future<$3.FavoriteActionResponse> favoriteAction(
      $grpc.ServiceCall call, $3.FavoriteActionRequest request);
  $async.Future<$3.FavoriteListResponse> favoriteList(
      $grpc.ServiceCall call, $3.FavoriteListRequest request);
  $async.Future<$1.ResourcePreviewResponse> resourcePreview(
      $grpc.ServiceCall call, $1.ResourcePreviewRequest request);
  $async.Future<$1.ResourceDownloadResponse> resourceDownload(
      $grpc.ServiceCall call, $1.ResourceDownloadRequest request);
}
