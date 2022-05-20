import 'package:currencywithstrapi/model/currency_model.dart';
import 'package:currencywithstrapi/screens/auth/login/login_view.dart';
import 'package:currencywithstrapi/screens/home/cubit/home_cubit.dart';
import 'package:currencywithstrapi/screens/home/state/home_state.dart';
import 'package:currencywithstrapi/service/get_storage/storage_service.dart';
import 'package:currencywithstrapi/widgets/home_list_widget.dart';
import 'package:currencywithstrapi/widgets/home_us_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var cubit = HomeCubit();
        cubit.getDataFromApi();
        return cubit;
      },
      child: myScaffold(context),
    );
  }

  Widget myScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeError) {
            return Center(
                child: Text(
              state.msg,
              style: const TextStyle(color: Colors.white),
            ));
          } else if (state is HomeLoading) {
            return const Center(
                child: Center(child: CircularProgressIndicator.adaptive()));
          } else if (state is HomeComplete) {
            List<Datum> data2 = state.datam;
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 4, child: HomeUsWidget(data2: data2)),
                  Expanded(flex: 7, child: HomeListWidget(data2: data2)),
                ],
              ),
            );
          } else {
            return const Center(
                child: Text("ELSEGA KIRIB QOLDIKU BRAT",
                    style: TextStyle(color: Colors.white)));
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}
