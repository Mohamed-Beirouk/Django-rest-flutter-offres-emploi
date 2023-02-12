import 'package:workHive/presentations/screens/Login/login_screen.dart';
import 'package:workHive/presentations/screens/Registre/registre.dart';
import 'package:workHive/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoped_model/scoped_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(router: AppRouter(),));
}



class MyApp extends StatelessWidget {
  final AppRouter? router;
  const MyApp({Key? key,this.router}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

          title: "Work Hive",
          onGenerateRoute: router!.generateRoute,
          home: Login()

        );
  }
}