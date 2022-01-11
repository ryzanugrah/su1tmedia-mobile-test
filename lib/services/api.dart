import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:suitmedia_mobile/models/user_model.dart';

class Api {
  Future<UserModel> fetchData(int data) async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?per_page=$data'));

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error while fetching data');
    }
  }
}
