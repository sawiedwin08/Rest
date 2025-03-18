import 'dart:convert';
import 'package:app_flutter_rest/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:app_flutter_rest/config/constants.dart';

class ApiService {
  Future<List<User>> getUser() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConstants.baseUrl}${AppConstants.usersEndpoint}'),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load fruits: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching fruits: $e');
    }
  }

  Future<User> getUserById(int id) async {
    try {
      final response = await http.get(
        Uri.parse('${AppConstants.baseUrl}${AppConstants.usersEndpoint}/$id'),
      );

      if (response.statusCode == 200) {
        return User.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load fruit: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching fruit: $e');
    }
  }
}
