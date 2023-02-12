import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workHive/cubit/AnnonceState.dart';

import '../../../../data/dataprovider/network_services.dart';
import '../../../../data/models/Job.dart';
class UserAnnoncesCubit extends Cubit<UserAnnoncesStates> {
  UserAnnoncesCubit() : super(UserAnnoncesInitialState());
  NetworkService networkService = new NetworkService();

  static UserAnnoncesCubit get(context) => BlocProvider.of(context);

  void jobsUser() async {
    emit(UserAnnoncesLoadingState());
    try {
      networkService.jobs().then((response) {
        if (response!.statusCode == 200) {
          var getJobs = jsonDecode(response.body)['jobss'] as List;
          var listJobs = getJobs.map((i) => Job.fromJason(i)).toList();
          emit(UserAnnoncesSuccessState(Future.value(listJobs)));
        }
        else {
          print('error');
          emit(UserAnnoncesErrorState('error'));
        }
      });


    }on Exception catch(_){
      emit(UserAnnoncesErrorState('error'));
    }
  }}