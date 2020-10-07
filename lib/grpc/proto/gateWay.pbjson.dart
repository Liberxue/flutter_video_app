///
//  Generated code. Do not modify.
//  source: proto/gateWay.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const LoginRequest$json = const {
  '1': 'LoginRequest',
  '2': const [
    const {'1': 'User', '3': 1, '4': 1, '5': 9, '10': 'User'},
    const {'1': 'PassWord', '3': 2, '4': 1, '5': 9, '10': 'PassWord'},
    const {'1': 'Device', '3': 3, '4': 1, '5': 9, '10': 'Device'},
  ],
};

const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'UserName', '3': 1, '4': 1, '5': 9, '10': 'UserName'},
    const {'1': 'Level', '3': 2, '4': 1, '5': 14, '6': '.proto.LevelType', '10': 'Level'},
    const {'1': 'Quota', '3': 3, '4': 1, '5': 3, '10': 'Quota'},
  ],
};

const LoginResponse$json = const {
  '1': 'LoginResponse',
  '2': const [
    const {'1': 'Message', '3': 1, '4': 1, '5': 9, '10': 'Message'},
    const {'1': 'Code', '3': 2, '4': 1, '5': 5, '10': 'Code'},
    const {'1': 'Token', '3': 3, '4': 1, '5': 9, '10': 'Token'},
    const {'1': 'Data', '3': 4, '4': 1, '5': 11, '6': '.proto.User', '10': 'Data'},
  ],
};

const SignInRequest$json = const {
  '1': 'SignInRequest',
  '2': const [
    const {'1': 'User', '3': 1, '4': 1, '5': 9, '10': 'User'},
    const {'1': 'PassWord', '3': 2, '4': 1, '5': 9, '10': 'PassWord'},
    const {'1': 'Device', '3': 3, '4': 1, '5': 9, '10': 'Device'},
  ],
};

const SignInResponse$json = const {
  '1': 'SignInResponse',
  '2': const [
    const {'1': 'Message', '3': 1, '4': 1, '5': 9, '10': 'Message'},
    const {'1': 'Code', '3': 2, '4': 1, '5': 5, '10': 'Code'},
  ],
};

const FavoriteRequest$json = const {
  '1': 'FavoriteRequest',
  '2': const [
    const {'1': 'ResourceID', '3': 1, '4': 1, '5': 9, '10': 'ResourceID'},
    const {'1': 'IsFavorite', '3': 2, '4': 1, '5': 8, '10': 'IsFavorite'},
  ],
};

const FavoriteResponse$json = const {
  '1': 'FavoriteResponse',
  '2': const [
    const {'1': 'Message', '3': 1, '4': 1, '5': 9, '10': 'Message'},
    const {'1': 'code', '3': 2, '4': 1, '5': 1, '10': 'code'},
  ],
};

