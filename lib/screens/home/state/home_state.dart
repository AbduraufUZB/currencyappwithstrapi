import 'package:currencywithstrapi/model/currency_model.dart';

abstract class HomeState {
  HomeState();
}

class HomeInital extends HomeState {
  HomeInital();
}

class HomeLoading extends HomeState {
  HomeLoading();
}

class HomeComplete extends HomeState {
  List<Datum> datam;
  HomeComplete({required this.datam});
}

class HomeError extends HomeState {
  String msg;
  HomeError({required this.msg});
}
