import 'package:workHive/presentations/constants/strings.dart';
import 'package:workHive/presentations/layoutuser/layout_user.dart';
import 'package:workHive/presentations/screens/Annonces/user_Annonces.dart';
import 'package:workHive/presentations/screens/HomePage_user/user_homePage.dart';
import 'package:workHive/presentations/screens/Login/login_screen.dart';
import 'package:workHive/presentations/screens/Registre/registre.dart';
import 'package:flutter/material.dart';
import 'package:workHive/presentations/screens/uploadFile.dart';
import 'presentations/screens/Profile/user_profile.dart';


class AppRouter {
  AppRouter() {}

  Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {

      case layoutuser:
        return MaterialPageRoute(builder: (_) => LayoutUser(), settings: setting,);
      case loginPage:
        return MaterialPageRoute(builder: (_) => Login());
      case registrePage:
        return MaterialPageRoute(builder: (_) => RegistreScreen());

      case homePage:
        return MaterialPageRoute(builder: (_) => UserHomePage());
      case Annonces:
        return MaterialPageRoute(builder: (_) => UserAnnonces(),settings: setting,);

      case userProfile:
        return MaterialPageRoute(builder: (_) => UserProfile());

      case Logout:
        return MaterialPageRoute(builder: (_) => Login());
      case filepickerapp:
        return MaterialPageRoute(builder: (_) => EncryptAndSendFile());


      default:
        return null;
    }
  }
}

