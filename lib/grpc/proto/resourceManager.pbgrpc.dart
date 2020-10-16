///
//  Generated code. Do not modify.
//  source: proto/resourceManager.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'resourceManager.pb.dart' as $4;
export 'resourceManager.pb.dart';

class ResourceManagerClient extends $grpc.Client {
  static final _$favoriteResource = $grpc.ClientMethod<
          $4.FavoriteResourceRequest, $4.FavoriteResourceResponse>(
      '/proto.ResourceManager/FavoriteResource',
      ($4.FavoriteResourceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $4.FavoriteResourceResponse.fromBuffer(value));

  ResourceManagerClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$4.FavoriteResourceResponse> favoriteResource(
      $4.FavoriteResourceRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$favoriteResource, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class ResourceManagerServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.ResourceManager';

  ResourceManagerServiceBase() {
    $addMethod($grpc.ServiceMethod<$4.FavoriteResourceRequest,
            $4.FavoriteResourceResponse>(
        'FavoriteResource',
        favoriteResource_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.FavoriteResourceRequest.fromBuffer(value),
        ($4.FavoriteResourceResponse value) => value.writeToBuffer()));
  }

  $async.Future<$4.FavoriteResourceResponse> favoriteResource_Pre(
      $grpc.ServiceCall call,
      $async.Future<$4.FavoriteResourceRequest> request) async {
    return favoriteResource(call, await request);
  }

  $async.Future<$4.FavoriteResourceResponse> favoriteResource(
      $grpc.ServiceCall call, $4.FavoriteResourceRequest request);
}
