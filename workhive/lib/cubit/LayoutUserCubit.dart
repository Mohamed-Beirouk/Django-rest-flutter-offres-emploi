
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workHive/cubit/LayoutUserStates.dart';
import 'package:workHive/presentations/screens/Annonces/user_Annonces.dart';
import 'package:workHive/presentations/screens/HomePage_user/user_homePage.dart';
import 'package:workHive/presentations/screens/Profile/user_profile.dart';


class FastCubit extends Cubit<FastStates>
{
  FastCubit():super(FastInitialState());
  static FastCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> bottomScreen = [
    UserHomePage(),
    UserAnnonces(),
    UserProfile(),
  ];

  void changeBottom(int index)
  {
    currentIndex = index;
    emit(FastChangeBottomNavState());
  }

}