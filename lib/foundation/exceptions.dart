class HttpResponceException implements Exception {
  HttpResponceException(this.code);
  final int code;

  @override
  String toString() {
    // 400~
    if (code == 400) return '$code Bad Request';
    if (code == 401) return '$code Unauthorized';
    if (code == 403) return '$code Forbidden';
    if (code == 404) return '$code Not Found';
    // 500~
    if (code == 500) return '$code Internal Server Error';
    if (code == 501) return '$code Not Implemented';
    if (code == 502) return '$code Bad Gateway';
    if (code == 503) return '$code Service Unavailable';
    if (code == 504) return '$code Gateway Timeout';
    // それ以外のエラーコードの場合は汎用メッセージを表示するが、
    // ここではなくUI側で多言語対応するために空文字を返すに留める
    return '';
  }
}
