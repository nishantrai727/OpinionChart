import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:opinionchart/constants/appConstant.dart';

class ApiService {
  Future<Map<String, dynamic>> postData(
      dynamic body, String url_extension) async {
    var url = Uri.parse(AppConstant.APP_URL);

    var header = {
      "content-type": "application/json",
      "x-api-key": "${AppConstant.API_KEY}",
    };

    try {
      var jsonBody = json.encode(body);

      var response = await http.post(
        url,
        body: jsonBody,
        headers: header,
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(utf8.decode(response.bodyBytes))
            as Map<String, dynamic>;
        // print(jsonResponse);
        return jsonResponse;
      } else if (response.statusCode == 401) {
        var jsonResponse = json.decode(utf8.decode(response.bodyBytes))
            as Map<String, dynamic>;
        // print(jsonResponse);
        return jsonResponse;
      } else {
        // print('Request failed with status: ${response.statusCode}.');
        return json.decode(utf8.decode(response.bodyBytes))
            as Map<String, dynamic>;
      }
    } catch (error) {
      // print(error);
      throw (error);
    }
  }
}
