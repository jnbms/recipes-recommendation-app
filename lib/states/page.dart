import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const API_KEY = '85f53462b2284d0589f5';

class PageModel extends ChangeNotifier {
  PageModel(this.count);

  int count = 30;
  Map recipeObejct = {};

  void setPage(int value) {
    count = value;
    notifyListeners();
  }

  void increase(int value) {
    count += value;
    notifyListeners();
  }

  void getDetail(String recipeName) async {
    final response = await http.get(Uri.http('openapi.foodsafetykorea.go.kr',
        '/api/$API_KEY/COOKRCP01/json/1/$count'));
    // print(jsonDecode(response.body)['COOKRCP01']['row'][0]);
    dynamic results = jsonDecode(response.body)['COOKRCP01']['row'];
    for (dynamic result in results) {
      if (result["RCP_NM"] == recipeName) {
        recipeObejct = result;
        // print(recipeObejct);
        break;
      }
    }
  }
}
