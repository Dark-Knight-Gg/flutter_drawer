extension StringExt on String? {
  bool get isNull => this == null;

  bool get isEmpty => this == '';

  bool get isBlank => this?.trim() == '';

  bool get isNotBlank => this?.trim() != '';

  bool get isNullOrEmpty => isNull || isEmpty;

  bool get isNullOrBlank => isNull || isBlank;

  bool get isUsername => hasMatch(r'^[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]$');

  bool get isCurrency => hasMatch(
      r'^(S?\$|\₩|Rp|\¥|\€|\₹|\₽|fr|R\$|R)?[ ]?[-]?([0-9]{1,3}[,.]([0-9]{3}[,.])*[0-9]{3}|[0-9]+)([,.][0-9]{1,2})?( ?(USD?|AUD|NZD|CAD|CHF|GBP|CNY|EUR|JPY|IDR|MXN|NOK|KRW|TRY|INR|RUB|BRL|ZAR|SGD|MYR))?$');

  bool get isPhoneNumber {
    var lengthNotNull = this?.length ?? 0;
    if (lengthNotNull > 16 || lengthNotNull < 9) return false;
    return hasMatch(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }

  bool get isEmail => hasMatch(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  String removeAllWhiteSpace() =>
      isNullOrBlank ? '' : this!.replaceAll(RegExp(r"\s+\b|\b\s"), "");

  int toInt({int defaultValue = 0}) {
    return int.tryParse(this ?? defaultValue.toString()) ?? defaultValue;
  }

  int? toIntOrNull() {
    return this == null ? null : int.tryParse(this!);
  }

  double toDouble({double defaultValue = 0}) {
    return double.tryParse(this ?? defaultValue.toString()) ?? defaultValue;
  }

  double? toDoubleOrNull() {
    return this == null ? null : double.tryParse(this!);
  }

  bool toBool({bool defaultValue = false}) {
    return bool.fromEnvironment(
      this ?? defaultValue.toString(),
      defaultValue: defaultValue,
    );
  }

  bool? toBoolOrNull() {
    return this == null ? null : bool.fromEnvironment(this!);
  }

  bool hasMatch(String pattern) {
    return (this == null) ? false : RegExp(pattern).hasMatch(this ?? '');
  }

  bool isHtmlFile(String filePath) {
    return filePath.toLowerCase().endsWith(".html");
  }

  bool isVideo(String filePath) {
    var ext = filePath.toLowerCase();
    return ext.endsWith(".mp4") ||
        ext.endsWith(".avi") ||
        ext.endsWith(".wmv") ||
        ext.endsWith(".rmvb") ||
        ext.endsWith(".mpg") ||
        ext.endsWith(".mpeg") ||
        ext.endsWith(".3gp");
  }

  bool isAudio(String filePath) {
    final ext = filePath.toLowerCase();
    return ext.endsWith(".mp3") ||
        ext.endsWith(".wav") ||
        ext.endsWith(".wma") ||
        ext.endsWith(".amr") ||
        ext.endsWith(".ogg");
  }

  bool isImage(String filePath) {
    final ext = filePath.toLowerCase();
    return ext.endsWith(".jpg") ||
        ext.endsWith(".jpeg") ||
        ext.endsWith(".png") ||
        ext.endsWith(".gif") ||
        ext.endsWith(".bmp");
  }

  bool get isNumericOnly => hasMatch(r'^\d+$');

  bool get isAlphabetOnly => hasMatch(r'^[a-zA-Z]+$');

  bool get isBool {
    if (isNull) {
      return false;
    }
    return (this == 'true' || this == 'false');
  }

  bool get hasCapitalLetter => hasMatch(r'[A-Z]');

  bool equalsIgnoreCase(String? other) =>
      (this == null && other == null) ||
      (this != null &&
          other != null &&
          this!.toLowerCase() == other.toLowerCase());

  String? removeSurrounding(String delimiter) {
    if (this == null) return null;
    final prefix = delimiter;
    final suffix = delimiter;

    if ((this!.length >= prefix.length + suffix.length) &&
        this!.startsWith(prefix) &&
        this!.endsWith(suffix)) {
      return this!.substring(prefix.length, this!.length - suffix.length);
    }
    return this;
  }

  String? ifEmpty(Function action) => this?.isEmpty == true ? action() : this;

  String? limitFromEnd(int maxSize) => (this?.length ?? 0) < maxSize
      ? this
      : this!.substring(this!.length - maxSize);

  String? limitFromStart(int maxSize) =>
      (this?.length ?? 0) < maxSize ? this : this!.substring(0, maxSize);
}
