import 'package:currencywithstrapi/screens/home/view/home_view.dart';
import 'package:currencywithstrapi/service/get_storage/storage_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
            ),
            TextFormField(
              controller: _textEditingController2,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  Response res = await Dio().post(
                    "http://localhost:1337/api/auth/local",
                    data: {
                      "identifier": "user1@strapi.io",
                      "password": "112233"
                    },
                  );
                  if (res.statusCode == 200) {
                    await GetStorageService.instance.box.write(
                      "token",
                      res.data['jwt'],
                    );
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => HomeView()),
                        (route) => false);
                  } else {
                    debugPrint("ERROR WHILE LOGIN !");
                  }
                } catch (e) {
                  debugPrint("ERROR WHILE LOGIN !");
                }
              },
              child: Text("Sign In"),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  Response res = await Dio().post(
                    "http://localhost:1337/api/auth/local/register",
                    data: {
                      "username": "Example User 1",
                      "email": "user2@strapi.io",
                      "password": "112233"
                    },
                  );
                  if (res.statusCode == 200) {
                    await GetStorageService.instance.box.write(
                      "token",
                      res.data['jwt'],
                    );
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => HomeView()),
                        (route) => false);
                  } else {
                    debugPrint("ERROR WHILE REGISTERING !");
                  }
                } catch (e) {
                  debugPrint("ERROR WHILE REGISTERING !");
                }
              },
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: const Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
