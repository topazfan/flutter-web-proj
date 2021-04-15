import 'package:dio/dio.dart';
import 'package:maliya/global/httpclient.dart';
import 'package:maliya/locator.dart';

Future<Response> login(String name, String password) async {
  var data = {"username": name, "password": password};
  final httpClient = locator<HttpClient>();
  final response = await httpClient.client().post('/auth/token', data: data);
  return response;
}

Future<Response> sign(String param) async {
  final httpClient = locator<HttpClient>();
  final response = await httpClient.client().get('/attribute/list');
  return response;
}

Future<Response> queryUserById(int id) async {
  final httpClient = locator<HttpClient>();
  final response =
      await httpClient.client().get('/user/id', queryParameters: {"id": id});
  return response;
}

Future<Response> logout() async {
  final httpClient = locator<HttpClient>();
  final response = await httpClient.client().delete('/auth/delete');
  return response;
}
