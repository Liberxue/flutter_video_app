///
//  Generated code. Do not modify.
//  source: proto/favorite.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const FavoriteActionRequest$json = const {
  '1': 'FavoriteActionRequest',
  '2': const [
    const {'1': 'ResourceID', '3': 1, '4': 1, '5': 9, '10': 'ResourceID'},
    const {'1': 'Userid', '3': 2, '4': 1, '5': 9, '10': 'Userid'},
    const {'1': 'IsFavorite', '3': 3, '4': 1, '5': 8, '10': 'IsFavorite'},
  ],
};

const FavoriteActionResponse$json = const {
  '1': 'FavoriteActionResponse',
  '2': const [
    const {'1': 'Message', '3': 1, '4': 1, '5': 9, '10': 'Message'},
    const {'1': 'Code', '3': 2, '4': 1, '5': 14, '6': '.proto.ResponseCode', '10': 'Code'},
  ],
};

const FavoriteList$json = const {
  '1': 'FavoriteList',
  '2': const [
    const {'1': 'ResourceId', '3': 1, '4': 1, '5': 9, '10': 'ResourceId'},
    const {'1': 'UserId', '3': 3, '4': 1, '5': 9, '10': 'UserId'},
    const {'1': 'CreateTime', '3': 2, '4': 1, '5': 3, '10': 'CreateTime'},
    const {'1': 'ResourceType', '3': 4, '4': 1, '5': 14, '6': '.proto.ResourceType', '10': 'ResourceType'},
  ],
};

const FavoriteListRequest$json = const {
  '1': 'FavoriteListRequest',
  '2': const [
    const {'1': 'FavoriteList', '3': 1, '4': 3, '5': 11, '6': '.proto.FavoriteList', '10': 'FavoriteList'},
  ],
};

const FavoriteListResponse$json = const {
  '1': 'FavoriteListResponse',
  '2': const [
    const {'1': 'Message', '3': 1, '4': 1, '5': 9, '10': 'Message'},
    const {'1': 'Code', '3': 2, '4': 1, '5': 14, '6': '.proto.ResponseCode', '10': 'Code'},
    const {'1': 'Data', '3': 3, '4': 3, '5': 11, '6': '.proto.FavoriteList', '10': 'Data'},
  ],
};

