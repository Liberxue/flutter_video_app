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
  static final _$favorite =
      $grpc.ClientMethod<$1.FavoriteRequest, $1.FavoriteResponse>(
          '/proto.GateWay/Favorite',
          ($1.FavoriteRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.FavoriteResponse.fromBuffer(value));

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

  $grpc.ResponseFuture<$1.FavoriteResponse> favorite($1.FavoriteRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$favorite, $async.Stream.fromIterable([request]),
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
    $addMethod($grpc.ServiceMethod<$1.FavoriteRequest, $1.FavoriteResponse>(
        'Favorite',
        favorite_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FavoriteRequest.fromBuffer(value),
        ($1.FavoriteResponse value) => value.writeToBuffer()));
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

  $async.Future<$1.FavoriteResponse> favorite_Pre(
      $grpc.ServiceCall call, $async.Future<$1.FavoriteRequest> request) async {
    return favorite(call, await request);
  }

  $async.Future<$1.SignInResponse> signIn(
      $grpc.ServiceCall call, $1.SignInRequest request);
  $async.Future<$1.SignUpResponse> signUp(
      $grpc.ServiceCall call, $1.SignUpRequest request);
  $async.Future<$2.SearchResponse> search(
      $grpc.ServiceCall call, $2.SearchRequest request);
  $async.Future<$1.FavoriteResponse> favorite(
      $grpc.ServiceCall call, $1.FavoriteRequest request);
}
