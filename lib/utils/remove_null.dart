Map<String, dynamic> removeNullValues(Map<String, dynamic> json) {
  // Create a new map to hold the cleaned JSON object
  final Map<String, dynamic> cleanedJson = {};

  // Iterate over each key-value pair in the original JSON object
  json.forEach((key, value) {
    if (value != null) {
      if (value is Map<String, dynamic>) {
        // If the value is a nested JSON object, recursively clean it
        cleanedJson[key] = removeNullValues(value);
      } else if (value is List) {
        // If the value is a list, clean each item in the list
        cleanedJson[key] = value.map((item) {
          if (item is Map<String, dynamic>) {
            return removeNullValues(item);
          }
          return item;
        }).toList();
      } else {
        // If the value is not null, add it to the cleaned JSON object
        cleanedJson[key] = value;
      }
    }
  });

  return cleanedJson;
}

Map<String, dynamic> filterNullValues(Map<String, dynamic> data) {
  Map<String, dynamic> filteredData = {};

  data.forEach((key, value) {
    if (value != null) {
      filteredData[key] = value;
    }
  });

  return filteredData;
}