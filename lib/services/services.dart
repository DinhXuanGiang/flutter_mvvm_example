import 'dart:convert';

import 'package:flutter_mvvm_example/model/picsum_model.dart';
import 'package:http/http.dart' as http;
class Service {
  Future<List<PicSumModel>> fetchPicturesAPI() async {
    String urlEnpoint = 'https://picsum.photos/v2/list';
    final response = await http.get(Uri.parse(urlEnpoint));
    if(response.statusCode == 200) {
      final json = jsonDecode(response.body) as List<dynamic>;
      final listResult = json.map((e) => PicSumModel.fromJson(e)).toList();
      return listResult;
    } else {
      throw Exception("Error fetching pictures!");
    }
  }
}