import 'package:flutter/material.dart';
import 'package:learnsql/Screens/Chapters/Chapters_list.dart';
import 'package:learnsql/Screens/Favourite/Favourite.dart';
import 'package:learnsql/Screens/Interview%20Question/InterviewList.dart';
import 'package:learnsql/Screens/Practice%20Test/PracticeTest.dart';
import 'package:learnsql/Screens/Quiz/Quiz.dart';
import 'package:learnsql/component/NavBar.dart';

import '../../component/navigation_drawer.dart';
import '../Query/SingleQuery.dart';
import '../Search/Search.dart';

class DashBoard extends StatefulWidget {
  bool isCollapsed = true;

  @override
  State<DashBoard> createState() => _DashBoardState();
}

late double deviceH;
late double deviceW;
late bool isPortrait;

class _DashBoardState extends State<DashBoard>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  PageController _pageController = PageController();
  bool isCollapsed = true;

  // late AnimationController _Acontroller;
  // late Animation<double> _scaleAnimation;
  final Duration duration = const Duration(milliseconds: 300);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          drawer: const NavigationDrawer(),
          body: Stack(
            children: [
              MainScreen(context),
            ],
          )),
    );
  }

  Widget MainScreen(context) {
    deviceH = MediaQuery.of(context).size.height;
    deviceW = MediaQuery.of(context).size.width;
    isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Material(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      elevation: 8,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return false;
        },
        child: Stack(
          children: [
            PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              children: <Widget>[
                Container(
                  height: deviceH,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 100),
                        child: Column(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(top: 20, left: 30, right: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(10)),
                                        color:
                                            Color.fromRGBO(238, 247, 254, 1)),
                                    child: InkWell(
                                        onTap: () => _scaffoldKey.currentState
                                            ?.openDrawer(),
                                        child: Image.asset(
                                            "assets/icon/menu.png")),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 30, left: 30, right: 30),
                              child: Container(
                                width: deviceW - 60,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Learn",
                                                style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w800,
                                                  fontFamily: "Sophisto",
                                                  color: Color.fromRGBO(
                                                      13, 204, 179, 1),
                                                ),
                                              ),
                                              Text(
                                                " SQL",
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w800,
                                                    fontFamily: "Sophisto"),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "with Us",
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w800,
                                                fontFamily: "Sophisto"),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Image.asset(
                                        "assets/images/dashboard.png",
                                        scale: 1.7,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(right: 10, left: 30),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            height: isPortrait
                                                ? deviceH / 4
                                                : deviceW / 4,
                                            width: deviceW,
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            InterviewList()));
                                              },
                                              child: Container(
                                                height: 120,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromRGBO(
                                                            227, 224, 55, 0.5),
                                                        offset: Offset(
                                                            1.0, 5.0), //(x,y)
                                                        blurRadius: 10.0,
                                                      ),
                                                    ],
                                                    gradient: LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                        Color.fromRGBO(
                                                            234, 233, 172, 0.4),
                                                        Color.fromRGBO(
                                                            227, 224, 55, .5),
                                                      ],
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 5,
                                                                  top: 5),
                                                          height: isPortrait
                                                              ? deviceW / 4.5
                                                              : deviceH / 3.5,
                                                          child: Image.asset(
                                                              "assets/icon/job_interview.png",
                                                              fit:
                                                                  BoxFit.cover),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 20),
                                                          child: Icon(
                                                            Icons
                                                                .arrow_forward_rounded,
                                                            color: Colors.white,
                                                            size: isPortrait
                                                                ? deviceH / 30
                                                                : deviceW / 30,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                        left: 20,
                                                      ),
                                                      width: deviceW,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Interview",
                                                            style: TextStyle(
                                                                fontSize: isPortrait
                                                                    ? deviceH /
                                                                        30
                                                                    : deviceW /
                                                                        30,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    "Sophisto",
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 5),
                                                            child: Text(
                                                              "Question",
                                                              style: TextStyle(
                                                                  fontSize: isPortrait
                                                                      ? deviceH /
                                                                          30
                                                                      : deviceW /
                                                                          30,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontFamily:
                                                                      "Sophisto",
                                                                  color: Colors
                                                                      .white),
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
                                          Container(
                                            margin: EdgeInsets.only(top: 10),
                                            width: deviceW,
                                            height: isPortrait
                                                ? deviceH / 7
                                                : deviceW / 7,
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Quiz()));
                                              },
                                              child: Container(
                                                height: isPortrait
                                                    ? deviceH / 7
                                                    : deviceW / 7,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromRGBO(
                                                            39, 126, 190, 0.5),
                                                        offset: Offset(
                                                            1.0, 5.0), //(x,y)
                                                        blurRadius: 10.0,
                                                      ),
                                                    ],
                                                    gradient: LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                        Color.fromRGBO(
                                                            114, 172, 219, 0.4),
                                                        Color.fromRGBO(
                                                            39, 126, 190, .5),
                                                      ],
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20,
                                                              right: 20,
                                                              top: 5),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            height: isPortrait
                                                                ? deviceW / 7.2
                                                                : deviceH / 6.2,
                                                            child: Image.asset(
                                                                "assets/icon/quiz.png"),
                                                          ),
                                                          Container(
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_forward_rounded,
                                                              color:
                                                                  Colors.white,
                                                              size: isPortrait
                                                                  ? deviceH / 33
                                                                  : deviceW /
                                                                      33,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 30, bottom: 5),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "Quiz",
                                                        style: TextStyle(
                                                            fontSize: isPortrait
                                                                ? deviceH / 35
                                                                : deviceW / 35,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                "Sophisto",
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(left: 10, right: 30),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            height: isPortrait
                                                ? deviceH / 7
                                                : deviceW / 7,
                                            width: deviceW,
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ChaptersList()));
                                              },
                                              child: Container(
                                                height: isPortrait
                                                    ? deviceH / 7
                                                    : deviceW / 7,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromRGBO(
                                                            126, 189, 59, 0.5),
                                                        offset: Offset(
                                                            1.0, 5.0), //(x,y)
                                                        blurRadius: 10.0,
                                                      ),
                                                    ],
                                                    gradient: LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                        Color.fromRGBO(
                                                            159, 180, 137, 0.4),
                                                        Color.fromRGBO(
                                                            126, 189, 59, 0.5),
                                                      ],
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          height: isPortrait
                                                              ? deviceW / 6.1
                                                              : deviceH / 5.1,
                                                          child: Image.asset(
                                                              "assets/icon/books.png"),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 20),
                                                          child: Icon(
                                                            Icons
                                                                .arrow_forward_rounded,
                                                            color: Colors.white,
                                                            size: isPortrait
                                                                ? deviceH / 33
                                                                : deviceW / 33,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 20),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "Learn",
                                                        style: TextStyle(
                                                            fontSize: isPortrait
                                                                ? deviceH / 35
                                                                : deviceW / 35,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                "Sophisto",
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 10),
                                            height: isPortrait
                                                ? deviceH / 4
                                                : deviceW / 4,
                                            width: deviceW,
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            PracticeTest()));
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromRGBO(
                                                            13, 204, 179, 0.5),
                                                        offset: Offset(
                                                            1.0, 5.0), //(x,y)
                                                        blurRadius: 10.0,
                                                      ),
                                                    ],
                                                    gradient: LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                        Color.fromRGBO(
                                                            135, 193, 180, 0.4),
                                                        Color.fromRGBO(
                                                            13, 204, 179, 0.5),
                                                      ],
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 20,
                                                                  top: 5),
                                                          height: isPortrait
                                                              ? deviceW / 5.5
                                                              : deviceH / 4.5,
                                                          child: Image.asset(
                                                              "assets/icon/exam.png"),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 20),
                                                          child: Icon(
                                                            Icons
                                                                .arrow_forward_rounded,
                                                            color: Colors.white,
                                                            size: isPortrait
                                                                ? deviceH / 30
                                                                : deviceW / 30,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 20,
                                                                  top: 20),
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            "Practice",
                                                            style: TextStyle(
                                                                fontSize: isPortrait
                                                                    ? deviceH /
                                                                        30
                                                                    : deviceW /
                                                                        30,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    "Sophisto",
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 20,
                                                                  bottom: 5),
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            "Test",
                                                            style: TextStyle(
                                                                fontSize: isPortrait
                                                                    ? deviceH /
                                                                        30
                                                                    : deviceW /
                                                                        30,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    "Sophisto",
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Container(
                            //   margin: EdgeInsets.only(top: 50, left: 30, right: 30),
                            //   child: Column(
                            //     children: [
                            //       Row(
                            //         children: [
                            //           Expanded(
                            //             child: Container(
                            //               margin: EdgeInsets.only(right: 10),
                            //               child: InkWell(
                            //                 borderRadius: BorderRadius.circular(30),
                            //                 onTap: () {
                            //                   Navigator.push(
                            //                       context,
                            //                       MaterialPageRoute(
                            //                           builder: (context) =>
                            //                               ChaptersList()));
                            //                 },
                            //                 child: Container(
                            //                   height: 120,
                            //                   decoration: BoxDecoration(
                            //                       boxShadow: [
                            //                         BoxShadow(
                            //                           color:
                            //                               Color.fromRGBO(39, 126, 190, 0.5),
                            //                           offset: Offset(1.0, 5.0), //(x,y)
                            //                           blurRadius: 10.0,
                            //                         ),
                            //                       ],
                            //                       gradient: LinearGradient(
                            //                         begin: Alignment.topCenter,
                            //                         end: Alignment.bottomCenter,
                            //                         colors: [
                            //                           Color.fromRGBO(39, 126, 190, .5),
                            //                           Color.fromRGBO(39, 126, 190, .4),
                            //                         ],
                            //                       ),
                            //                       borderRadius: BorderRadius.circular(30)),
                            //                   child: Column(
                            //                     children: [
                            //                       Container(
                            //                         height: 80,
                            //                         child: Image.asset(
                            //                             "assets/icon/books.png"),
                            //                       ),
                            //                       Container(
                            //                         child: Text(
                            //                           "Chapters",
                            //                           style: TextStyle(
                            //                               fontSize: 25,
                            //                               fontWeight: FontWeight.w500,
                            //                               fontFamily: "Sophisto",
                            //                               color: Colors.white),
                            //                         ),
                            //                       ),
                            //                     ],
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //           Expanded(
                            //             child: Container(
                            //               margin: EdgeInsets.only(left: 10),
                            //               child: InkWell(
                            //                 borderRadius: BorderRadius.circular(30),
                            //                 onTap: () {},
                            //                 child: Card(
                            //                   shape: RoundedRectangleBorder(
                            //                       borderRadius: BorderRadius.circular(30)),
                            //                   elevation: 5,
                            //                   child: Container(
                            //                     height: 120,
                            //                     decoration: BoxDecoration(
                            //                         color: Color.fromRGBO(140, 150, 86, .2),
                            //                         borderRadius:
                            //                             BorderRadius.circular(30)),
                            //                     child: Column(
                            //                       children: [
                            //                         Container(
                            //                           height: 80,
                            //                           child: Image.asset(
                            //                               "assets/icon/job_interview.png"),
                            //                         ),
                            //                         Container(
                            //                           child: Text(
                            //                             "Interview Que.",
                            //                             style: TextStyle(
                            //                                 fontSize: 25,
                            //                                 fontWeight: FontWeight.w500,
                            //                                 fontFamily: "Sophisto",
                            //                                 color: Colors.blueGrey),
                            //                           ),
                            //                         ),
                            //                       ],
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //       Container(
                            //         margin: EdgeInsets.only(top: 20),
                            //         child: Row(
                            //           children: [
                            //             Expanded(
                            //               child: Container(
                            //                 margin: EdgeInsets.only(right: 10),
                            //                 child: InkWell(
                            //                   borderRadius: BorderRadius.circular(30),
                            //                   onTap: () {},
                            //                   child: Card(
                            //                     shape: RoundedRectangleBorder(
                            //                         borderRadius:
                            //                             BorderRadius.circular(30)),
                            //                     elevation: 5,
                            //                     child: Container(
                            //                       height: 120,
                            //                       decoration: BoxDecoration(
                            //                           color:
                            //                               Color.fromRGBO(214, 182, 88, .2),
                            //                           borderRadius:
                            //                               BorderRadius.circular(30)),
                            //                       child: Column(
                            //                         children: [
                            //                           Container(
                            //                             height: 80,
                            //                             child: Image.asset(
                            //                                 "assets/icon/quiz.png"),
                            //                           ),
                            //                           Container(
                            //                             child: Text(
                            //                               "Quiz",
                            //                               style: TextStyle(
                            //                                   fontSize: 25,
                            //                                   fontWeight: FontWeight.w500,
                            //                                   fontFamily: "Sophisto",
                            //                                   color: Colors.blueGrey),
                            //                             ),
                            //                           ),
                            //                         ],
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //             Expanded(
                            //               child: Container(
                            //                 margin: EdgeInsets.only(left: 10),
                            //                 child: InkWell(
                            //                   borderRadius: BorderRadius.circular(30),
                            //                   onTap: () {},
                            //                   child: Card(
                            //                     shape: RoundedRectangleBorder(
                            //                         borderRadius:
                            //                             BorderRadius.circular(30)),
                            //                     elevation: 5,
                            //                     child: Container(
                            //                       height: 120,
                            //                       decoration: BoxDecoration(
                            //                           color:
                            //                               Color.fromRGBO(13, 204, 179, .2),
                            //                           borderRadius:
                            //                               BorderRadius.circular(30)),
                            //                       child: Column(
                            //                         children: [
                            //                           Container(
                            //                             height: 80,
                            //                             child: Image.asset(
                            //                                 "assets/icon/exam.png"),
                            //                           ),
                            //                           Container(
                            //                             child: Text(
                            //                               "Practice Test",
                            //                               style: TextStyle(
                            //                                   fontSize: 25,
                            //                                   fontWeight: FontWeight.w500,
                            //                                   fontFamily: "Sophisto",
                            //                                   color: Colors.blueGrey),
                            //                             ),
                            //                           ),
                            //                         ],
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //           ],
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Favourite(),
                ),
                Container(
                  color: Color.fromRGBO(210, 154, 43, .1),
                  child: Search(),
                ),
                Container(
                  color: Color.fromRGBO(65, 41, 156, .1),
                  child: SingleQuery(),
                ),
              ],
            ),
            NavBar(_currentIndex, _pageController),
          ],
        ),
      ),
    );
  }
}

// class BottomNavyBar extends StatefulWidget {
//   const BottomNavyBar({Key? key}) : super(key: key);
//
//   @override
//   State<BottomNavyBar> createState() => _BottomNavyBarState();
// }
//
// class _BottomNavyBarState extends State<BottomNavyBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(10),
//       height: 56,
//       width: deviceW - 50,
//       color: Colors.red,
//     );
//   }
// }
