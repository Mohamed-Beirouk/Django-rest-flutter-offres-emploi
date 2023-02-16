import 'package:workHive/presentations/screens/Login/login_screen.dart';
import 'package:workHive/router.dart';
import 'package:flutter/material.dart';

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
          home: SplashScreen()

        );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    const delay = const Duration(seconds: 3);
    Future.delayed(delay, () => onTimerFinished());
  }

  void onTimerFinished() {
    Navigator.of(context).pushReplacement(new MaterialPageRoute(
      builder: (BuildContext context) {
        return Login();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff53B175),
      body: Center(
        child: splashScreenIcon(),
      ),
    );
  }
}

Widget splashScreenIcon() {
  return Image.asset(
    'assets/images/workhive.png',
    height: 220,
    width: 220,
  );
}