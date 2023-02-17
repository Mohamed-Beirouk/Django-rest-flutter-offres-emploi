
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workHive/cubit/HomePageCubit.dart';
import 'package:workHive/cubit/HomePageState.dart';
import 'package:workHive/data/models/Job.dart';
import 'package:workHive/presentations/components/FadeAnimation.dart';
import 'package:workHive/presentations/components/NetworkError.dart';
import 'package:workHive/presentations/components/skeletonAnnonces.dart';
import 'package:workHive/presentations/constants/strings.dart';
import '../../../data/models/login_model.dart';
import '../../../size_config.dart';
import '../../components/default_button.dart';
import '../../constants/constants.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);
  @override
  State<UserHomePage> createState() => _UserHomePageState();
}
class _UserHomePageState extends State<UserHomePage> {
  bool? filledColor = false;
  String hintText = '';
  TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String test='';
  Widget MyContainer = Container();
  String textcherche='';
  List<Job> recommendedJobs = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LoginModel loginmodel= ModalRoute.of(context)!.settings.arguments as LoginModel;
    return BlocProvider(create: (BuildContext context) => HomePageCubit(),
      child: BlocConsumer<HomePageCubit,HomePageStates>(
        listener: (context,state){
          print(state);
          if(state is HomePageSuccessState){
            MyContainer = listJobsWidget(state.listJobs);
            test='cbn';
          }
          else if (state is HomePageErrorState){
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
            HomePageCubit.get(context).jobsUser();
          }
          return WillPopScope(
              onWillPop: () async {
                final result = await showDialog(
                  context: context,
                  builder: (context) => new AlertDialog(
                    title: new Text('quitter'),
                    content: new Text('7ag 3andak?'),
                    actions: <Widget>[
                      new DefaultButton(
                        onTap: () {
                          Navigator.of(context).pop(false);
                        },
                        buttoncolor: greylightycolor,
                        text: 'non',
                        textcolor: blackcolor,
                        textsize: getProportionateScreenHeight(14),
                        width: getProportionateScreenWidth(120),
                        height: getProportionateScreenHeight(30),
                      ),
                      new DefaultButton(
                        onTap: () {
                          Navigator.of(context).pop(true);
                        },
                        buttoncolor: primaryColor,
                        text: 'oui' ,
                        textcolor: whitecolor,
                        textsize: getProportionateScreenHeight(14),
                        width: getProportionateScreenWidth(120),
                        height: getProportionateScreenHeight(30),
                      ),
                    ],
                  ),
                );
                return result ?? false;
              },
              child: Scaffold(
                backgroundColor: Color(0xffF6F7F9),
                body: SafeArea(
                  child: Container(
                    color: greylightycolor,
                    height: size.height,
                    width: size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _appBar(context, loginmodel),
                          _header(context, loginmodel),
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
                                      condition:state is! HomePageInitialState,
                                      builder:(context)=>
                                      MyContainer,
                                      fallback: (context)=>  Skeleton(item: 7,)
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
              )

          );

        },
      ),
    );
  }

  Widget _appBar(BuildContext context, LoginModel loginmodel) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(BASE_URL+loginmodel.user!.image.toString()),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.notifications_none_rounded),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget _header(BuildContext context, LoginModel loginmodel) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Ch6ari "+loginmodel.user!.nom.toString(),
              style: TextStyle(
                fontSize: 15,
                color: Color(0xff898C8D),
                fontWeight: FontWeight.w500,
              )),
          SizedBox(
            height: 16,
          ),
          Text("Jatak cha9ltak",
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff898C8D),
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                      color: Color(0xffEEEFF1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "What are you looking for?",
                    style: TextStyle(fontSize: 15, color: Color(0xff898C8D)),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff3E61ED),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 40,
                child: IconButton(
                  color: Color(0xff3E61ED),
                  icon: Icon(Icons.search, color: Colors.white),
                  onPressed: () {},
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget listJobsWidget(List<Job> listJobs){
    listJobs.map((e) => print(e.titre));
        return SingleChildScrollView(
        child: Column(
            children: [
              ListView.separated(
              physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listJobs.length,
                  itemBuilder: (context, index) {
                    var oneJob = listJobs[index];
                    final lookingfor = oneJob.titre.toString()
                        .toLowerCase()
                        .contains(textcherche.toLowerCase());
                            print(lookingfor);
                  return FadeAnimation((1.0 + index) / 4, jobComponent(job: oneJob));
                  },
                separatorBuilder: (BuildContext context, int index) {
                return SizedBox();
            },
            )
        ]
    ));
  }

  jobComponent({required Job job}) {
    return GestureDetector(
      onTap: () async {
        await launchUrl(Uri.parse(job.link.toString()));
        // if (await canLaunchUrl(Uri.parse(url))){
        //     await launchUrl(Uri.parse(url));
        // }
        // else{
        //   print("Could not launch $url");
        // }

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
      ),
    );
  }
}
