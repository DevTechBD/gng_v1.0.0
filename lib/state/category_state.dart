import 'package:flutter/material.dart';
import 'package:gngappv1/models/cat_model.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CategoryState with ChangeNotifier{
  LocalStorage storage = new LocalStorage('usertoken');

  List<CategoryModel> _categories = [];

  Future<bool> getCategories() async {
    String url = "https://gngbd.com/api/categories";
    var token = storage.getItem('token');
    try {
      http.Response response =
      await http.get(url, headers: {'Authorization': "token $token"});
      var data = json.decode(response.body) as List;
      // print(data);
      List<CategoryModel> temp = [];
      data.forEach((element) {
        CategoryModel product = CategoryModel.fromJson(element);
        temp.add(product);
      });
      _categories = temp;
      notifyListeners();
      return true;
    } catch(e) {
      print(e);
      return false;
    }
  }

  List<CategoryModel> get categories {
    return [..._categories];
  }
}