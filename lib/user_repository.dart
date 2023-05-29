import 'dart:convert';

import 'package:flutterunittesting/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final http.Client client;
  UserRepository(this.client);
  Future<UserModel> getUser() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
}
