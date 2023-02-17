import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workHive/cubit/HomePageState.dart';
import '../../../../data/dataprovider/network_services.dart';
import '../../../../data/models/Job.dart';
class HomePageCubit extends Cubit<HomePageStates> {
  HomePageCubit() : super(HomePageInitialState());
  NetworkService networkService = new NetworkService();

  static HomePageCubit get(context) => BlocProvider.of(context);

  void jobsUser() async {
    emit(HomePageLoadingState());
    Future.delayed(Duration(seconds: 3), () {
      try {
        networkService.recommended().then((response) {
          if (response!.statusCode == 200) {
            var getJobs = jsonDecode(response.body) as List;
            var listJobs = getJobs.map((i) => Job.fromJason(i)).toList();
            emit(HomePageSuccessState(listJobs));

          }
          else {
            print('error');
            emit(HomePageErrorState('error'));
          }
        });


      }on Exception catch(_){
        emit(HomePageErrorState('Exception, Contacter le developer'));
      }
      print('5 seconds have passed.');
    });

  }
}