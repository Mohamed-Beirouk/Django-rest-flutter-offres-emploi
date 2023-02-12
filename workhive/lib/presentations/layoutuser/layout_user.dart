
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workHive/cubit/LayoutUserCubit.dart';
import 'package:workHive/cubit/LayoutUserStates.dart';

import '../../data/models/login_model.dart';



class LayoutUser extends StatelessWidget {

  const LayoutUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginModel loginmodel= ModalRoute.of(context)!.settings.arguments as LoginModel;
    return BlocProvider(
      create: (BuildContext context) =>FastCubit(),
      child: BlocConsumer<FastCubit,FastStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = FastCubit.get(context);
          return Scaffold(
            body: cubit.bottomScreen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index)
              {
                cubit.changeBottom(index);
              },
              currentIndex: cubit.currentIndex,
              selectedItemColor: Colors.black,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    cubit.currentIndex == 0?
                    Icons.home
                        : Icons.home_outlined,
                  ),
                  label: 'Accueil',
                ),
                BottomNavigationBarItem(

                    icon: Icon(
                      cubit.currentIndex == 1
                          ? Icons.access_time_filled
                          : Icons.access_time,

                    ),
                    label: 'Annonces'
                ),

                BottomNavigationBarItem(
                  icon: Icon(
                    cubit.currentIndex == 3
                        ? Icons.account_circle_outlined
                        : Icons.account_circle_outlined,

                  ),
                  label: 'Profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
