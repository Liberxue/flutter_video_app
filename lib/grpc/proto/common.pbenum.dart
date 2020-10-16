///
//  Generated code. Do not modify.
//  source: proto/common.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ResourceLangType extends $pb.ProtobufEnum {
  static const ResourceLangType ENGLISH = ResourceLangType._(0, 'ENGLISH');

  static const $core.List<ResourceLangType> values = <ResourceLangType> [
    ENGLISH,
  ];

  static final $core.Map<$core.int, ResourceLangType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ResourceLangType valueOf($core.int value) => _byValue[value];

  const ResourceLangType._($core.int v, $core.String n) : super(v, n);
}

class FileType extends $pb.ProtobufEnum {
  static const FileType MP4 = FileType._(0, 'MP4');
  static const FileType M4P = FileType._(2, 'M4P');
  static const FileType M4V = FileType._(3, 'M4V');
  static const FileType AVI = FileType._(4, 'AVI');
  static const FileType WMV = FileType._(5, 'WMV');
  static const FileType MOV = FileType._(6, 'MOV');
  static const FileType QT = FileType._(7, 'QT');
  static const FileType FLV = FileType._(8, 'FLV');
  static const FileType SWF = FileType._(9, 'SWF');

  static const $core.List<FileType> values = <FileType> [
    MP4,
    M4P,
    M4V,
    AVI,
    WMV,
    MOV,
    QT,
    FLV,
    SWF,
  ];

  static final $core.Map<$core.int, FileType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static FileType valueOf($core.int value) => _byValue[value];

  const FileType._($core.int v, $core.String n) : super(v, n);
}

class EmotionCode extends $pb.ProtobufEnum {
  static const EmotionCode AMUSEMENT = EmotionCode._(0, 'AMUSEMENT');
  static const EmotionCode CONTEMPT = EmotionCode._(1, 'CONTEMPT');
  static const EmotionCode CONTENTMENT = EmotionCode._(2, 'CONTENTMENT');
  static const EmotionCode EMBARRASSMENT = EmotionCode._(3, 'EMBARRASSMENT');
  static const EmotionCode EXCITEMENT = EmotionCode._(4, 'EXCITEMENT');
  static const EmotionCode GUILT = EmotionCode._(5, 'GUILT');
  static const EmotionCode PRIDEINACHIEVEMENT = EmotionCode._(6, 'PRIDEINACHIEVEMENT');
  static const EmotionCode RELIEF = EmotionCode._(7, 'RELIEF');
  static const EmotionCode SATISFACTION = EmotionCode._(8, 'SATISFACTION');
  static const EmotionCode SHAME = EmotionCode._(9, 'SHAME');

  static const $core.List<EmotionCode> values = <EmotionCode> [
    AMUSEMENT,
    CONTEMPT,
    CONTENTMENT,
    EMBARRASSMENT,
    EXCITEMENT,
    GUILT,
    PRIDEINACHIEVEMENT,
    RELIEF,
    SATISFACTION,
    SHAME,
  ];

  static final $core.Map<$core.int, EmotionCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static EmotionCode valueOf($core.int value) => _byValue[value];

  const EmotionCode._($core.int v, $core.String n) : super(v, n);
}

class ResouceAction extends $pb.ProtobufEnum {
  static const ResouceAction MERGE = ResouceAction._(0, 'MERGE');
  static const ResouceAction FAVORITE = ResouceAction._(2, 'FAVORITE');

  static const $core.List<ResouceAction> values = <ResouceAction> [
    MERGE,
    FAVORITE,
  ];

  static final $core.Map<$core.int, ResouceAction> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ResouceAction valueOf($core.int value) => _byValue[value];

  const ResouceAction._($core.int v, $core.String n) : super(v, n);
}

class LevelType extends $pb.ProtobufEnum {
  static const LevelType VIP = LevelType._(0, 'VIP');
  static const LevelType SuperVIP = LevelType._(1, 'SuperVIP');

  static const $core.List<LevelType> values = <LevelType> [
    VIP,
    SuperVIP,
  ];

  static final $core.Map<$core.int, LevelType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static LevelType valueOf($core.int value) => _byValue[value];

  const LevelType._($core.int v, $core.String n) : super(v, n);
}

class ResponseCode extends $pb.ProtobufEnum {
  static const ResponseCode SUCCESSFUL = ResponseCode._(0, 'SUCCESSFUL');
  static const ResponseCode FAILED = ResponseCode._(1, 'FAILED');
  static const ResponseCode AccessDenied = ResponseCode._(2, 'AccessDenied');
  static const ResponseCode InternalFault = ResponseCode._(3, 'InternalFault');
  static const ResponseCode FrequentOperation = ResponseCode._(4, 'FrequentOperation');
  static const ResponseCode PhoneNumberExisting = ResponseCode._(5, 'PhoneNumberExisting');
  static const ResponseCode ParameterIsNotValid = ResponseCode._(6, 'ParameterIsNotValid');
  static const ResponseCode AccountOrPasswordIsNotCorrect = ResponseCode._(7, 'AccountOrPasswordIsNotCorrect');

  static const $core.List<ResponseCode> values = <ResponseCode> [
    SUCCESSFUL,
    FAILED,
    AccessDenied,
    InternalFault,
    FrequentOperation,
    PhoneNumberExisting,
    ParameterIsNotValid,
    AccountOrPasswordIsNotCorrect,
  ];

  static final $core.Map<$core.int, ResponseCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ResponseCode valueOf($core.int value) => _byValue[value];

  const ResponseCode._($core.int v, $core.String n) : super(v, n);
}

class LoginType extends $pb.ProtobufEnum {
  static const LoginType ACCOUNT = LoginType._(0, 'ACCOUNT');
  static const LoginType PHONEMESSAGEAUTHCODE = LoginType._(1, 'PHONEMESSAGEAUTHCODE');
  static const LoginType WECHAT = LoginType._(2, 'WECHAT');
  static const LoginType DOUYIN = LoginType._(3, 'DOUYIN');

  static const $core.List<LoginType> values = <LoginType> [
    ACCOUNT,
    PHONEMESSAGEAUTHCODE,
    WECHAT,
    DOUYIN,
  ];

  static final $core.Map<$core.int, LoginType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static LoginType valueOf($core.int value) => _byValue[value];

  const LoginType._($core.int v, $core.String n) : super(v, n);
}

