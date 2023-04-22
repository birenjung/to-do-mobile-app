import 'package:http/http.dart' as http;

import 'models/todo.dart'; 
class ApiService{
  // Url of the API
  static const String BASE_URL = "https://640441b280d9c5c7bac3ff04.mockapi.io/crud";

  // Get all posts
  static Future<List<Todo>> getTodos() async {
    try {
      final response = await http.get(Uri.parse(BASE_URL));
      if (response.statusCode == 200) {
        List<Todo> list = postFromJson(response.body);
        return list;
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }  
}