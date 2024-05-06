const dbEmoji = {'🍔': 'burger', '🍟': 'fries', '🍕': 'pizza'};

encodeString(String exStr) {
  var newStr = '';
  for (int i = 0; i < exStr.length; i++) {
    var tempStr = '';
    int codeUnit = exStr.codeUnitAt(i);
    // Get the Unicode code point of the character at index i
    if (codeUnit >= 0xD800 && codeUnit <= 0xDBFF) {
      // This is the first part of a surrogate pair (high surrogate)
      int nextCodeUnit = exStr.codeUnitAt(i + 1);
      if (nextCodeUnit >= 0xDC00 && nextCodeUnit <= 0xDFFF) {
        // This is the second part of a surrogate pair (low surrogate)
        // Combine the surrogate pair to get the full Unicode code point
        int unicodeCodePoint =
            (codeUnit - 0xD800) * 0x400 + (nextCodeUnit - 0xDC00) + 0x10000;

        // Print the emoji and its Unicode code point in hexadecimal
        String emoji = String.fromCharCode(unicodeCodePoint);
        if (dbEmoji.containsKey(emoji)) {
          tempStr = dbEmoji[emoji]!;
        }

        // Skip the next character (low surrogate) in the iteration
        i++;
      }
    } else {
      // Regular character (including emojis outside the supplementary planes)
      String unicodeHex = codeUnit.toRadixString(16).toUpperCase();
      tempStr = exStr[i];
    }

    newStr += tempStr;
  }
  return newStr;
}

void main() {
  var exampleString = 'what are we going to eat for dinner? of course 🍕!';

  var convertedString = encodeString(exampleString);
  print(convertedString);
}
