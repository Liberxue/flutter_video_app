import 'dart:math';

const UNIX_NEWLINE = '\n';
const WINDOWS_NEWLINE = '\r\n';
const CARRIAGE_RETURN = '\r';

///String Processor - that's the theory.
class WordCount {
  ///Trim the supplied [String].
  String trimText(String src) {
    return src.trim();
  }

  ///Returns a [String] with each line trimmed.
  String trimLines(String text) {
    var segments = getSegments(text);
    var out = '';

    for (int i = 0; i < segments.length; i++) {
      out += segments[i].trim();
      if (i < (segments.length - 1)) {
        out += UNIX_NEWLINE;
      }
    }
    return out;
  }

  ///Calculate the Word Count for the [String].
  int getWordCount(String text) {
    var workingText = text;
    workingText = workingText
      ..replaceAll(UNIX_NEWLINE, ' ')
      ..replaceAll('.', ' ')
      ..replaceAll(',', ' ')
      ..replaceAll(':', ' ')
      ..replaceAll(';', ' ')
      ..replaceAll('?', ' ');
    var words = workingText.split(' ');
    words.removeWhere((word) => word.length == 0 || word == " ");
    return min(words.length, text.length);
  }

  ///Count the number of lines in the [String] text.
  int getLineCount(String text) {
    return UNIX_NEWLINE.allMatches(text).length;
  }

  ///Count the number of sentences in the [String] text.
  int getSentenceCount(String text) {
    var processedText =
        text.replaceAll('!', '.').replaceAll('?', '.').replaceAll('...', '.');
    var sentences = denumber(processedText).split('.');
    var sentenceCount = 0;
    for (int i = 0; i < sentences.length; i++) {
      if (sentences[i].trim().length > 1) sentenceCount++;
    }
    return sentenceCount;
  }

  ///Return [String] of supplied text repeated count times.
  String generateRepeatedString(String textToRepeat, num count,
      [bool newLine = false]) {
    count ??= 1;

    return newLine
        ? (textToRepeat + UNIX_NEWLINE) * count.toInt()
        : textToRepeat * count.toInt();
  }

  ///Returns a [String] made from content with all occurances of target
  ///replaced by replacement.
  String getReplaced(String content, String target, String replacement) {
    return content.replaceAll(target, replacement);
  }

  ///Returns a [String] alphabetically sorted.
  ///If multiline then split is by line.
  ///If single line then split is by space character.
  String sort(String text) {
    var delimiter = ' ';
    if (text.contains(UNIX_NEWLINE)) {
      delimiter = UNIX_NEWLINE;
    }

    return sortDelimiter(text, delimiter);
  }

  ///Returns a [String] sorted after being split by the supplied delimiter.
  String sortDelimiter(String text, String delimiter) {
    var segments = text.split(delimiter);
    var out = '';
    segments
      ..sort()
      ..forEach((line) => out += line + delimiter);
    return trimText(out);
  }

  ///Returns a [String] of the reverse of the supplied string.
  String reverse(String text) {
    var delimiter = text.contains(UNIX_NEWLINE) ? UNIX_NEWLINE : ' ';
    return reverseDelimiter(text, delimiter);
  }

  ///Returns a [String] reversed after being split by the supplied delimiter.
  String reverseDelimiter(String text, String delimiter) {
    var segments = text.split(delimiter);
    var out = '';

    segments.reversed.forEach((line) => out += line + delimiter);
    return trimText(out);
  }

  ///Returns a [String] with each line having a prefix added.
  String prefixLines(String text, String prefix) {
    var segments = getSegments(text);
    var out = '';
    for (int i = 0; i < segments.length; i++) {
      out += prefix + segments[i];
      if (i < (segments.length - 1)) {
        out += UNIX_NEWLINE;
      }
    }
    return out;
  }

  ///Returns a [String] with each line having a postfix added.
  String postfixLines(String text, String postfix) {
    var segments = getSegments(text);
    var out = '';

    for (int i = 0; i < segments.length; i++) {
      out += segments[i] + postfix;
      if (i < (segments.length - 1)) {
        out += UNIX_NEWLINE;
      }
    }
    return out;
  }

