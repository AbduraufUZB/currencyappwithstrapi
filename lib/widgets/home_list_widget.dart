import 'package:currencywithstrapi/model/currency_model.dart';
import 'package:flutter/material.dart';

class HomeListWidget extends StatelessWidget {
  List<Datum> data2;
  HomeListWidget({Key? key, required this.data2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("My Portfolios",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.522,
              width: double.infinity,
              child: ListView.builder(
                itemCount: data2.length,
                itemBuilder: (ctx, i) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(20)),
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: double.infinity,
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://source.unsplash.com/random/$i"),
                            radius: 30,
                          ),
                          const SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data2[i].attributes!.code.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "1 ${data2[i].attributes!.code.toString()}",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                            ],
                          ),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  "${data2[i].attributes!.price} so'm",
                                  style: const TextStyle(
                                      color: Colors.green, fontSize: 17),
                                ),
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
