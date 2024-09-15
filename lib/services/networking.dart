import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String uResource;

  NetworkHelper(this.uResource);

  Future getData() async {
    Uri url = Uri.parse(uResource);

    http.Response response = await http.get(url);
    // print(response.statusCode);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      return response.statusCode;
    }
  }
}
