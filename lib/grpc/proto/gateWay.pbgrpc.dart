///
//  Generated code. Do not modify.
//  source: proto/gateWay.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

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
  static final _$reourcePreview =
      $grpc.ClientMethod<$1.ReourcePreviewRequest, $1.ReourcePreviewResponse>(
          '/proto.GateWay/ReourcePreview',
          ($1.ReourcePreviewRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.ReourcePreviewResponse.fromBuffer(value));
  static final _$reourceDownload =
      $grpc.ClientMethod<$1.ReourceDownloadRequest, $1.ReourceDownloadResponse>(
          '/proto.GateWay/ReourceDownload',
          ($1.ReourceDownloadRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.ReourceDownloadResponse.fromBuffer(value));

  GateWayClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$1.SignInResponse> signIn($1.SignInRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$signIn, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.SignUpResponse> signUp($1.SignUpRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$signUp, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.SearchResponse> search($2.SearchRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$search, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$3.FavoriteActionResponse> favoriteAction(
      $3.FavoriteActionRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$favoriteAction, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$3.FavoriteListResponse> favoriteList(
      $3.FavoriteListRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$favoriteList, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.ReourcePreviewResponse> reourcePreview(
      $1.ReourcePreviewRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$reourcePreview, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.ReourceDownloadResponse> reourceDownload(
      $1.ReourceDownloadRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$reourceDownload, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
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
    $addMethod($grpc.ServiceMethod<$1.ReourcePreviewRequest,
            $1.ReourcePreviewResponse>(
        'ReourcePreview',
        reourcePreview_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.ReourcePreviewRequest.fromBuffer(value),
        ($1.ReourcePreviewResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ReourceDownloadRequest,
            $1.ReourceDownloadResponse>(
        'ReourceDownload',
        reourceDownload_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.ReourceDownloadRequest.fromBuffer(value),
        ($1.ReourceDownloadResponse value) => value.writeToBuffer()));
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

  $async.Future<$1.ReourcePreviewResponse> reourcePreview_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.ReourcePreviewRequest> request) async {
    return reourcePreview(call, await request);
  }

  $async.Future<$1.ReourceDownloadResponse> reourceDownload_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.ReourceDownloadRequest> request) async {
    return reourceDownload(call, await request);
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
  $async.Future<$1.ReourcePreviewResponse> reourcePreview(
      $grpc.ServiceCall call, $1.ReourcePreviewRequest request);
  $async.Future<$1.ReourceDownloadResponse> reourceDownload(
      $grpc.ServiceCall call, $1.ReourceDownloadRequest request);
}
