import 'package:currencywithstrapi/routes/my_routes.dart';
import 'package:currencywithstrapi/service/get_storage/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyRoutes.instance.onGenerateRoute,
      initialRoute: GetStorageService.instance.box.read("token") != null
          ? JwtDecoder.isExpired(GetStorageService.instance.box.read("token"))
              ? "/login"
              : "/home"
          : "/login",
    );
  }
}
