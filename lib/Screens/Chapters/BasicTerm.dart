import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learnsql/Screens/Chapters/Chapter.dart';
import 'package:learnsql/Screens/Chapters/Chapters_list.dart';
import 'package:learnsql/model/chapter/database/model/chapterListModel.dart';
import 'package:learnsql/model/chapter/database/util/db_service.dart';
import 'package:learnsql/model/topicHeadings/topic_headings.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';

late TopicHeadings topic_headings;
late String CategoryName;
late int CategoryBasicTermId;
List<chapterListModel> read = [];
List<chapterListModel> totalread = [];

class TopicList extends StatefulWidget {
  TopicList(String a, int b) {
    CategoryName = a;
    CategoryBasicTermId = b;
  }

  @override
  State<TopicList> createState() => _TopicListState();
}

class _TopicListState extends State<TopicList> with WidgetsBindingObserver {
  late List<chapterListModel> nb = [];

  late DBChapterService dbService;

  @override
  void initState() {
    super.initState();
    dbService = DBChapterService();
    getTopicHeadings();
    get();
    WidgetsBinding.instance.addObserver(this);
  }

  get() async {
    nb = await DBChapterService().getFavList();
    read = await dbService.getRead(CategoryBasicTermId);
    totalread = await dbService.gettotalRead(CategoryBasicTermId);

    print(read.length);
    print(totalread.length);
  }

