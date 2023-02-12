
import 'package:flutter/material.dart';
import '../../../data/models/login_model.dart';
import '../../../size_config.dart';
import '../../components/CustomAppBar.dart';
import '../../components/default_button.dart';
import '../../constants/constants.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);
  @override
  State<UserHomePage> createState() => _UserHomePageState();
}
class _UserHomePageState extends State<UserHomePage> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LoginModel loginmodel= ModalRoute.of(context)!.settings.arguments as LoginModel;

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
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _appBar(context, loginmodel),
                    _header(context, loginmodel),
                    _recommendedSection(context, loginmodel),
                    _recentPostedJob(context, loginmodel)
                  ],
                ),
              ),
            ),
          ),
        )

    );

  }

  Widget _appBar(BuildContext context, LoginModel loginmodel) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('http://192.168.85.41:8080'+loginmodel.user!.image.toString()),
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
            height: 6,
          ),
          Text("Jatak cha09ltak",
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

  Widget _recommendedSection(BuildContext context, LoginModel loginmodel) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 12),
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recommender",
            style: TextStyle(fontWeight: FontWeight.bold, color:  Color(0xff343740)),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _recommendedJob(context,
                    company: "Google",
                    img: loginmodel.user!.image.toString(),
                    title: "UX Designer",
                    sub: "\$45,000 Remote",
                    isActive: true),
                _recommendedJob(context,
                    company: "DropBox",
                    img: loginmodel.user!.image.toString(),
                    title: "Reserch Assist",
                    sub: "\$45,000 Remote",
                    isActive: false)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _recommendedJob(
      BuildContext context, {
        required String img,
        required String company,
        required String title,
        required String sub,
        bool isActive = false,
      }) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          // Navigator.push(context, JobDetailPage.getJobDetail());
        },
        child: AspectRatio(
          aspectRatio: 1.3,
          child: Container(
            decoration: BoxDecoration(
              color: isActive ? Color(0xff3E61ED) : Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isActive ? Colors.white : Color(0xffEEEFF1),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Image.network('http://192.168.85.41:8080'+img),
                ),
                SizedBox(height: 16),
                Text(
                  company,
                  style: TextStyle(
                    fontSize: 12,
                    color: isActive ? Colors.white38 : Color(0xff898C8D),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: isActive ? Colors.white : Color(0xff343740),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  sub,
                  style: TextStyle(
                    fontSize: 12,
                    color: isActive ? Colors.white38 : Color(0xff343740),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _recentPostedJob(BuildContext context, LoginModel loginmodel) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recement poste",
            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff343740)),
          ),
          _jobCard(context,
              img: loginmodel.user!.image.toString(),
              title: "Gitlab",
              subtitle: "UX Designer",
              salery: "\$78,000"),
          _jobCard(context,
              img: loginmodel.user!.image.toString(),
              title: "Bitbucket",
              subtitle: "UX Designer",
              salery: "\$45,000"),
          _jobCard(context,
              img: loginmodel.user!.image.toString(),
              title: "Slack",
              subtitle: "UX Designer",
              salery: "\$65,000"),
          _jobCard(context,
              img: loginmodel.user!.image.toString(),
              title: "Dropbox",
              subtitle: "UX Designer",
              salery: "\$95,000"),
        ],
      ),
    );
  }

  Widget _jobCard(
      BuildContext context, {
        required String img,
        required String title,
        required String subtitle,
        required String salery,
      }) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, JobDetailPage.getJobDetail());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xffEEEFF1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image.network('http://192.168.85.41:8080'+img),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 12, color:  Color(0xff898C8D)),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff343740),
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
