import 'dart:convert';
import 'package:tugasapi/model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _baseUrl = 'https://658a8543ba789a9622373b4c.mockapi.io/Blog';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Blog> blog = it.map((e) => Blog.fromJson(e)).toList();
        return blog;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postData(String nama, String kota) async {
    try {
      final response = await http.post(Uri.parse(_baseUrl),
          body: {"nama": nama, "kota": kota});

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future putData(int? id, String? nama, String? kota) async {
    try {
      final response = await http.put(
          Uri.parse(
            _baseUrl + '/' + id.toString(),
          ),
          body: {'nama': nama, 'kota': kota});

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteData(String id) async {
    try {
      final response = await http.delete(
        Uri.parse(
          _baseUrl + '/' + id,
        ),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}