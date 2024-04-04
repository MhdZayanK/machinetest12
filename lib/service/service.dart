import 'dart:convert';


import 'package:exoro_interview/model/datamodel.dart';
import 'package:http/http.dart' as http;

class DataService {
  var url = "https://api.quotable.io/authors/slug/{slug}";

  Future<List<DataModel>?> getService() async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // Parse the JSON response
        List<dynamic> jsonResponse = jsonDecode(response.body);
        // Map the JSON data to DataModel objects
        List<DataModel> data = jsonResponse.map((json) => DataModel.fromJson(json)).toList();
        return data;
      } else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      // Catch any exceptions that occur during the process
      print('Error: $e');
      return null;
    }
  }
}
