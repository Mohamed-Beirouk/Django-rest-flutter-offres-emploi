
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../screens/Registre/registre.dart';
import 'states.dart';

class ProfileCubit extends Cubit<ProfileStates>
{
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);


  void updateProfile({
    required String nom,
    required String prenom,
    required String telephone,
    required int id,
  })
  {
    emit(ProfileLoadingState());
    // dio.put(
    //   "http://haddemine.pythonanywhere.com/api/vendoredetail/",
    //   // options: Options(
    //   //     headers: {
    //   //       'Authorization':'JWT '+RegistreScreen().localStorage.getItem('token')
    //   //     }),
    //   data:
    //   {
    //     "first_name":prenom,
    //     "last_name":nom,
    //     "phone":telephone,
    //     "id":id,
    //   },).then((value){
    //   print(value.data);
    //   emit(ProfileSuccessState('success'));
    // }).catchError((error){
    //   print(error.toString());
    //   emit(ProfileErrorState(error.toString()));
    // });
  }

}