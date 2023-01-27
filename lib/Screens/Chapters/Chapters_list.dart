import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learnsql/Screens/Chapters/BasicTerm.dart';
import 'package:learnsql/model/topic_name/topic_name_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

late int topicId;

class ChaptersList extends StatefulWidget {
  const ChaptersList({Key? key}) : super(key: key);

  @override
  State<ChaptersList> createState() => _ChaptersListState();
}

class _ChaptersListState extends State<ChaptersList> {
  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;

    List<Color> colorList = [
      Color.fromRGBO(227, 224, 55, 1),
      Color.fromRGBO(227, 224, 55, 0.4),
      Color.fromRGBO(126, 189, 59, 1),
      Color.fromRGBO(126, 189, 59, 0.4),
      Color.fromRGBO(39, 126, 190, 1),
      Color.fromRGBO(39, 126, 190, 0.4),
      Color.fromRGBO(13, 204, 179, 1),
      Color.fromRGBO(13, 204, 179, 0.4),
    ];
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              ChapterListAppbar(),
              FutureBuilder<TopicNameModel>(
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return Expanded(
                        flex: 15,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: snapshot.data!.resultList!.length,
                          itemBuilder: (BuildContext context, int index) {
                            int chNum = index + 1;

                            return Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                margin: EdgeInsets.only(bottom: 15),
                                child: index % 2 == 0
                                    ? index < 6
                                        ? Theme(
                                            data: ThemeData(
                                              splashColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => TopicList(
                                                            snapshot
                                                                .data!
                                                                .resultList![
                                                                    index]
                                                                .categoryName
                                                                .toString(),
                                                            int.parse(snapshot
                                                                .data!
                                                                .resultList![
                                                                    index]
                                                                .categoryID
                                                                .toString()))));
                                                setState(() {
                                                  topicId = int.parse(snapshot
                                                      .data!
                                                      .resultList![index]
                                                      .categoryID
                                                      .toString());
                                                });
                                              },
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 10),
                                                    padding: EdgeInsets.only(
                                                        left: 100,
                                                        right: 30,
                                                        bottom: 30,
                                                        top: 30),
                                                    width: deviceW - 100,
                                                    decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Colors
                                                                  .black12,
                                                              blurRadius: 5,
                                                              offset:
                                                                  Offset(1, 2))
                                                        ],
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10))),
                                                    child: Text(
                                                      snapshot
                                                          .data!
                                                          .resultList![index]
                                                          .categoryName
                                                          .toString(),
                                                      maxLines: 1,
                                                      softWrap: false,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          overflow: TextOverflow
                                                              .fade),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: deviceW - 100,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  right: 10),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 28,
                                                                  right: 28,
                                                                  top: 35,
                                                                  bottom: 35),
                                                          decoration:
                                                              BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: colorList[((2 *
                                                                        (index %
                                                                            4)) +
                                                                    1)],
                                                                offset: Offset(
                                                                    1.0,
                                                                    5.0), //(x,y)
                                                                blurRadius:
                                                                    10.0,
                                                              ),
                                                            ],
                                                            gradient:
                                                                LinearGradient(
                                                              begin: Alignment
                                                                  .topCenter,
                                                              end: Alignment
                                                                  .bottomCenter,
                                                              colors: [
                                                                colorList[((2 *
                                                                        (index %
                                                                            4)) +
                                                                    1)],
                                                                colorList[2 *
                                                                    (index %
                                                                        4)],
                                                              ],
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "$chNum",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900,
                                                                  fontSize: 30,
                                                                  fontFamily:
                                                                      "Sophisto"),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 10,
                                                                  left: 10),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 34,
                                                                  bottom: 34,
                                                                  left: 3,
                                                                  right: 4),
                                                          decoration:
                                                              BoxDecoration(
                                                                  boxShadow: [
                                                                BoxShadow(
                                                                  color: colorList[
                                                                      ((2 * (index % 4)) +
                                                                          1)],
                                                                  offset: Offset(
                                                                      1.0,
                                                                      5.0), //(x,y)
                                                                  blurRadius:
                                                                      10.0,
                                                                ),
                                                              ],
                                                                  gradient:
                                                                      LinearGradient(
                                                                    begin: Alignment
                                                                        .topCenter,
                                                                    end: Alignment
                                                                        .bottomCenter,
                                                                    colors: [
                                                                      colorList[
                                                                          ((2 * (index % 4)) +
                                                                              1)],
                                                                      colorList[2 *
                                                                          (index %
                                                                              4)],
                                                                    ],
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : Container()
                                    : index < 6
                                        ? Theme(
                                            data: ThemeData(
                                                splashColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => TopicList(
                                                            snapshot
                                                                .data!
                                                                .resultList![
                                                                    index]
                                                                .categoryName
                                                                .toString(),
                                                            int.parse(snapshot
                                                                .data!
                                                                .resultList![
                                                                    index]
                                                                .categoryID
                                                                .toString()))));

                                                setState(() {
                                                  topicId = int.parse(snapshot
                                                      .data!
                                                      .resultList![index]
                                                      .categoryID
                                                      .toString());
                                                });
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 10),
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 40,
                                                                right: 100,
                                                                bottom: 30,
                                                                top: 30),
                                                        width: deviceW - 100,
                                                        decoration: BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .black12,
                                                                  blurRadius: 5,
                                                                  offset:
                                                                      Offset(
                                                                          1, 2))
                                                            ],
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        10))),
                                                        child: Text(
                                                          snapshot
                                                              .data!
                                                              .resultList![
                                                                  index]
                                                              .categoryName
                                                              .toString(),
                                                          maxLines: 1,
                                                          softWrap: false,
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            overflow:
                                                                TextOverflow
                                                                    .fade,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: deviceW - 100,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      right: 10,
                                                                      left: 10),
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 34,
                                                                      bottom:
                                                                          34,
                                                                      left: 3,
                                                                      right: 4),
                                                              decoration:
                                                                  BoxDecoration(
                                                                      boxShadow: [
                                                                    BoxShadow(
                                                                      color: colorList[
                                                                          ((2 * (index % 4)) +
                                                                              1)],
                                                                      offset: Offset(
                                                                          1.0,
                                                                          5.0), //(x,y)
                                                                      blurRadius:
                                                                          10.0,
                                                                    ),
                                                                  ],
                                                                      gradient:
                                                                          LinearGradient(
                                                                        begin: Alignment
                                                                            .topCenter,
                                                                        end: Alignment
                                                                            .bottomCenter,
                                                                        colors: [
                                                                          colorList[((2 * (index % 4)) +
                                                                              1)],
                                                                          colorList[2 *
                                                                              (index % 4)],
                                                                        ],
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30)),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 10,
                                                                      right:
                                                                          10),
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 28,
                                                                      right: 28,
                                                                      top: 35,
                                                                      bottom:
                                                                          35),
                                                              decoration:
                                                                  BoxDecoration(
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: colorList[
                                                                        ((2 * (index % 4)) +
                                                                            1)],
                                                                    offset: Offset(
                                                                        1.0,
                                                                        5.0), //(x,y)
                                                                    blurRadius:
                                                                        10.0,
                                                                  ),
                                                                ],
                                                                gradient:
                                                                    LinearGradient(
                                                                  begin: Alignment
                                                                      .topCenter,
                                                                  end: Alignment
                                                                      .bottomCenter,
                                                                  colors: [
                                                                    colorList[
                                                                        ((2 * (index % 4)) +
                                                                            1)],
                                                                    colorList[2 *
                                                                        (index %
                                                                            4)],
                                                                  ],
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  "$chNum",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w900,
                                                                      fontSize:
                                                                          30,
                                                                      fontFamily:
                                                                          "Sophisto"),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : Container());
                          },
                        ),
                      );
                    } else {
                      return Center(
                          child: Container(
                              child: LoadingAnimationWidget.staggeredDotsWave(
                                  color: Colors.black, size: 60)));
                    }
                  },
                  future: getTopic()),
            ],
          ),
        ),
      ),
    );
  }

  late TopicNameModel model;

  Future<TopicNameModel> getTopic() async {
    final response = await http.get(
        Uri.parse(
            "http://Api.aswdc.in/Api/LearnSQL/GetCategoryList/GetCategoryList/SQL"),
        headers: {"API_KEY": "1234"});
    var data = jsonDecode(response.body.toString());

    model = TopicNameModel.fromJson(data);

    return model;
  }
}

class ChapterListAppbar extends StatelessWidget {
  const ChapterListAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
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
            "Chapters",
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
    );
  }
}
