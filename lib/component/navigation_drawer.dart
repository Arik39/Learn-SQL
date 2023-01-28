import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:learnsql/Screens/Aboutus/about_us.dart';
import 'package:url_launcher/url_launcher.dart';

late bool isEnable = false;

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  Future<void> share() async {
    await FlutterShare.share(
      title: 'Learn SQL',
      text:
          """Looking to learn SQL from scratch? Look no further than the "Learn SQL" app! Our comprehensive curriculum covers everything from beginner to advanced level, making it suitable for users of all skill levels. Boost your skills with our wide range of interview questions, complex queries, and multiple choice questions. And with our practice test feature, you'll be better prepared than ever for your next interview or exam. Download "Learn SQL" now and start mastering SQL today!""",
      linkUrl: 'http://diet.vc/a_asql',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(500), bottomRight: Radius.circular(500)),
      ),
      child: Center(
        child: ListView(
          shrinkWrap: true,
          // Remove padding
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              //leading: Icon(Icons.question_mark_rounded),
              title: Text(
                'Do you have any query?',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Sophisto",
                ),
              ),

              //onTap: () => null,
            ),
            GestureDetector(
              onTap: () {
                launchUrl(Uri.parse('tel:9879879861'));
              },
              child: ListTile(
                //leading: Icon(Icons.call_rounded),
                title: Text(
                  'Call : Prof. Firoz Sherasiya',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Sophisto",
                  ),
                ),

                subtitle: Row(
                  children: [
                    Icon(
                      Icons.call,
                      size: 12,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "+91 98798 79861",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Sophisto",
                      ),
                    ),
                  ],
                ),
                //onTap: () => null,
              ),
            ),
            GestureDetector(
              onTap: () {
                launchUrl(Uri.parse(
                    'mailto:firoz.sherasiya@darshan.ac.in?subject=Query regarding Learn SQL application &body=your question here'));
                // launch(
                //     'mailto:firoz.sherasiya@darshan.ac.in?subject=Query regarding Learn SQL application &body=your question here');
              },
              child: ListTile(
                //leading: Icon(Icons.person),
                title: Text(
                  'Email : ',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Sophisto",
                  ),
                ),
                subtitle: Row(
                  children: [
                    Icon(
                      Icons.email_outlined,
                      size: 10,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "firoz.sherasiya@darshan.ac.in",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Sophisto",
                      ),
                    ),
                  ],
                ),
                //onTap: () => null,
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.share,
                color: Colors.lightBlue,
              ),
              title: Text(
                'Share',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: "Sophisto",
                ),
              ),
              onTap: () {
                share();
                /*      launch(
                    'https://play.google.com/store/apps/details?id=com.aswdc_dbms&hl=en&gl=US');*/
              },
            ),
            ListTile(
              leading: Icon(Icons.browser_updated_rounded),
              title: Text(
                'Check for update',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600,
                  fontFamily: "Sophisto",
                ),
              ),
              onTap: () {
                if (Platform.isIOS) {
                  print("Enter URL here");
                  //your link below
                  //launchUrl(Uri.parse(''));
                } else if (Platform.isAndroid) {
                  launch(
                      'https://play.google.com/store/apps/details?id=com.aswdc_dbms&hl=en&gl=US');
                }
              },
            ),
            ListTile(
              leading: Icon(
                Icons.star_border_outlined,
                color: Colors.amber,
              ),
              title: Text(
                'Rate',
                style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: "Sophisto",
                ),
              ),
              onTap: () {
                if (Platform.isIOS) {
                  print("Enter URL here");
                  //your link below
                  //launchUrl(Uri.parse(''));
                } else if (Platform.isAndroid) {
                  launch(
                      'https://play.google.com/store/apps/details?id=com.aswdc_dbms&hl=en&gl=US');
                }
              },
            ),
            ListTile(
                leading: Image.network(
                  "https://cdn-icons-png.flaticon.com/512/6219/6219219.png",
                  scale: 16,
                  color: Color.fromRGBO(107, 82, 200, 1.0),
                ),
                title: Text(
                  'Developer',
                  style: TextStyle(
                    color: Color.fromRGBO(107, 82, 200, 1.0),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: "Sophisto",
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutUs(),
                      ));
                }),
            Divider(),
            GestureDetector(
              onTap: () {
                launch('https://in.linkedin.com/in/arik-kantesaria');
              },
              child: ListTile(
                //leading: Icon(Icons.call_rounded),
                title: Text(
                  'Develeoped by',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Sophisto",
                  ),
                ),

                subtitle: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Arik Kantesaria  ",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      child: Image.asset(
                        "assets/icon/linkedin.png",
                        scale: 25,
                      ),
                    )
                  ],
                ),
                //onTap: () => null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
