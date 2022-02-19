import 'dart:convert';
import 'geo_reverse_model.dart';
import 'package:http/http.dart' as http;

class ApiServiceNeshan {
  Future<GeoReverseModelResponse> geoReverse(
      GeoReverseModelRequest _request) async {
    String url =
        "https://api.neshan.org/v4/reverse?lat=${_request.lat}&lng=${_request.lng}";
    String apiKey = 'service.Mymgc56op6EwwhDw5JZGBwBrZ7BFoYo9Mkg6iGWd';
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Charset': 'utf-8',
      'Accept': '*/*',
      'Api-Key': apiKey,
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      return GeoReverseModelResponse.fromJson(jsonDecode(response.body));
    } else {
      return Future.error(jsonDecode(response.body)['message']);
    }
  }

  Future<GeoReverseModelResponse> geoReverseMain(
      GeoReverseModelRequest _request) async {
    String url =
        "https://api.neshan.org/v4/reverse?lat=${_request.lat}&lng=${_request.lng}";
    String apiKey = 'service.Mymgc56op6EwwhDw5JZGBwBrZ7BFoYo9Mkg6iGWd';
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Charset': 'utf-8',
      'Accept': '*/*',
      'Api-Key': apiKey,
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      return GeoReverseModelResponse.fromJson(
          jsonDecode(response.body)['data']);
    } else {
      return Future.error(jsonDecode(response.body)['message']);
    }
  }
}