  ///Returns a [String] with each line duplicated.
  String dupeLines(String text) {
    var segments = getSegments(text);
    var out = '';

    for (int i = 0; i < segments.length; i++) {
      out += segments[i] * 2;
      if (i < (segments.length - 1)) {
        out += UNIX_NEWLINE;
      }
    }
    return out;
  }

  ///Returns a [String] with content with spaces instead of tabs.
  String convertTabsToSpace(String text, {int numberOfSpaces = 4}) {
    var spaces = ' ' * numberOfSpaces;
    return text.replaceAll('\t', spaces);
  }

  ///Returns a [String] with all content on a single line.
  String makeOneLine(String text) {
    return text.replaceAll(WINDOWS_NEWLINE, '').replaceAll(UNIX_NEWLINE, '');
  }

  ///Returns a [String] with blank lines removed.
  String removeBlankLines(String text) {
    var segments = getSegments(text);
    var out = '';

    for (int i = 0; i < segments.length; i++) {
      if (segments[i].length > 0) {
        out += segments[i];
        if (i < (segments.length - 1) && text.indexOf(UNIX_NEWLINE) > -1) {
          out += UNIX_NEWLINE;
        }
      }
    }

    return out;
  }

  ///Returns a [String] with double blank lines reduced to single blank lines.
  String removeExtraBlankLines(String text) {
    while (text.indexOf('\n\n\n') > -1) {
      text = text.replaceAll('\n\n\n', '\n\n');
    }

    return text;
  }

  ///Returns a [String] with lines double spaced.
  String doubleSpaceLines(String text) {
    return text.replaceAll(UNIX_NEWLINE, '\n\n');
  }

  ///Returns a [String] with lines in a random order.
  String randomiseLines(String text) {
    var segments = getSegments(text);
    segments.shuffle();
    var out = '';

    for (int i = 0; i < segments.length; i++) {
      if (segments[i].length > 0) out += segments[i];
      if (i < (segments.length - 1)) {
        out += UNIX_NEWLINE;
      }
    }
    return out;
  }

  ///Returns a [String] of a sequence of numbers each on a new line.
  String generateSequenceString(
      num startIndex, num repeatCount, num increment) {
    var out = '';
    var current = startIndex;
    for (int i = 0; i < repeatCount; i++) {
      out += current.round().toString() + UNIX_NEWLINE;
      current += increment;
    }
    return out;
  }

  ///Returns a [String] with the input lines containing a [target] string removed.
  deleteLinesContaining(String text, String target) {
    var segments = getSegments(text);
    var out = '';

    for (int i = 0; i < segments.length; i++) {
      if (segments[i].length != 0 &&
          segments[i] != CARRIAGE_RETURN &&
          segments[i].indexOf(target) == -1) {
        out += segments[i];
        if (i < (segments.length - 1) && text.indexOf(UNIX_NEWLINE) > -1) {
          out += UNIX_NEWLINE;
        }
      } else if (segments[i].length == 0 || segments[i] != CARRIAGE_RETURN) {
        out += WINDOWS_NEWLINE;
      }
    }

    return out;
  }

  ///URI Encode a string.
  String uriEncode(String text) {
    return Uri.encodeFull(text);
  }

  ///URI Decode a string.
  String uriDecode(String text) {
    return Uri.decodeFull(text);
  }

  ///Return a [String] of the input text with each item (defined by the
  ///delimiter on new line).
  String split(String text, String delimiter) {
    var out = '';
    if (text.indexOf(delimiter) == -1) return text;

    text
        .split(delimiter)
        .forEach((String item) => out += "$item$WINDOWS_NEWLINE");

    return out;
  }

