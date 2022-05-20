import 'package:bloc/bloc.dart';
import 'package:currencywithstrapi/model/currency_model.dart';
import 'package:currencywithstrapi/screens/home/state/home_state.dart';
import 'package:dio/dio.dart';

import '../../../service/get_storage/storage_service.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInital());

  Future getDataFromApi() async {
    try {
      emit(HomeLoading());
      Response res = await Dio().get(
        "http://192.168.43.54:1337/api/currencies",
        options: Options(
          headers: {
            "Authorization":
                "Bearer ${GetStorageService.instance.box.read("token")}",
          },
        ),
      );
      if (res.statusCode == 200) {
        emit(HomeComplete(
            datam: (res.data["data"] as List)
                .map((e) => Datum.fromJson(e))
                .toList()));
      } else {
        emit(HomeError(msg: "Currencies site is not respond !"));
      }
    } catch (e) {
      emit(HomeError(msg: "Catch: Error with your internet"));
    }
  }
}
