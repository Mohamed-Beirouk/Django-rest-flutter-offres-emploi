import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workHive/presentations/constants/strings.dart';
import '../../../data/models/login_model.dart';
import '../Registre/registre.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  DateFormat dateFormat = DateFormat("HH:mm");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LoginModel loginmodel= ModalRoute.of(context)!.settings.arguments as LoginModel;
    return WillPopScope(
        onWillPop: () async {
      Navigator.pushNamedAndRemoveUntil(context, layoutuser, (route) => false,arguments: RegistreScreen().localStorage.getItem('VendorModel'));
      return false;
    },
    child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('Profile', style: TextStyle(color: Colors.black87),),
        leading: Icon(Icons.menu, color: Colors.black87,),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('http://192.168.85.41:8080'+loginmodel.user!.image.toString()),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Text(loginmodel.user!.nom.toString(), style: TextStyle(color: Colors.grey[800], fontSize: 25, fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          child: Text('Full stack Developer', style: TextStyle(color: Colors.blueGrey[400], fontSize: 14, fontWeight: FontWeight.w600),),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 200,
                          height: 40,
                          padding: EdgeInsets.only(left: 20),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(side: BorderSide(
                                color: Colors.blue,
                                width: 3,
                                style: BorderStyle.solid
                            ), borderRadius: BorderRadius.circular(50)),
                            disabledColor: Colors.blue,
                            color: Colors.blue,
                            onPressed: () {  },
                            child: Text(loginmodel.user!.email.toString(), style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Divider(
                  thickness: 1,
                  color: Colors.blueGrey[200],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('4,7/5', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),),
                        ),
                        Container(
                          child: Text('Reviews', style: TextStyle(fontSize: 15, color: Colors.blueGrey),),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('30', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),),
                        ),
                        Container(
                          child: Text('Projects', style: TextStyle(fontSize: 15, color: Colors.blueGrey),),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Divider(
                  thickness: 1,
                  color: Colors.blueGrey[200],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: Text('Skills', style: TextStyle(fontSize: 20, color: Colors.blueGrey, fontWeight: FontWeight.w900),),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: GridView.builder(
                              itemCount: loginmodel.lang.toString().split(" ").length,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 4,
                                mainAxisSpacing: 2,
                                mainAxisExtent: 100,
                              ),
                              itemBuilder: (BuildContext ctx, index) {
                                return index==0?
                                Container():
                                Container(
                                  width: 200,
                                  height: 40,

                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(side: BorderSide(
                                        color: Colors.blue,
                                        width: 1,
                                        style: BorderStyle.solid
                                    ), borderRadius: BorderRadius.circular(50)),
                                    disabledColor: Colors.blue,
                                    color: Colors.blue,
                                    onPressed: () {  },
                                    child: Text(loginmodel.lang.toString().split(" ")[index], style: TextStyle(color: Colors.white),),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              Container(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text('Projects', style: TextStyle(fontSize: 20, color: Colors.blueGrey, fontWeight: FontWeight.w900),),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network('https://www.techuz.com/blog/wp-content/uploads/2019/06/Technology-Stack_Banner-1280x720.jpg',)
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 10, left: 10),
                                child: Text('MERN Stack Project', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 20),),
                              ),
                              Container(
                                child: Icon(Icons.favorite, color: Colors.red,),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network('https://appsmaventech.com/images/blog/React-Native-Vs-Flutter-What-Is-Better-For-Your-Business.jpg',)
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 10, left: 10),
                                child: Text('Flutter vs React', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 20),),
                              ),
                              Container(
                                child: Icon(Icons.favorite, color: Colors.red,),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    )
    );
  }
}
