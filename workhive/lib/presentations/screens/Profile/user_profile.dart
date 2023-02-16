import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:open_filex/open_filex.dart';
import 'package:workHive/cubit/ProfileCubit.dart';
import 'package:workHive/cubit/ProfileState.dart';
import 'package:workHive/data/dataprovider/network_services.dart';
import 'package:workHive/data/models/Document.dart';
import 'package:workHive/presentations/components/FadeAnimation.dart';
import 'package:workHive/presentations/components/NetworkError.dart';
import 'package:workHive/presentations/components/addDocument.dart';
import 'package:workHive/presentations/components/default_button.dart';
import 'package:workHive/presentations/components/skeletonAnnonces.dart';
import 'package:workHive/presentations/constants/strings.dart';
import 'package:workHive/presentations/cryptageBeirouk/cryptageAESFiles.dart';
import 'package:workHive/presentations/cryptageBeirouk/cryptagefunctions.dart';
import 'package:workHive/size_config.dart';
import '../../../data/models/login_model.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool? filledColor = false;
  String hintText = '';
  TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String test='';
  Widget MyContainer = Container();
  String textcherche='';
  DateFormat dateFormat = DateFormat("HH:mm");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LoginModel loginmodel= ModalRoute.of(context)!.settings.arguments as LoginModel;

    return BlocProvider(create: (BuildContext context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit,ProfileStates>(
        listener: (context,state){
          print(state);
          if(state is ProfileSuccessState){
            MyContainer = listJobsWidget(state.listDoc);
            test='cbn';
          }

          else if (state is ProfileErrorState){
            MyContainer = NetworkError(context);
            test='cbn';
          }

          else{
            MyContainer = Skeleton(heidht: 80, item:4);
            test='cbn';
          }

        },
        builder: (context,state){
          if(test.isEmpty ) {
            ProfileCubit.get(context).userProfile();
          }
          return WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  elevation: 0,
                  title: Text('Profile', style: TextStyle(color: Colors.black87),),
                  leading:
                  Icon(
                    Icons.menu,
                    color: Colors.black87,
                  ),
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
                              backgroundImage: NetworkImage(BASE_URL+loginmodel.user!.image.toString()),
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
                                      onPressed: () {
                                        Navigator.pushNamedAndRemoveUntil(context, filepickerapp, (route) => false,arguments: loginmodel);
                                      },
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
                              padding: EdgeInsets.only(top: 10),
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
                              padding: EdgeInsets.only(top: 10),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text('Mes dossiers', style: TextStyle(fontSize: 20, color: Colors.blueGrey, fontWeight: FontWeight.w900),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: DefaultButton(
                                      onTap: () {
                                        showModalBottomSheet<void>(
                                            context: context,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                                            ),
                                            isScrollControlled: true,
                                            builder: (BuildContext context) {
                                              return SizedBox(
                                                  height:
                                                  getProportionateScreenHeight(
                                                      710),
                                                  child: AddDocument());
                                            }).then((value) {
                                          ProfileCubit.get(context).userProfile();
                                        });
                                      },
                                      buttoncolor: Colors.grey[300],
                                      text: 'ajouter un document',
                                      textcolor: Colors.black,
                                      textsize:
                                      getProportionateScreenHeight(14),
                                      prefixIcon: Icon(
                                        Icons.file_copy_outlined,
                                        size: getProportionateScreenHeight(20),
                                      ),
                                      width: getProportionateScreenWidth(150),
                                      height: getProportionateScreenHeight(65),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                        child: ConditionalBuilder(
                                            condition:state is! ProfileInitialState,
                                            builder:(context)=>
                                            MyContainer
                                            ,
                                            fallback: (context)=> Skeleton(heidht: 80, item:4)
                                      ),
                                      )
                                    ],
                                  ),
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

        },
      ),
    );

  }

  Widget listJobsWidget(var listJobs){
    return SingleChildScrollView(
        child: Column(
            children: [
              FutureBuilder<List<Document>>(
                  future: listJobs,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: (snapshot.data as List<Document>).length,
                        itemBuilder: (context, index) {
                          var oneJob = (snapshot.data as List<Document>)[index];
                          final lookingfor = oneJob.intitule.toString()
                              .toLowerCase()
                              .contains(textcherche.toLowerCase());
                          print(lookingfor);
                          if (snapshot.hasData) {
                            return FadeAnimation((1.0 + index) / 4, jobComponent(doc: oneJob));
                          }
                          else if (snapshot.hasError) {
                            return Center(child: Text("${snapshot.error}"));
                          }
                          return Center(
                              child: CircularProgressIndicator(color: Colors.white)
                          );
                        }, separatorBuilder: (BuildContext context, int index) {
                        return SizedBox();
                      },
                      );
                    }
                    else{
                      return Container();
                    }
                  }
              )
            ]
        ));
  }


  jobComponent({required Document doc}) {
    return GestureDetector(
      onTap: () async {
        print("tapped on open file");
        File fileDec = await  NetworkService.getAFile(doc.cv!);

        String nn = await Encrypt.decrypt_file_aes(fileDec.path);
        print(nn);
        OpenFilex.open(nn);
        print("tapped on open file 2");
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ]
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                      children: [
                        Container(
                            width: 60,
                            height: 60,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/images/file.png',
                                height: 220,
                                width: 220,
                              ),
                            )
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(doc.intitule.toString(), style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)),
                                SizedBox(height: 5,),
                                Text(doc.date_depot.toString(), style: TextStyle(color: Colors.grey[500])),
                              ]
                          ),
                        )
                      ]
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // setState(() {
                    //   job.isMyFav = !job.isMyFav;
                    // });
                  },
                  child: AnimatedContainer(
                      height: 35,
                      padding: EdgeInsets.all(5),
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.red.shade100 )
                      ),
                      child: Center(
                          child: Icon(Icons.favorite_outline, color: Colors.grey.shade600,)
                      )
                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
