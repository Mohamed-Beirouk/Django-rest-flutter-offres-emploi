
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workHive/cubit/AnnonceState.dart';
import 'package:workHive/cubit/AnonceCubit.dart';
import 'package:workHive/presentations/components/skeletonAnnonces.dart';
import 'package:workHive/presentations/constants/strings.dart';
import '../../../data/models/Job.dart';
import '../../../data/models/login_model.dart';
import '../../../size_config.dart';
import '../../components/FadeAnimation.dart';
import '../../components/NetworkError.dart';
import '../../constants/constants.dart';
import '../Login/login_screen.dart';
import '../Registre/registre.dart';

class UserAnnonces extends StatefulWidget {
  const UserAnnonces({Key? key}) : super(key: key);

  @override
  State<UserAnnonces> createState() => _UserAnnoncessState();
}

class _UserAnnoncessState extends State<UserAnnonces> {
  bool? filledColor = false;
  String hintText = '';
  TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String test='';
  Widget MyContainer = Container();
  String textcherche='';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LoginModel loginmodel= ModalRoute.of(context)!.settings.arguments as LoginModel;
    return BlocProvider(create: (BuildContext context) => UserAnnoncesCubit(),
      child: BlocConsumer<UserAnnoncesCubit,UserAnnoncesStates>(
        listener: (context,state){
          print(state);
          if(state is UserAnnoncesSuccessState){
            MyContainer = listJobsWidget(state.listhistorique);
            test='cbn';
          }

          else if (state is UserAnnoncesErrorState){
            MyContainer = NetworkError(context);
            test='cbn';
          }

          else{
            MyContainer = NetworkError(context);
            test='cbn';
          }

        },
        builder: (context,state){
          if(test.isEmpty ) {
            UserAnnoncesCubit.get(context).jobsUser();
          }
          return WillPopScope(
              onWillPop: () async {
            Navigator.pushNamedAndRemoveUntil(context, layoutuser, (route) => false,arguments: RegistreScreen().localStorage.getItem('VendorModel'));
            return false;
          },
          child:  Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leadingWidth: 20,
              leading: IconButton(
                  padding: EdgeInsets.only(left: 20),
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios, color: Colors.grey.shade600,)
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      iconSize: 30,
                      onPressed: () {},
                      icon: Icon(Icons.notifications_none, color: Colors.grey.shade400,)
                  ),
                )
              ],
              title: Container(
                height: 45,
                child: TextField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none
                    ),
                    hintText: "rechercher par epe ou sujet",
                    hintStyle: TextStyle(fontSize: 14),

                  ),
                ),
              ),
            ),
            body: SafeArea(
              child: Container(
                color: greylightycolor,
                height: size.height,
                width: size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            getProportionateScreenWidth(10),
                            getProportionateScreenHeight(5),
                            getProportionateScreenWidth(10),
                            getProportionateScreenHeight(5)),
                        child: Column(
                          children: [
                            spaceHeight(
                              getProportionateScreenHeight(20),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(
                                  getProportionateScreenWidth(15),
                                  getProportionateScreenHeight(20),
                                  getProportionateScreenWidth(15),
                                  getProportionateScreenHeight(15)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      getProportionateScreenHeight(10)),
                                  color: whitecolor),
                              child: ConditionalBuilder(
                                condition:state is! UserAnnoncesInitialState,
                                builder:(context)=>
                                MyContainer
                                ,
                                fallback: (context)=>  Skeleton()
                              ),



                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ));
        },
      ),
    );
  }



  void runfilter(String searchedtext){
    setState(() {
      textcherche=searchedtext;
    });
  }


  Widget listJobsWidget(var listJobs){
    return SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder<List<Job>>(
            future: listJobs,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: (snapshot.data as List<Job>).length,
                  itemBuilder: (context, index) {
                    var oneJob = (snapshot.data as List<Job>)[index];
                    final lookingfor = oneJob.titre.toString()
                        .toLowerCase()
                        .contains(textcherche.toLowerCase());
                    print(lookingfor);
                    if (snapshot.hasData) {
                      return FadeAnimation((1.0 + index) / 4, jobComponent(job: oneJob));
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


  jobComponent({required Job job}) {
    return Container(
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
                            child: Image.network(job.image.toString()),
                          )
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(job.titre.toString(), style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)),
                              SizedBox(height: 5,),
                              Text(job.date.toString(), style: TextStyle(color: Colors.grey[500])),
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
          SizedBox(height: 20,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.shade200
                        ),
                        child: Text(
                          job.adresse.toString(),
                          style: TextStyle(
                              color: Colors.black
                          ),

                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.shade200
                        ),
                        child: Text("Entreprise : "+job.entreprise.toString(), style: TextStyle(color: Colors.black),),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}