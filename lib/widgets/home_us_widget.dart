import 'package:currencywithstrapi/model/currency_model.dart';
import 'package:currencywithstrapi/screens/auth/login/login_view.dart';
import 'package:currencywithstrapi/service/get_dollar.dart';
import 'package:currencywithstrapi/service/get_storage/storage_service.dart';
import 'package:flutter/material.dart';

class HomeUsWidget extends StatelessWidget {
  List<Datum> data2;
  HomeUsWidget({Key? key, required this.data2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("US DOLLAR",
                  style: TextStyle(color: Colors.white.withOpacity(0.6))),
              IconButton(
            onPressed: () async {
              await GetStorageService.instance.box.remove("token");
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => LoginView()),
                  (route) => false);
            },
            icon: Icon(Icons.logout, color: Colors.white,),
          ),
            ],
          ),
          const SizedBox(height: 20),
          Text("\$" + GetDollar.instance.getDollar(data2).toString(),
              style: const TextStyle(color: Colors.white, fontSize: 30)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/calculation");
                      },
                      child: myContainer(
                          "Caculation", Colors.white, Colors.black, context),
                    ),
                    myContainer("Buy", Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.5), context),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget myContainer(
      String text, Color color1, Color color2, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration:
          BoxDecoration(color: color1, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: color2, fontSize: 20),
        ),
      ),
    );
  }
}
