import 'package:dio/dio.dart';
import 'package:maliya/global/httpclient.dart';
import 'package:maliya/locator.dart';
import 'dart:convert';

import 'package:maliya/models/malis_model.dart';

Future<List<MalisModel>> getAttributeList() async {
  final httpClient = locator<HttpClient>();
  final response = await httpClient.client().get('/attribute/list');
  print("1234");
  List<MalisModel> list = [];
  for (var item in response.data) {
    MalisModel malisModel = MalisModel.fromJson(item);
    list.add(malisModel);
  }
  print("2345");
  print(response.data.map((model) => model));
  print("3456");
  print((response.data as List).map((item) => MalisModel.fromJson(item)));
  print("4567");
  print(List<MalisModel>.from(
      (response.data as List).map((item) => MalisModel.fromJson(item))));

  return list;
}
