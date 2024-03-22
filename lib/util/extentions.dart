extension myStringUtils on String? {
  String? extractValueFromQuery(String key) {
    int queryStartIndex = this!.indexOf('?');
    if (queryStartIndex == -1) return null;

    String query = this!.substring(queryStartIndex + 1);

    List<String> pairs = query.split('&');

    for (String pair in pairs) {
      List<String> keyValue = pair.split('=');
      if (keyValue.length == 2) {
        String currenyKey = keyValue[0];
        String value = keyValue[1];

        if (currenyKey == key) {
          return Uri.decodeComponent(value);
        }
      }
    }
  }
}
