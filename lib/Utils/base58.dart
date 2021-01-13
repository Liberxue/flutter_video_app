import 'dart:typed_data';

import 'package:base_x/base_x.dart';

var base58 =
    BaseXCodec('123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz');

String encodeBase58(String hash) {
  String data = base58.encode(string2Uint8List(hash));
  return data;
}

Uint8List string2Uint8List(String source) {
  var list = <int>[];
  source.runes.forEach((rune) {
    if (rune >= 0x10000) {
      rune -= 0x10000;
      int firstWord = (rune >> 10) + 0xD800;
      list.add(firstWord >> 8);
      list.add(firstWord & 0xFF);
      int secondWord = (rune & 0x3FF) + 0xDC00;
      list.add(secondWord >> 8);
      list.add(secondWord & 0xFF);
    } else {
      list.add(rune >> 8);
      list.add(rune & 0xFF);
    }
  });
  return Uint8List.fromList(list);
}

String decodeBase58(String decode) {
  return uint8List2String(base58.decode(decode));
}

//  // Bytes to UTF-16 string
String uint8List2String(Uint8List bytes) {
  StringBuffer buffer = new StringBuffer();
  for (int i = 0; i < bytes.length;) {
    int firstWord = (bytes[i] << 8) + bytes[i + 1];
    if (0xD800 <= firstWord && firstWord <= 0xDBFF) {
      int secondWord = (bytes[i + 2] << 8) + bytes[i + 3];
      buffer.writeCharCode(
          ((firstWord - 0xD800) << 10) + (secondWord - 0xDC00) + 0x10000);
      i += 4;
    } else {
      buffer.writeCharCode(firstWord);
      i += 2;
    }
  }
  return buffer.toString();
}
