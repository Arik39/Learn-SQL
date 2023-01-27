import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../model/query_list/Query.dart';

late double deviceH;
late double deviceW;
late bool isPortrait;
int QueryNum = 0;
int QueryLen = 30;

NextQuery() {
  if (QueryNum < QueryLen) {
    QueryNum++;
    ishide = false;
  }
}

PreviousQuery() {
  if (QueryNum > 0) {
    QueryNum--;
    ishide = false;
  }
}

class SingleQuery extends StatefulWidget {
  const SingleQuery({Key? key}) : super(key: key);

  @override
  State<SingleQuery> createState() => _SingleQueryState();
}

bool ishide = false;

class _SingleQueryState extends State<SingleQuery> {
  setQueryId(int a) {
    setState(() {
      QueryNum = a;
    });
  }

  @override
  Widget build(BuildContext context) {
    deviceH = MediaQuery.of(context).size.height;
    deviceW = MediaQuery.of(context).size.width;
    isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Color.fromRGBO(82, 172, 220, .1)),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 25,
                            width: 25,
                          ),
                          Text(
                            "Query",
                            style: TextStyle(
                              color: Color.fromRGBO(82, 172, 220, 1.0),
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              fontFamily: "Sophisto",
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              openList();
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.view_list,
                                color: Color.fromRGBO(82, 172, 220, 1.0),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 120),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(1, 5)),
                            ],
                          ),
                          child: FutureBuilder<Query?>(
                            builder: (context, snapshot) {
                              if (snapshot.data != null) {
                                QueryLen =
                                    snapshot.data!.resultList!.length - 1;
                                return Container(
                                  margin: EdgeInsets.only(bottom: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 20,
                                            bottom: 20),
                                        margin: EdgeInsets.only(
                                            top: 30,
                                            left: 10,
                                            bottom: 20,
                                            right: 10),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromRGBO(
                                                  82, 172, 220, 0.7),
                                              offset: Offset(1.0, 5.0), //(x,y)
                                              blurRadius: 10.0,
                                            ),
                                          ],
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color.fromRGBO(82, 172, 220, .2),
                                              Color.fromRGBO(82, 172, 220, .4),
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          (snapshot
                                              .data!.resultList![QueryNum].query
                                              .toString()),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                PreviousQuery();
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              margin: EdgeInsets.only(
                                                  top: 30, bottom: 20),
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromRGBO(
                                                          82, 172, 220, 0.7),
                                                      offset:
                                                          Offset(1, 5), //(x,y)
                                                      blurRadius: 10.0,
                                                    ),
                                                  ],
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Color.fromRGBO(
                                                          82, 172, 220, .2),
                                                      Color.fromRGBO(
                                                          82, 172, 220, .4),
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: Icon(
                                                Icons
                                                    .arrow_back_ios_new_rounded,
                                                size: 30,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          ishide
                                              ? InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      ishide = !ishide;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 140,
                                                    margin: EdgeInsets.only(
                                                        top: 10),
                                                    padding: EdgeInsets.only(
                                                        left: 10,
                                                        right: 10,
                                                        top: 10,
                                                        bottom: 10),
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Color.fromRGBO(
                                                              75, 93, 86, 0.5),
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
                                                              75, 93, 86, 0.3),
                                                          Color.fromRGBO(
                                                              75, 93, 86, 0.6),
                                                        ],
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            "Hide Answer",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                        Icon(
                                                            Icons
                                                                .arrow_drop_up_rounded,
                                                            color: Colors.white,
                                                            size: 25)
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      ishide = !ishide;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 140,
                                                    margin: EdgeInsets.only(
                                                        top: 10),
                                                    padding: EdgeInsets.only(
                                                        left: 10,
                                                        right: 10,
                                                        top: 10,
                                                        bottom: 10),
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Color.fromRGBO(
                                                              44,
                                                              154,
                                                              109,
                                                              0.5),
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
                                                          Color.fromRGBO(44,
                                                              154, 109, 0.3),
                                                          Color.fromRGBO(44,
                                                              154, 109, 0.6),
                                                        ],
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            "Show Answer",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                        Icon(
                                                            Icons
                                                                .arrow_drop_down_rounded,
                                                            color: Colors.white,
                                                            size: 25)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                NextQuery();
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              margin: EdgeInsets.only(
                                                  top: 30, bottom: 20),
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromRGBO(
                                                          82, 172, 220, 0.7),
                                                      offset:
                                                          Offset(1, 2), //(x,y)
                                                      blurRadius: 10.0,
                                                    ),
                                                  ],
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Color.fromRGBO(
                                                          82, 172, 220, .2),
                                                      Color.fromRGBO(
                                                          82, 172, 220, .4),
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: Center(
                                                  child: Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                size: 30,
                                                color: Colors.white,
                                              )),
                                            ),
                                          ),
                                        ],
                                      ),
                                      AnimatedOpacity(
                                        opacity: ishide ? 1.0 : 0.0,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        child: Visibility(
                                          visible: ishide,
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                top: 30,
                                                left: 10,
                                                right: 10,
                                                bottom: 20),
                                            child: Html(
                                              data: snapshot
                                                  .data!
                                                  .resultList![QueryNum]
                                                  .queryAns,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              } else {
                                return Center(
                                    child: Container(
                                        child: LoadingAnimationWidget
                                            .staggeredDotsWave(
                                                color: Color.fromRGBO(
                                                    82, 172, 220, 1.0),
                                                size: 60)));
                              }
                            },
                            future: getQueryById(),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  late Query model;

  Future<Query> getQueryById() async {
    final response = await http.get(
        Uri.parse("http://Api.aswdc.in/Api/LearnSQL/GetQueryList/GetQuery/SQL"),
        headers: {"API_KEY": "1234"});
    var data = jsonDecode(response.body.toString());

    model = Query.fromJson(data);

    return model;

    // InterviewQuestionByIdModel model = InterviewQuestionByIdModel();
    // await ApiExecutor().callApi(
    //     context, API_GET_INT_QUESTION_BY_ID, true, true, null, (value) {
    //   model = InterviewQuestionByIdModel.fromJson(jsonDecode(value));
    // }, true);
    //
    // return model;
  }

  openList() => showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              content: Container(
                  height: deviceH - 200,
                  width: deviceW,
                  child: FutureBuilder<Query>(
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          QueryLen = snapshot.data!.resultList!.length;
                          return ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: snapshot.data!.resultList!.length,
                            itemBuilder: (BuildContext context, index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                          child: GestureDetector(
                                        onTap: () {
                                          setQueryId(index);
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          child: Text(
                                            (index + 1).toString() +
                                                '. ' +
                                                snapshot.data!
                                                    .resultList![index].query
                                                    .toString(),
                                            overflow: TextOverflow.fade,
                                            maxLines: 1,
                                            softWrap: false,
                                          ),
                                        ),
                                      )),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 8, bottom: 8, right: 0, left: 0),
                                    height: 5,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromRGBO(
                                                82, 172, 220, .2),
                                            offset: Offset(1.0, 1.0), //(x,y)
                                            blurRadius: 5.0,
                                          ),
                                        ],
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color.fromRGBO(82, 172, 220, .4),
                                            Color.fromRGBO(82, 172, 220, .5),
                                          ],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(200)),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          return Container();
                        }
                      },
                      future: getQueryById())),
            );
          },
        ),
      );

// Future<Query> getInterviewQuestion() async {
//   final response = await http.get(
//       Uri.parse("http://Api.aswdc.in/Api/LearnSQL/GetQueryList/GetQuery/SQL"),
//       headers: {"API_KEY": "1234"});
//   var data = jsonDecode(response.body.toString());
//
//   model_list_query = Query.fromJson(data);
//
//   return model_list_query;
// }
}
