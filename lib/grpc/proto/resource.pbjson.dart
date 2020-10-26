///
//  Generated code. Do not modify.
//  source: proto/resource.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const UploadRequest$json = const {
  '1': 'UploadRequest',
  '2': const [
    const {'1': 'ResourceLangType', '3': 1, '4': 1, '5': 14, '6': '.proto.ResourceLangType', '10': 'ResourceLangType'},
    const {'1': 'FileType', '3': 2, '4': 1, '5': 14, '6': '.proto.FileType', '10': 'FileType'},
    const {'1': 'Data', '3': 3, '4': 1, '5': 12, '10': 'Data'},
    const {'1': 'DataID', '3': 4, '4': 1, '5': 9, '10': 'DataID'},
    const {'1': 'ChunkSize', '3': 5, '4': 1, '5': 5, '10': 'ChunkSize'},
    const {'1': 'StartOffset', '3': 6, '4': 1, '5': 5, '10': 'StartOffset'},
    const {'1': 'EndOffset', '3': 7, '4': 1, '5': 5, '10': 'EndOffset'},
    const {'1': 'CheckSum', '3': 8, '4': 1, '5': 5, '10': 'CheckSum'},
    const {'1': 'TotalSize', '3': 9, '4': 1, '5': 3, '10': 'TotalSize'},
    const {'1': 'DataMd5', '3': 11, '4': 1, '5': 5, '10': 'DataMd5'},
  ],
};

const UploadResponse$json = const {
  '1': 'UploadResponse',
  '2': const [
    const {'1': 'Code', '3': 1, '4': 1, '5': 14, '6': '.proto.ResponseCode', '10': 'Code'},
    const {'1': 'Message', '3': 2, '4': 1, '5': 9, '10': 'Message'},
  ],
};

const OperationRequest$json = const {
  '1': 'OperationRequest',
  '2': const [
    const {'1': 'ResourceID', '3': 1, '4': 3, '5': 9, '10': 'ResourceID'},
    const {'1': 'ResouceAction', '3': 2, '4': 1, '5': 14, '6': '.proto.ResouceAction', '10': 'ResouceAction'},
  ],
};

const OperationResponse$json = const {
  '1': 'OperationResponse',
  '2': const [
    const {'1': 'Code', '3': 1, '4': 1, '5': 14, '6': '.proto.ResponseCode', '10': 'Code'},
    const {'1': 'Message', '3': 2, '4': 1, '5': 9, '10': 'Message'},
  ],
};

const DownloadRequest$json = const {
  '1': 'DownloadRequest',
  '2': const [
    const {'1': 'ResourceID', '3': 1, '4': 3, '5': 9, '10': 'ResourceID'},
  ],
};

const DownloadResponse$json = const {
  '1': 'DownloadResponse',
  '2': const [
    const {'1': 'Code', '3': 1, '4': 1, '5': 14, '6': '.proto.ResponseCode', '10': 'Code'},
    const {'1': 'Message', '3': 2, '4': 1, '5': 9, '10': 'Message'},
    const {'1': 'Data', '3': 3, '4': 1, '5': 12, '10': 'Data'},
    const {'1': 'DataID', '3': 4, '4': 1, '5': 9, '10': 'DataID'},
    const {'1': 'ChunkSize', '3': 5, '4': 1, '5': 5, '10': 'ChunkSize'},
    const {'1': 'StartOffset', '3': 6, '4': 1, '5': 5, '10': 'StartOffset'},
    const {'1': 'EndOffset', '3': 7, '4': 1, '5': 5, '10': 'EndOffset'},
    const {'1': 'DataMd5', '3': 11, '4': 1, '5': 5, '10': 'DataMd5'},
    const {'1': 'TotalSize', '3': 8, '4': 1, '5': 3, '10': 'TotalSize'},
  ],
};

