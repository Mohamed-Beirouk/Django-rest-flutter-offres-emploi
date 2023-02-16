import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workHive/cubit/ProfileState.dart';
import 'package:workHive/data/models/Document.dart';
import '../../../../data/dataprovider/network_services.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  NetworkService networkService = new NetworkService();

  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  Future<void> userProfile() async {
    emit(ProfileLoadingState());
    Future.delayed(Duration(seconds: 5), () {

      try {
        networkService.getDocuments().then((response) {
          if (response!.statusCode == 200) {
            var getJobs = jsonDecode(response.body) as List;
            var listJobs = getJobs.map((i) => Document.fromJason(i)).toList();
            emit(ProfileSuccessState(Future.value(listJobs)));
          }
          else {
            print('error');
            emit(ProfileErrorState('error'));
          }
        });
      }
      on Exception catch (_) {
        emit(ProfileErrorState('error'));
      }
      print('5 seconds have passed.');
    }
    );
  }

}
