import 'package:flutter/services.dart';

class InputFormatter {
  final emojiRegex =
      '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])';

  FilteringTextInputFormatter textFieldFormatter = FilteringTextInputFormatter.deny(RegExp("emojiRegex"));
}
