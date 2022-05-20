import 'package:currencywithstrapi/model/currency_model.dart';

class GetDollar {
  static final GetDollar _instance = GetDollar._init();
  static GetDollar get instance => _instance;
  GetDollar._init();
  String? price;
  getDollar(List<Datum> lst) {
    for (var i = 0; i < lst.length; i++) {
      if (lst[i].attributes!.code == "USD") {
        price = lst[i].attributes!.price;
      }
    }
    print(price);
    return price;
  }
}