  ///Returns a [String] with the input lines containing a [target] string removed.
  String deleteLinesNotContaining(String text, String target) {
    var segments = getSegments(text);
    var out = '';

    for (int i = 0; i < segments.length; i++) {
      if (segments[i].length != 0 &&
          segments[i] != CARRIAGE_RETURN &&
          segments[i].indexOf(target) > -1) {
        out += segments[i];
        if (i < (segments.length - 1) && text.indexOf(UNIX_NEWLINE) > -1) {
          out += UNIX_NEWLINE;
        }
      } else if (segments[i].length == 0 || segments[i] != "\r") {
        out += WINDOWS_NEWLINE;
      }
    }

    return out;
  }

  ///Returns a [String] with the input lines with content numbered.
  String addNumbering(String text) {
    if (text.length == 0) {
      return '';
    }
    var segments = getSegments(text);
    var out = '';
    var numberingIndex = 1;
    for (var i = 0; i < segments.length; i++) {
      if (segments[i].length > 0) {
        out += '$numberingIndex. ' + segments[i] + UNIX_NEWLINE;
        numberingIndex++;
      } else if (i + 1 != segments.length) {
        out += segments[i] + UNIX_NEWLINE;
      }
    }

    return out;
  }

  ///Break [String] into segements by line separator.
  List<String> getSegments(String text) {
    return text.split(UNIX_NEWLINE);
  }

  ///Returns a [String] with [leftTrim] characters removed for the left
  ///and [rightTrim] for the right.
  String splice(String text, int leftTrim, [int rightTrim = 0]) {
    var out = '';
    var segments = getSegments(text);

    for (int i = 0; i < segments.length; i++) {
      var line = segments[i];
      var currentLength = line.length;
      if (currentLength <= leftTrim || (line.length - rightTrim) < 1) {
        out += UNIX_NEWLINE;
      } else if (rightTrim > 0) {
        if ((line.length - rightTrim) >= leftTrim)
          out += line.substring(leftTrim, line.length - rightTrim);
        else
          out += UNIX_NEWLINE;
      } else {
        out += line.substring(leftTrim);
      }
      if (text.indexOf(UNIX_NEWLINE) > -1) {
        out += UNIX_NEWLINE;
      }
    }
    return out;
  }

  ///Returns a [String] with the input multiple spaces all reduced to 1 space.
  String trimAllSpaces(String text) {
    var out = '';
    var segments = getSegments(text);

    for (int i = 0; i < segments.length; i++) {
      var line = '';
      var innerSegments = segments[i].split(' ');
      for (int j = 0; j < innerSegments.length; j++) {
        if (innerSegments[j].trim().length > 0) {
          line += innerSegments[j].trim() + ' ';
        }
      }
      out += line.trim();

      if (i < (segments.length - 1)) {
        out += UNIX_NEWLINE;
      }
    }

    return out;
  }

  ///Returns a [String] with the input lines sorted by length (ascending).
  String sortByLength(String text) {
    var out = '';
    var segments = getSegments(text);
    segments.sort((a, b) => a.length.compareTo(b.length));
    for (var i = 0; i < segments.length; i++) {
      out += segments[i] + UNIX_NEWLINE;
    }
    return out;
  }

  ///Returns a [String] with input having 0123456789 removed.
  String denumber(String text) {
    for (var i = 0; i < 10; i++) text = text.replaceAll('$i', '');
    return text;
  }

  ///Returns a [String] with the line that incorporates the index at position
  ///duplicated.
  String duplicateLine(String text, int position) {
    if (position >= text.length) {
      position = text.length - 1;
    }
    if (text.lastIndexOf(UNIX_NEWLINE) == -1 ||
        text[text.length - 1] != UNIX_NEWLINE) {
      text = text + UNIX_NEWLINE;
    }
    var start = max(text.lastIndexOf(UNIX_NEWLINE, position), 0);
    var end = text.indexOf(UNIX_NEWLINE, position);

    if (start == end && position > 0) {
      start = max(text.lastIndexOf(UNIX_NEWLINE, position - 1), 0);
    }

    if (start + 1 < end) {
      var dupe = text.substring(start == 0 ? 0 : start + 1, end);
      text = text.substring(0, start) +
          (start == 0 ? '' : UNIX_NEWLINE) +
          dupe +
          UNIX_NEWLINE +
          dupe +
          text.substring(end);
    }
    return text;
  }
}
