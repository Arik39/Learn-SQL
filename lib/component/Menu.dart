import 'package:flutter/material.dart';

//OLD MENU
//OLD MENU
//OLD MENU
//OLD MENU
//OLD MENU
//OLD MENU
//OLD MENU
//OLD MENU
//OLD MENU
//OLD MENU
//OLD MENU
//OLD MENU

class isEnableSwitch {
  static bool isEnable = false;
}

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(800)),
                    color: Colors.greenAccent.shade100),
                child: Image.asset(
                  "assets/images/profile.png",
                  scale: 1.5,
                ),
              ),
              Container(
                child: Text("Arik Kantesaria"),
              )
            ],
          ),*/
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            padding: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.browser_updated_rounded,
                            )),
                        Text(
                          "Check for update",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            padding: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.feedback_outlined,
                            )),
                        Text(
                          "Feedback",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            padding: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.share_rounded,
                            )),
                        Text(
                          "Share",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            padding: EdgeInsets.only(right: 15),
                            child: Image.asset(
                              "assets/icon/playstore.png",
                              scale: 25,
                            )),
                        Text(
                          "More Apps",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            padding: EdgeInsets.only(right: 15),
                            child: Image.asset(
                              "assets/icon/aboutus.png",
                              scale: 3.6,
                            )),
                        Text(
                          "About Us",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 0),
                      child: Switch(
                          value: isEnableSwitch.isEnable,
                          onChanged: (onChanged) {
                            setState(() {
                              isEnableSwitch.isEnable =
                                  !isEnableSwitch.isEnable;
                            });
                          })),
                  Text(
                    "Haptic Feedback",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
