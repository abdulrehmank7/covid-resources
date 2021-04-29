import 'dart:convert';

import 'package:covid_resources/data/model/cities.dart';
import 'package:covid_resources/data/model/resource.dart';
import 'package:http/http.dart' as http;

Future<Resource> getResource(String state, String city) async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse('https://tisanatech.com/api/resource'));
  request.body = '''{\n    "page": 1,\n    "size": 1000,\n    "state": "$state",\n    "city": "$city"\n}''';
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

Future<Cities> getCities(String state) async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse('https://tisanatech.com/api/place/cities'));
  request.body = '''{\n    "state": "$state"\n}''';
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final data = await response.stream.bytesToString();
    print(data);
    Cities cities = Cities.fromJson(jsonDecode(data));
    return cities;
  } else {
    print(response.reasonPhrase);
    return null;
  }
}
