import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maliya/services/user/login.dart';
import 'package:tuple/tuple.dart';

final userLoginProvider = FutureProvider.autoDispose
    .family<Response<dynamic>, Tuple2<String, String>>((ref, tuple2) {
  return Future.delayed(Duration(seconds: 20), () {
    return login(tuple2.item1, tuple2.item2);
  });
});

final queryUserByIdProvider =
    FutureProvider.autoDispose.family<Response<dynamic>, int>((ref, id) {
  return queryUserById(id);
});
