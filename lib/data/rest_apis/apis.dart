import 'dart:convert';

import 'package:covid_resources/data/model/resource.dart';
import 'package:http/http.dart' as http;

Future<Resource> getResource() async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse('https://tisanatech.com/api/resource'));
  request.body = '''{\n    "page": 1,\n    "size": 1000\n}''';
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final data = await response.stream.bytesToString();
    print(data);
    Resource resource = Resource.fromJson(jsonDecode(data));
    return resource;
  } else {
    print(response.reasonPhrase);
    return null;
  }
}
