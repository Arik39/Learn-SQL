import 'package:flutter/material.dart';
import 'package:learnsql/utills/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: kSecondaryBackgroundColor,
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  AppBar(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              //(x,y)
                              blurRadius: 3,
                            ),
                          ],
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              Colors.grey.shade300,
                            ],
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: 40, // Image radius
                            backgroundImage: AssetImage("assets/icon/sql.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Learn SQL",
                          style: TextStyle(
                              fontSize: 15,
                              color: kPrimaryBackgroundColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                            color: kPrimaryBackgroundColor),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        child: Text(
                          "Meet Our Team",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.only(top: 0, bottom: 15),
                        decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryBackgroundColor),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              Colors.grey.shade50,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Devloped by",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: kPrimaryBackgroundColor,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    ":",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: kPrimaryBackgroundColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://in.linkedin.com/in/arik-kantesaria');
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "Arik Kantesaria (190540107099)  ",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.blueGrey.shade700,
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
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Mentored by",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: kPrimaryBackgroundColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    ":",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: kPrimaryBackgroundColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    "Prof. Firoz Sherasiya, Computer Engineering Department",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Explored by",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: kPrimaryBackgroundColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    ":",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: kPrimaryBackgroundColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    "ASWDC, Computer Enngineering Department",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Eulogized by",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: kPrimaryBackgroundColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    ":",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: kPrimaryBackgroundColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    "Darshan Institute of Engineering & Technology, Rajkot, Gujarat - INDIA",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                            color: kPrimaryBackgroundColor),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        child: Text(
                          "About ASWDC",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.only(top: 0, bottom: 15),
                        decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryBackgroundColor),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              Colors.grey.shade50,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Image.asset(
                                    "assets/images/DU_Logo.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Image.asset(
                                    "assets/images/ASWDC.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "ASWDC is Application, Software and Website Development Center @ Darshan Engineering College run by Students and Staff of Computer Engineering Department.",
                              style: TextStyle(fontSize: 11),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Sole purpose of ASWDC is to bridge gap between university curriculum & industry demands. Students learn cutting edge technologies, develop real world application & experiences professional environment @ ASWDC under guidance of industry experts & faculty members.",
                              style: TextStyle(fontSize: 11),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                            color: kPrimaryBackgroundColor),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        child: Text(
                          "Contact Us",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryBackgroundColor),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              Colors.grey.shade50,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.mail_outline_rounded,
                                  size: 15,
                                  color: kPrimaryBackgroundColor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    launchUrl(Uri.parse(
                                        'mailto:aswdc@darshan.ac.in'));
                                  },
                                  child: const Text(
                                    "aswdc@darshan.ac.in",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.call_rounded,
                                  size: 15,
                                  color: kPrimaryBackgroundColor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    launchUrl(Uri.parse('tel:9727747317'));
                                  },
                                  child: const Text(
                                    "+91 97277 47317",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.public_rounded,
                                  size: 15,
                                  color: kPrimaryBackgroundColor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    launch("https://www.darshan.ac.in/");
                                  },
                                  child: const Text(
                                    "www.darshan.ac.in",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "\u00a9 2023 Darshan University",
                            style: TextStyle(fontSize: 12),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "All Rights Reversed - ",
                                style: TextStyle(fontSize: 12),
                              ),
                              GestureDetector(
                                onTap: () {
                                  launch(
                                      "http://www.darshan.ac.in/DIET/ASWDC-Mobile-Apps/Privacy-Policy-General");
                                },
                                child: Text(
                                  "Privacy Policy",
                                  style: TextStyle(
                                      color: Colors.deepPurple, fontSize: 12),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Made with ♥️ in India ",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: kPrimaryBackgroundColor,
            ),
          ),
          Text(
            "About Us",
            style: TextStyle(
              color: kPrimaryBackgroundColor,
              fontSize: 30,
              fontWeight: FontWeight.w800,
              fontFamily: "Sophisto",
            ),
          ),
          SizedBox(
            height: 25,
            width: 25,
          )
        ],
      ),
    );
  }
}