  @override
  void dispose() {
    // Remove the observer
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // These are the callbacks
    switch (state) {
      case AppLifecycleState.resumed:
        print('resune');
        setState(() {
          dbService = DBChapterService();
          getTopicHeadings();
          get();
        });
        break;
      case AppLifecycleState.inactive:
        print('inactive');
        break;
      case AppLifecycleState.paused:
        print('paused');
        break;
      case AppLifecycleState.detached:
        print('detached');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Topics",
                          style: TextStyle(
                            color: Colors.black,
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
                  ),
                  FutureBuilder<TopicHeadings?>(
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        double per = (read.length) /
                            (totalread.length == 0 ? 1 : totalread.length);
                        return Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              margin: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: Text(
                                      "Your Progress",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: "Sophisto"),
                                    ),
                                  ),
                                  Container(
                                    height: 200,
                                    child: CircularPercentIndicator(
                                      radius: 70,
                                      lineWidth: 20,
                                      animation: true,
                                      animationDuration: 1500,
                                      percent: per,
                                      circularStrokeCap:
                                          CircularStrokeCap.round,
                                      center: Text(
                                        ((read.length) /
                                                    (totalread.length == 0
                                                        ? 1
                                                        : totalread.length) *
                                                    100)
                                                .toInt()
                                                .toString() +
                                            '%',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w100,
                                            fontFamily: "Sophisto"),
                                      ),
                                      progressColor:
                                          Color.fromRGBO(13, 204, 179, 1),
                                    ),
                                  ),
                                  // Container(
                                  //   alignment: Alignment.centerRight,
                                  //   height: 200,
                                  //   child: Image.asset(
                                  //     "assets/images/sql.png",
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 60),
                                        child: VerticalDivider(
                                          thickness: 2,
                                          width: 10,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 28),
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        13, 204, 179, 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            80),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromRGBO(
                                                            110, 251, 206, 1),
                                                        offset: Offset(
                                                            2.0, 2.0), //(x,y)
                                                        blurRadius: 10.0,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "{ }",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 25),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            115,
                                                    margin: EdgeInsets.only(
                                                        left: 15),
                                                    child: Text(
                                                      CategoryName,
                                                      style: TextStyle(
                                                          fontSize: 31,
                                                          fontFamily:
                                                              "Sophisto",
                                                          color: Color.fromRGBO(
                                                              13, 204, 179, 1),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ))
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 500,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: ListView.builder(
                                              physics: BouncingScrollPhysics(),
                                              itemCount: snapshot
                                                  .data!.resultList!.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                for (int i = 0;
                                                    i <=
                                                        snapshot.data!
                                                            .resultList!.length;
                                                    i++) {
                                                  addData(snapshot, i);
                                                }

                                                return Container(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 52),
                                                        height: 25,
                                                        width: 25,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              13, 204, 179, 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(80),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      110,
                                                                      251,
                                                                      206,
                                                                      1),
                                                              offset: Offset(
                                                                  2.0,
                                                                  2.0), //(x,y)
                                                              blurRadius: 10.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)),
                                                        height: 160,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width -
                                                            77,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 20),
                                                              child: Row(
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      dbService.setRead(
                                                                          1,
                                                                          int.parse(snapshot
                                                                              .data!
                                                                              .resultList![index]
                                                                              .topicID
                                                                              .toString()));
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) => Chapter(index, int.parse(snapshot.data!.resultList![index].categoryID.toString()), true))).then(
                                                                          (value) {
                                                                        if (value ==
                                                                            1) {
                                                                          setState(
                                                                              () {
                                                                            get();
                                                                          });
                                                                        }
                                                                      });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      margin: EdgeInsets.only(
                                                                          left:
                                                                              0,
                                                                          right:
                                                                              5),
                                                                      padding: EdgeInsets.only(
                                                                          left:
                                                                              5,
                                                                          right:
                                                                              5),
                                                                      height:
                                                                          100,
                                                                      width:
                                                                          280,
                                                                      decoration: BoxDecoration(
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              color: Color.fromRGBO(236, 233, 239, 1),
                                                                              offset: Offset(1.0, 10.0),
                                                                              //(x,y)
                                                                              blurRadius: 5.0,
                                                                            ),
                                                                          ],
                                                                          borderRadius: BorderRadius.circular(
                                                                              20),
                                                                          color:
                                                                              Colors.white),
                                                                      child: Container(
                                                                          child: Center(
                                                                        child: Text(
                                                                            snapshot.data!.resultList![index].topicName
                                                                                .toString(),
                                                                            style: TextStyle(
                                                                                fontSize: 22,
                                                                                fontWeight: FontWeight.w300,
                                                                                fontFamily: "Sophisto"),
                                                                            textAlign: TextAlign.center),
                                                                      )),
                                                                    ),
                                                                  ),
                                                                ],
                                                              )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          // Container(
                                          //   child: Row(
                                          //     children: [
                                          //       Container(
                                          //         margin: EdgeInsets.only(left: 52),
                                          //         height: 25,
                                          //         width: 25,
                                          //         decoration: BoxDecoration(
                                          //           color:
                                          //               Color.fromRGBO(13, 204, 179, 1),
                                          //           borderRadius:
                                          //               BorderRadius.circular(80),
                                          //           boxShadow: [
                                          //             BoxShadow(
                                          //               color: Color.fromRGBO(
                                          //                   110, 251, 206, 1),
                                          //               offset: Offset(2.0, 2.0), //(x,y)
                                          //               blurRadius: 10.0,
                                          //             ),
                                          //           ],
                                          //         ),
                                          //       ),
                                          //       Container(
                                          //         decoration: BoxDecoration(
                                          //             borderRadius:
                                          //                 BorderRadius.circular(30)),
                                          //         height: 160,
                                          //         width:
                                          //             MediaQuery.of(context).size.width -
                                          //                 77,
                                          //         child: ClipRRect(
                                          //           borderRadius:
                                          //               BorderRadius.circular(20),
                                          //           child: Container(
                                          //             margin: EdgeInsets.only(left: 20),
                                          //             child: ListView(
                                          //               scrollDirection: Axis.horizontal,
                                          //               children: [
                                          //                 Row(
                                          //                   children: [
                                          //                     Container(
                                          //                       margin: EdgeInsets.only(
                                          //                           left: 5, right: 5),
                                          //                       height: 100,
                                          //                       width: 180,
                                          //                       decoration: BoxDecoration(
                                          //                           boxShadow: [
                                          //                             BoxShadow(
                                          //                               color: Color
                                          //                                   .fromRGBO(
                                          //                                       236,
                                          //                                       233,
                                          //                                       239,
                                          //                                       1),
                                          //                               offset: Offset(
                                          //                                   1.0,
                                          //                                   10.0), //(x,y)
                                          //                               blurRadius: 10.0,
                                          //                             ),
                                          //                           ],
                                          //                           borderRadius:
                                          //                               BorderRadius
                                          //                                   .circular(20),
                                          //                           color: Colors.white),
                                          //                     ),
                                          //                     Container(
                                          //                       margin: EdgeInsets.only(
                                          //                           left: 5, right: 5),
                                          //                       height: 100,
                                          //                       width: 180,
                                          //                       decoration: BoxDecoration(
                                          //                           boxShadow: [
                                          //                             BoxShadow(
                                          //                               color: Color
                                          //                                   .fromRGBO(
                                          //                                       236,
                                          //                                       233,
                                          //                                       239,
                                          //                                       1),
                                          //                               offset: Offset(
                                          //                                   1.0,
                                          //                                   10.0), //(x,y)
                                          //                               blurRadius: 10.0,
                                          //                             ),
                                          //                           ],
                                          //                           borderRadius:
                                          //                               BorderRadius
                                          //                                   .circular(20),
                                          //                           color: Colors.white),
                                          //                     ),
                                          //                     Container(
                                          //                       margin: EdgeInsets.only(
                                          //                           left: 5, right: 5),
                                          //                       height: 100,
                                          //                       width: 180,
                                          //                       decoration: BoxDecoration(
                                          //                           boxShadow: [
                                          //                             BoxShadow(
                                          //                               color: Color
                                          //                                   .fromRGBO(
                                          //                                       236,
                                          //                                       233,
                                          //                                       239,
                                          //                                       1),
                                          //                               offset: Offset(
                                          //                                   1.0,
                                          //                                   10.0), //(x,y)
                                          //                               blurRadius: 10.0,
                                          //                             ),
                                          //                           ],
                                          //                           borderRadius:
                                          //                               BorderRadius
                                          //                                   .circular(20),
                                          //                           color: Colors.white),
                                          //                     ),
                                          //                   ],
                                          //                 ),
                                          //               ],
                                          //             ),
                                          //           ),
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                          // Container(
                                          //   child: Row(
                                          //     children: [
                                          //       Container(
                                          //         margin: EdgeInsets.only(left: 52),
                                          //         height: 25,
                                          //         width: 25,
                                          //         decoration: BoxDecoration(
                                          //           color:
                                          //               Color.fromRGBO(13, 204, 179, 1),
                                          //           borderRadius:
                                          //               BorderRadius.circular(80),
                                          //           boxShadow: [
                                          //             BoxShadow(
                                          //               color: Color.fromRGBO(
                                          //                   110, 251, 206, 1),
                                          //               offset: Offset(2.0, 2.0), //(x,y)
                                          //               blurRadius: 10.0,
                                          //             ),
                                          //           ],
                                          //         ),
                                          //       ),
                                          //       Container(
                                          //         decoration: BoxDecoration(
                                          //             borderRadius:
                                          //                 BorderRadius.circular(30)),
                                          //         height: 160,
                                          //         width:
                                          //             MediaQuery.of(context).size.width -
                                          //                 77,
                                          //         child: ClipRRect(
                                          //           borderRadius:
                                          //               BorderRadius.circular(20),
                                          //           child: Container(
                                          //             margin: EdgeInsets.only(left: 20),
                                          //             child: ListView(
                                          //               scrollDirection: Axis.horizontal,
                                          //               children: [
                                          //                 Row(
                                          //                   children: [
                                          //                     Container(
                                          //                       margin: EdgeInsets.only(
                                          //                           left: 5, right: 5),
                                          //                       height: 100,
                                          //                       width: 180,
                                          //                       decoration: BoxDecoration(
                                          //                           boxShadow: [
                                          //                             BoxShadow(
                                          //                               color: Color
                                          //                                   .fromRGBO(
                                          //                                       236,
                                          //                                       233,
                                          //                                       239,
                                          //                                       1),
                                          //                               offset: Offset(
                                          //                                   1.0,
                                          //                                   10.0), //(x,y)
                                          //                               blurRadius: 10.0,
                                          //                             ),
                                          //                           ],
                                          //                           borderRadius:
                                          //                               BorderRadius
                                          //                                   .circular(20),
                                          //                           color: Colors.white),
                                          //                     ),
                                          //                     Container(
                                          //                       margin: EdgeInsets.only(
                                          //                           left: 5, right: 5),
                                          //                       height: 100,
                                          //                       width: 180,
                                          //                       decoration: BoxDecoration(
                                          //                           boxShadow: [
                                          //                             BoxShadow(
                                          //                               color: Color
                                          //                                   .fromRGBO(
                                          //                                       236,
                                          //                                       233,
                                          //                                       239,
                                          //                                       1),
                                          //                               offset: Offset(
                                          //                                   1.0,
                                          //                                   10.0), //(x,y)
                                          //                               blurRadius: 10.0,
                                          //                             ),
                                          //                           ],
                                          //                           borderRadius:
                                          //                               BorderRadius
                                          //                                   .circular(20),
                                          //                           color: Colors.white),
                                          //                     ),
                                          //                     Container(
                                          //                       margin: EdgeInsets.only(
                                          //                           left: 5, right: 5),
                                          //                       height: 100,
                                          //                       width: 180,
                                          //                       decoration: BoxDecoration(
                                          //                           boxShadow: [
                                          //                             BoxShadow(
                                          //                               color: Color
                                          //                                   .fromRGBO(
                                          //                                       236,
                                          //                                       233,
                                          //                                       239,
                                          //                                       1),
                                          //                               offset: Offset(
                                          //                                   1.0,
                                          //                                   10.0), //(x,y)
                                          //                               blurRadius: 10.0,
                                          //                             ),
                                          //                           ],
                                          //                           borderRadius:
                                          //                               BorderRadius
                                          //                                   .circular(20),
                                          //                           color: Colors.white),
                                          //                     ),
                                          //                   ],
                                          //                 ),
                                          //               ],
                                          //             ),
                                          //           ),
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                          // Container(
                                          //   child: Row(
                                          //     children: [
                                          //       Container(
                                          //         margin: EdgeInsets.only(left: 52),
                                          //         height: 25,
                                          //         width: 25,
                                          //         decoration: BoxDecoration(
                                          //           color:
                                          //               Color.fromRGBO(13, 204, 179, 1),
                                          //           borderRadius:
                                          //               BorderRadius.circular(80),
                                          //           boxShadow: [
                                          //             BoxShadow(
                                          //               color: Color.fromRGBO(
                                          //                   110, 251, 206, 1),
                                          //               offset: Offset(2.0, 2.0), //(x,y)
                                          //               blurRadius: 10.0,
                                          //             ),
                                          //           ],
                                          //         ),
                                          //       ),
                                          //       Container(
                                          //         decoration: BoxDecoration(
                                          //             borderRadius:
                                          //                 BorderRadius.circular(30)),
                                          //         height: 160,
                                          //         width:
                                          //             MediaQuery.of(context).size.width -
                                          //                 77,
                                          //         child: ClipRRect(
                                          //           borderRadius:
                                          //               BorderRadius.circular(20),
                                          //           child: Container(
                                          //             margin: EdgeInsets.only(left: 20),
                                          //             child: ListView(
                                          //               scrollDirection: Axis.horizontal,
                                          //               children: [
                                          //                 Row(
                                          //                   children: [
                                          //                     Container(
                                          //                       margin: EdgeInsets.only(
                                          //                           left: 5, right: 5),
                                          //                       height: 100,
                                          //                       width: 180,
                                          //                       decoration: BoxDecoration(
                                          //                           boxShadow: [
                                          //                             BoxShadow(
                                          //                               color: Color
                                          //                                   .fromRGBO(
                                          //                                       236,
                                          //                                       233,
                                          //                                       239,
                                          //                                       1),
                                          //                               offset: Offset(
                                          //                                   1.0,
                                          //                                   10.0), //(x,y)
                                          //                               blurRadius: 10.0,
                                          //                             ),
                                          //                           ],
                                          //                           borderRadius:
                                          //                               BorderRadius
                                          //                                   .circular(20),
                                          //                           color: Colors.white),
                                          //                     ),
                                          //                     Container(
                                          //                       margin: EdgeInsets.only(
                                          //                           left: 5, right: 5),
                                          //                       height: 100,
                                          //                       width: 180,
                                          //                       decoration: BoxDecoration(
                                          //                           boxShadow: [
                                          //                             BoxShadow(
                                          //                               color: Color
                                          //                                   .fromRGBO(
                                          //                                       236,
                                          //                                       233,
                                          //                                       239,
                                          //                                       1),
                                          //                               offset: Offset(
                                          //                                   1.0,
                                          //                                   10.0), //(x,y)
                                          //                               blurRadius: 10.0,
                                          //                             ),
                                          //                           ],
                                          //                           borderRadius:
                                          //                               BorderRadius
                                          //                                   .circular(20),
                                          //                           color: Colors.white),
                                          //                     ),
                                          //                     Container(
                                          //                       margin: EdgeInsets.only(
                                          //                           left: 5, right: 5),
                                          //                       height: 100,
                                          //                       width: 180,
                                          //                       decoration: BoxDecoration(
                                          //                           boxShadow: [
                                          //                             BoxShadow(
                                          //                               color: Color
                                          //                                   .fromRGBO(
                                          //                                       236,
                                          //                                       233,
                                          //                                       239,
                                          //                                       1),
                                          //                               offset: Offset(
                                          //                                   1.0,
                                          //                                   10.0), //(x,y)
                                          //                               blurRadius: 10.0,
                                          //                             ),
                                          //                           ],
                                          //                           borderRadius:
                                          //                               BorderRadius
                                          //                                   .circular(20),
                                          //                           color: Colors.white),
                                          //                     ),
                                          //                   ],
                                          //                 ),
                                          //               ],
                                          //             ),
                                          //           ),
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                          // Container(
                                          //   child: Row(
                                          //     children: [
                                          //       Container(
                                          //         margin: EdgeInsets.only(left: 52),
                                          //         height: 25,
                                          //         width: 25,
                                          //         decoration: BoxDecoration(
                                          //           color:
                                          //               Color.fromRGBO(13, 204, 179, 1),
                                          //           borderRadius:
                                          //               BorderRadius.circular(80),
                                          //           boxShadow: [
                                          //             BoxShadow(
                                          //               color: Color.fromRGBO(
                                          //                   110, 251, 206, 1),
                                          //               offset: Offset(2.0, 2.0), //(x,y)
                                          //               blurRadius: 10.0,
                                          //             ),
                                          //           ],
                                          //         ),
                                          //       ),
                                          //       Container(
                                          //         decoration: BoxDecoration(
                                          //             borderRadius:
                                          //                 BorderRadius.circular(30)),
                                          //         height: 160,
                                          //         width:
                                          //             MediaQuery.of(context).size.width -
                                          //                 77,
                                          //         child: ClipRRect(
                                          //           borderRadius:
                                          //               BorderRadius.circular(20),
                                          //           child: Container(
                                          //             margin: EdgeInsets.only(left: 20),
                                          //             child: ListView(
                                          //               scrollDirection: Axis.horizontal,
                                          //               children: [
                                          //                 Row(
                                          //                   children: [
                                          //                     Container(
                                          //                       margin: EdgeInsets.only(
                                          //                           left: 5, right: 5),
                                          //                       height: 100,
                                          //                       width: 180,
                                          //                       decoration: BoxDecoration(
                                          //                           boxShadow: [
                                          //                             BoxShadow(
                                          //                               color: Color
                                          //                                   .fromRGBO(
                                          //                                       236,
                                          //                                       233,
                                          //                                       239,
                                          //                                       1),
                                          //                               offset: Offset(
                                          //                                   1.0,
                                          //                                   10.0), //(x,y)
                                          //                               blurRadius: 10.0,
                                          //                             ),
                                          //                           ],
                                          //                           borderRadius:
                                          //                               BorderRadius
                                          //                                   .circular(20),
                                          //                           color: Colors.white),
                                          //                     ),
                                          //                     Container(
                                          //                       margin: EdgeInsets.only(
                                          //                           left: 5, right: 5),
                                          //                       height: 100,
                                          //                       width: 180,
                                          //                       decoration: BoxDecoration(
                                          //                           boxShadow: [
                                          //                             BoxShadow(
                                          //                               color: Color
                                          //                                   .fromRGBO(
                                          //                                       236,
                                          //                                       233,
                                          //                                       239,
                                          //                                       1),
                                          //                               offset: Offset(
                                          //                                   1.0,
                                          //                                   10.0), //(x,y)
                                          //                               blurRadius: 10.0,
                                          //                             ),
                                          //                           ],
                                          //                           borderRadius:
                                          //                               BorderRadius
                                          //                                   .circular(20),
                                          //                           color: Colors.white),
                                          //                     ),
                                          //                     Container(
                                          //                       margin: EdgeInsets.only(
                                          //                           left: 5, right: 5),
                                          //                       height: 100,
                                          //                       width: 180,
                                          //                       decoration: BoxDecoration(
                                          //                           boxShadow: [
                                          //                             BoxShadow(
                                          //                               color: Color
                                          //                                   .fromRGBO(
                                          //                                       236,
                                          //                                       233,
                                          //                                       239,
                                          //                                       1),
                                          //                               offset: Offset(
                                          //                                   1.0,
                                          //                                   10.0), //(x,y)
                                          //                               blurRadius: 10.0,
                                          //                             ),
                                          //                           ],
                                          //                           borderRadius:
                                          //                               BorderRadius
                                          //                                   .circular(20),
                                          //                           color: Colors.white),
                                          //                     ),
                                          //                   ],
                                          //                 ),
                                          //               ],
                                          //             ),
                                          //           ),
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                          // Container(
                                          //   child: Row(
                                          //     children: [
                                          //       Container(
                                          //         margin: EdgeInsets.only(left: 52),
                                          //         height: 25,
                                          //         width: 25,
                                          //         decoration: BoxDecoration(
                                          //           color:
                                          //               Color.fromRGBO(13, 204, 179, 1),
                                          //           borderRadius:
                                          //               BorderRadius.circular(80),
                                          //           boxShadow: [
                                          //             BoxShadow(
                                          //               color: Color.fromRGBO(
                                          //                   110, 251, 206, 1),
                                          //               offset: Offset(2.0, 2.0), //(x,y)
                                          //               blurRadius: 10.0,
                                          //             ),
                                          //           ],
                                          //         ),
                                          //       ),
                                          //       Container(
                                          //         decoration: BoxDecoration(
                                          //             borderRadius:
                                          //                 BorderRadius.circular(30)),
                                          //         height: 160,
                                          //         width:
                                          //             MediaQuery.of(context).size.width -
                                          //                 77,
                                          //         child: ClipRRect(
                                          //           borderRadius:
                                          //               BorderRadius.circular(20),
                                          //           child: Container(
                                          //             margin: EdgeInsets.only(left: 20),
                                          //             child: ListView(
                                          //               scrollDirection: Axis.horizontal,
                                          //               children: [
                                          //                 Row(
                                          //                   children: [
                                          //                     Container(
                                          //                       margin: EdgeInsets.only(
                                          //                           left: 5, right: 5),
                                          //                       height: 100,
                                          //                       width: 180,
                                          //                       decoration: BoxDecoration(
                                          //                           boxShadow: [
                                          //                             BoxShadow(
                                          //                               color: Color
                                          //                                   .fromRGBO(
                                          //                                       236,
                                          //                                       233,
                                          //                                       239,
                                          //                                       1),
                                          //                               offset: Offset(
                                          //                                   1.0,
                                          //                                   10.0), //(x,y)
                                          //                               blurRadius: 10.0,
                                          //                             ),
                                          //                           ],
                                          //                           borderRadius:
                                          //                               BorderRadius
                                          //                                   .circular(20),
                                          //                           color: Colors.white),
                                          //                     ),
                                          //                     Container(
                                          //                       margin: EdgeInsets.only(
                                          //                           left: 5, right: 5),
                                          //                       height: 100,
                                          //                       width: 180,
                                          //                       decoration: BoxDecoration(
                                          //                           boxShadow: [
                                          //                             BoxShadow(
                                          //                               color: Color
                                          //                                   .fromRGBO(
                                          //                                       236,
                                          //                                       233,
                                          //                                       239,
                                          //                                       1),
                                          //                               offset: Offset(
                                          //                                   1.0,
                                          //                                   10.0), //(x,y)
                                          //                               blurRadius: 10.0,
                                          //                             ),
                                          //                           ],
                                          //                           borderRadius:
                                          //                               BorderRadius
                                          //                                   .circular(20),
                                          //                           color: Colors.white),
                                          //                     ),
                                          //                     Container(
                                          //                       margin: EdgeInsets.only(
                                          //                           left: 5, right: 5),
                                          //                       height: 100,
                                          //                       width: 180,
                                          //                       decoration: BoxDecoration(
                                          //                           boxShadow: [
                                          //                             BoxShadow(
                                          //                               color: Color
                                          //                                   .fromRGBO(
                                          //                                       236,
                                          //                                       233,
                                          //                                       239,
                                          //                                       1),
                                          //                               offset: Offset(
                                          //                                   1.0,
                                          //                                   10.0), //(x,y)
                                          //                               blurRadius: 10.0,
                                          //                             ),
                                          //                           ],
                                          //                           borderRadius:
                                          //                               BorderRadius
                                          //                                   .circular(20),
                                          //                           color: Colors.white),
                                          //                     ),
                                          //                   ],
                                          //                 ),
                                          //               ],
                                          //             ),
                                          //           ),
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Center(
                            child: Container(
                                child: LoadingAnimationWidget.staggeredDotsWave(
                                    color: Colors.black, size: 60)));
                      }
                    },
                    future: getTopicHeadings(),
                  )
                ],
              ),
            )),
      ),
    );
  }

  addData(AsyncSnapshot<TopicHeadings?> snapshot, int index) async {
    chapterListModel modelChapter = chapterListModel();

    modelChapter.topicId =
        await int.parse((snapshot.data!.resultList![index].topicID.toString()));
    modelChapter.topicIndex = index;
    modelChapter.categoryId = await int.parse(
        (snapshot.data!.resultList![index].categoryID.toString()));
    modelChapter.isRead = 0;
    modelChapter.isFavourite = 0;
    modelChapter.topicName =
        await snapshot.data!.resultList![index].topicName.toString();

    DBChapterService().addFav(modelChapter);
  }

  Future<TopicHeadings> getTopicHeadings() async {
    final response = await http.get(
        Uri.parse(
            "http://Api.aswdc.in/Api/LearnSQL/GetTopicListByCategoryID/GetTopicListByCategoryID/$topicId/SQL"),
        headers: {"API_KEY": "1234"});
    var data = jsonDecode(response.body.toString());

    topic_headings = TopicHeadings.fromJson(data);
    return topic_headings;
  }
}
