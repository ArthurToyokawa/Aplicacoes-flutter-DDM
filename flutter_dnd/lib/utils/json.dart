Map<String, dynamic> jsonStringToMap(String jsonString) {
  Map<String, dynamic> resultMap = {};
  
  // Remove curly braces from the string
  String cleanedString = jsonString.replaceAll('{', '').replaceAll('}', '');
  
  // Split the string into key-value pairs
  List<String> keyValuePairs = cleanedString.split(',');

  // Process each key-value pair
  for (String pair in keyValuePairs) {
    List<String> keyValue = pair.split(':');
    if (keyValue.length == 2) {
      // Extract the key and value
      String key = keyValue[0].trim();
      String value = keyValue[1].trim();

      // Add the key-value pair to the result map
      resultMap[key] = value;
    }
  }
  return resultMap;
}

int? jsonCheckStringInt(Object? json) {
  if(json == null) {
    return null;
  }
  if (json is int) {
    return json;
  }
  if(json is String) {
    return int.tryParse(json);
  }
}
