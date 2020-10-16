///
//  Generated code. Do not modify.
//  source: proto/search.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const ResourceSection$json = const {
  '1': 'ResourceSection',
  '2': const [
    const {'1': 'Source', '3': 1, '4': 1, '5': 9, '10': 'Source'},
    const {'1': 'Duration', '3': 2, '4': 1, '5': 2, '10': 'Duration'},
    const {'1': 'EmotionCode', '3': 3, '4': 1, '5': 14, '6': '.proto.EmotionCode', '10': 'EmotionCode'},
    const {'1': 'SourceName', '3': 4, '4': 1, '5': 9, '10': 'SourceName'},
    const {'1': 'ResourceAddrees', '3': 5, '4': 1, '5': 9, '10': 'ResourceAddrees'},
    const {'1': 'ResourceID', '3': 6, '4': 1, '5': 9, '10': 'ResourceID'},
    const {'1': 'SourceID', '3': 7, '4': 1, '5': 9, '10': 'SourceID'},
  ],
};

const SearchRequest$json = const {
  '1': 'SearchRequest',
  '2': const [
    const {'1': 'Text', '3': 1, '4': 1, '5': 9, '10': 'Text'},
    const {'1': 'Limit', '3': 2, '4': 1, '5': 5, '10': 'Limit'},
    const {'1': 'Offest', '3': 3, '4': 1, '5': 5, '10': 'Offest'},
    const {'1': 'Tags', '3': 4, '4': 3, '5': 9, '10': 'Tags'},
    const {'1': 'EmotionCode', '3': 5, '4': 1, '5': 14, '6': '.proto.EmotionCode', '10': 'EmotionCode'},
  ],
};

const SearchResponse$json = const {
  '1': 'SearchResponse',
  '2': const [
    const {'1': 'StatusCode', '3': 1, '4': 1, '5': 14, '6': '.proto.ResponseCode', '10': 'StatusCode'},
    const {'1': 'Message', '3': 2, '4': 1, '5': 9, '10': 'Message'},
    const {'1': 'ResourceSection', '3': 3, '4': 3, '5': 11, '6': '.proto.ResourceSection', '10': 'ResourceSection'},
  ],
};

