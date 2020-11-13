///
//  Generated code. Do not modify.
//  source: proto/gateWay.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const SignInRequest$json = const {
  '1': 'SignInRequest',
  '2': const [
    const {'1': 'LoginType', '3': 1, '4': 1, '5': 14, '6': '.proto.LoginType', '10': 'LoginType'},
    const {'1': 'User', '3': 2, '4': 1, '5': 9, '10': 'User'},
    const {'1': 'PhoneNumber', '3': 3, '4': 1, '5': 3, '10': 'PhoneNumber'},
    const {'1': 'PassWord', '3': 4, '4': 1, '5': 9, '10': 'PassWord'},
    const {'1': 'DeviceType', '3': 5, '4': 1, '5': 9, '10': 'DeviceType'},
    const {'1': 'DeviceVersion', '3': 6, '4': 1, '5': 9, '10': 'DeviceVersion'},
  ],
};

const SignInResponse$json = const {
  '1': 'SignInResponse',
  '2': const [
    const {'1': 'Message', '3': 1, '4': 1, '5': 9, '10': 'Message'},
    const {'1': 'Code', '3': 2, '4': 1, '5': 14, '6': '.proto.ResponseCode', '10': 'Code'},
    const {'1': 'Token', '3': 3, '4': 1, '5': 9, '10': 'Token'},
    const {'1': 'Data', '3': 4, '4': 1, '5': 11, '6': '.proto.AccountResponse', '10': 'Data'},
  ],
};

const SignUpRequest$json = const {
  '1': 'SignUpRequest',
  '2': const [
    const {'1': 'User', '3': 1, '4': 1, '5': 9, '10': 'User'},
    const {'1': 'PhoneNumber', '3': 2, '4': 1, '5': 3, '10': 'PhoneNumber'},
    const {'1': 'PassWord', '3': 3, '4': 1, '5': 9, '10': 'PassWord'},
    const {'1': 'Device', '3': 4, '4': 1, '5': 9, '10': 'Device'},
  ],
};

const SignUpResponse$json = const {
  '1': 'SignUpResponse',
  '2': const [
    const {'1': 'Message', '3': 1, '4': 1, '5': 9, '10': 'Message'},
    const {'1': 'Code', '3': 2, '4': 1, '5': 14, '6': '.proto.ResponseCode', '10': 'Code'},
  ],
};

const ResourceData$json = const {
  '1': 'ResourceData',
  '2': const [
    const {'1': 'ResourceId', '3': 1, '4': 1, '5': 9, '10': 'ResourceId'},
    const {'1': 'ResourceAddress', '3': 2, '4': 1, '5': 9, '10': 'ResourceAddress'},
  ],
};

const ResourceDownloadRequest$json = const {
  '1': 'ResourceDownloadRequest',
  '2': const [
    const {'1': 'UserId', '3': 1, '4': 1, '5': 9, '10': 'UserId'},
    const {'1': 'ResourceId', '3': 2, '4': 3, '5': 9, '10': 'ResourceId'},
  ],
};

const ResourceDownloadResponse$json = const {
  '1': 'ResourceDownloadResponse',
  '2': const [
    const {'1': 'Message', '3': 1, '4': 1, '5': 9, '10': 'Message'},
    const {'1': 'Code', '3': 2, '4': 1, '5': 14, '6': '.proto.ResponseCode', '10': 'Code'},
    const {'1': 'Data', '3': 3, '4': 3, '5': 11, '6': '.proto.ResourceData', '10': 'Data'},
  ],
};

const ResourcePreviewRequest$json = const {
  '1': 'ResourcePreviewRequest',
  '2': const [
    const {'1': 'UserId', '3': 1, '4': 1, '5': 9, '10': 'UserId'},
    const {'1': 'Data', '3': 2, '4': 3, '5': 11, '6': '.proto.ResourceData', '10': 'Data'},
  ],
};

const ResourcePreviewResponse$json = const {
  '1': 'ResourcePreviewResponse',
  '2': const [
    const {'1': 'Message', '3': 1, '4': 1, '5': 9, '10': 'Message'},
    const {'1': 'Code', '3': 2, '4': 1, '5': 14, '6': '.proto.ResponseCode', '10': 'Code'},
    const {'1': 'Data', '3': 3, '4': 3, '5': 11, '6': '.proto.ResourceData', '10': 'Data'},
  ],
};

