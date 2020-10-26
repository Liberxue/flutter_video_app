///
//  Generated code. Do not modify.
//  source: proto/accountManager.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Account$json = const {
  '1': 'Account',
  '2': const [
    const {'1': 'PhoneNumber', '3': 2, '4': 1, '5': 3, '10': 'PhoneNumber'},
    const {'1': 'PassWord', '3': 3, '4': 1, '5': 9, '10': 'PassWord'},
    const {'1': 'DeviceType', '3': 4, '4': 1, '5': 9, '10': 'DeviceType'},
    const {'1': 'DeviceVersion', '3': 5, '4': 1, '5': 9, '10': 'DeviceVersion'},
  ],
};

const AccountResponse$json = const {
  '1': 'AccountResponse',
  '2': const [
    const {'1': 'Id', '3': 1, '4': 1, '5': 9, '10': 'Id'},
    const {'1': 'Name', '3': 2, '4': 1, '5': 9, '10': 'Name'},
    const {'1': 'AvatarImage', '3': 3, '4': 1, '5': 9, '10': 'AvatarImage'},
    const {'1': 'PhoneNumber', '3': 4, '4': 1, '5': 3, '10': 'PhoneNumber'},
    const {'1': 'Coin', '3': 5, '4': 1, '5': 3, '10': 'Coin'},
    const {'1': 'AccountLevel', '3': 6, '4': 1, '5': 9, '10': 'AccountLevel'},
    const {'1': 'Status', '3': 7, '4': 1, '5': 5, '10': 'Status'},
  ],
};

const CreateAccountRequest$json = const {
  '1': 'CreateAccountRequest',
  '2': const [
    const {'1': 'Account', '3': 1, '4': 1, '5': 11, '6': '.proto.Account', '10': 'Account'},
  ],
};

const CreateAccountResponse$json = const {
  '1': 'CreateAccountResponse',
  '2': const [
    const {'1': 'Message', '3': 1, '4': 1, '5': 9, '10': 'Message'},
    const {'1': 'Code', '3': 2, '4': 1, '5': 14, '6': '.proto.ResponseCode', '10': 'Code'},
  ],
};

const LoginAccountRequest$json = const {
  '1': 'LoginAccountRequest',
  '2': const [
    const {'1': 'Account', '3': 1, '4': 1, '5': 11, '6': '.proto.Account', '10': 'Account'},
  ],
};

const LoginAccountResponse$json = const {
  '1': 'LoginAccountResponse',
  '2': const [
    const {'1': 'Message', '3': 1, '4': 1, '5': 9, '10': 'Message'},
    const {'1': 'Code', '3': 2, '4': 1, '5': 14, '6': '.proto.ResponseCode', '10': 'Code'},
    const {'1': 'Data', '3': 3, '4': 1, '5': 11, '6': '.proto.AccountResponse', '10': 'Data'},
  ],
};

const UpdateProfileRequest$json = const {
  '1': 'UpdateProfileRequest',
  '2': const [
    const {'1': 'Id', '3': 1, '4': 1, '5': 9, '10': 'Id'},
    const {'1': 'Name', '3': 2, '4': 1, '5': 9, '10': 'Name'},
    const {'1': 'AvatarImage', '3': 3, '4': 1, '5': 9, '10': 'AvatarImage'},
    const {'1': 'PhoneNumber', '3': 4, '4': 1, '5': 3, '10': 'PhoneNumber'},
  ],
};

const UpdateProfileResponse$json = const {
  '1': 'UpdateProfileResponse',
  '2': const [
    const {'1': 'Message', '3': 1, '4': 1, '5': 9, '10': 'Message'},
    const {'1': 'Code', '3': 2, '4': 1, '5': 14, '6': '.proto.ResponseCode', '10': 'Code'},
  ],
};

const UpdatePassWordRequest$json = const {
  '1': 'UpdatePassWordRequest',
  '2': const [
    const {'1': 'Account', '3': 1, '4': 1, '5': 11, '6': '.proto.Account', '10': 'Account'},
  ],
};

const UpdatePassWordResponse$json = const {
  '1': 'UpdatePassWordResponse',
  '2': const [
    const {'1': 'Message', '3': 1, '4': 1, '5': 9, '10': 'Message'},
    const {'1': 'Code', '3': 2, '4': 1, '5': 14, '6': '.proto.ResponseCode', '10': 'Code'},
  ],
};

const RechargeCoinRequest$json = const {
  '1': 'RechargeCoinRequest',
  '2': const [
    const {'1': 'Id', '3': 1, '4': 1, '5': 9, '10': 'Id'},
    const {'1': 'Coin', '3': 5, '4': 1, '5': 3, '10': 'Coin'},
  ],
};

const RechargeCoinResponse$json = const {
  '1': 'RechargeCoinResponse',
  '2': const [
    const {'1': 'Message', '3': 1, '4': 1, '5': 9, '10': 'Message'},
    const {'1': 'Code', '3': 2, '4': 1, '5': 14, '6': '.proto.ResponseCode', '10': 'Code'},
  ],
};

