import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learnsql/Screens/Interview%20Question/InterviewList.dart';
import 'package:learnsql/model/interview_question_by_id/interview_question_by_id_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../model/interview_question/interview_question_model.dart';

class SingleInterViewQuestion extends StatefulWidget {
  const SingleInterViewQuestion({Key? key}) : super(key: key);

  @override
  State<SingleInterViewQuestion> createState() =>
      _SingleInterViewQuestionState();
}

Color yellow = Color.fromRGBO(227, 224, 55, 1);
Color yellow1 = Color.fromRGBO(227, 224, 55, 0.1);
Color yellow2 = Color.fromRGBO(227, 224, 55, 0.2);
Color yellow3 = Color.fromRGBO(227, 224, 55, 0.3);
Color yellow4 = Color.fromRGBO(227, 224, 55, 0.4);
Color yellow5 = Color.fromRGBO(227, 224, 55, 0.5);
Color yellow6 = Color.fromRGBO(227, 224, 55, 0.6);
Color yellow7 = Color.fromRGBO(227, 224, 55, 0.7);
Color yellow8 = Color.fromRGBO(227, 224, 55, 0.8);
Color yellow9 = Color.fromRGBO(227, 224, 55, 0.9);

late double deviceH;
late double deviceW;
late bool isPortrait;

bool nextOver = false;
bool previousOver = false;
bool ishide = false;

class _SingleInterViewQuestionState extends State<SingleInterViewQuestion> {
  setQuesId(int a) {
    setState(() {
      quesId = a;
    });
  }

  @override
  void initState() {
    setState(() {
      if (quesId < 0) {
        previousOver = true;
      } else {
        nextOver = false;
        previousOver = false;
      }

      if (quesId >= 184) {
        nextOver = true;
      } else {
        previousOver = false;
        nextOver = false;
      }
    });
    super.initState();
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
          decoration: BoxDecoration(color: yellow1),
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
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: yellow,
                            ),
                          ),
                          Text(
                            "Interview Question",
                            style: TextStyle(
                              color: yellow,
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
                                color: yellow,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
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
                          child: FutureBuilder<InterviewQuestionByIdModel?>(
                            builder: (context, snapshot) {
                              if (snapshot.data != null) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 500,
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
                                              color: yellow7,
                                              offset: Offset(1.0, 5.0), //(x,y)
                                              blurRadius: 10.0,
                                            ),
                                          ],
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [yellow2, yellow4],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          quesId.toString() +
                                              '.' +
                                              ' ' +
                                              (snapshot.data!.resultList![0].que
                                                  .toString()),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
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
                                                PreviousQuesId();

                                                if (quesId <= 1) {
                                                  previousOver = true;
                                                } else {
                                                  nextOver = false;
                                                  previousOver = false;
                                                }
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              margin: EdgeInsets.only(
                                                  top: 30, bottom: 20),
                                              decoration: !previousOver
                                                  ? BoxDecoration(
                                                      boxShadow: [
                                                          BoxShadow(
                                                            color: yellow7,
                                                            offset: Offset(
                                                                1, 5), //(x,y)
                                                            blurRadius: 10.0,
                                                          ),
                                                        ],
                                                      gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: [
                                                          yellow2,
                                                          yellow4,
                                                        ],
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30))
                                                  : null,
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
                                                NextQuesId();
                                                if (quesId >= 184) {
                                                  nextOver = true;
                                                } else {
                                                  previousOver = false;
                                                  nextOver = false;
                                                }
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              margin: EdgeInsets.only(
                                                  top: 30, bottom: 20),
                                              decoration: !nextOver
                                                  ? BoxDecoration(
                                                      boxShadow: [
                                                          BoxShadow(
                                                            color: yellow7,
                                                            offset: Offset(
                                                                1, 2), //(x,y)
                                                            blurRadius: 10.0,
                                                          ),
                                                        ],
                                                      gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: [
                                                          yellow2,
                                                          yellow4,
                                                        ],
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30))
                                                  : null,
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
                                                left: 20,
                                                right: 20,
                                                bottom: 20),
                                            child: Text(
                                              snapshot.data!.resultList![0].ans
                                                  .toString(),
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Sophisto",
                                                  fontSize: 15),
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
                                                color: Colors.yellow,
                                                size: 60)));
                              }
                            },
                            future: getInterviewQuestionById(),
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

  late InterviewQuestionByIdModel model;
  Future<InterviewQuestionByIdModel?> getInterviewQuestionById() async {
    final response = await http.get(
        Uri.parse(
            "http://Api.aswdc.in/Api/LearnSQL/GetInterviewAnsByQueID/GetInterviewAnsByQueID/$quesId/SQL"),
        headers: {"API_KEY": "1234"});
    var data = jsonDecode(response.body.toString());

    model = InterviewQuestionByIdModel.fromJson(data);

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
                  child: FutureBuilder<InterviewQuestionModel>(
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
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
                                          setQuesId(int.parse(snapshot
                                              .data!.resultList![index].queID
                                              .toString()));

                                          setState(() {
                                            if (quesId < 0) {
                                              previousOver = true;
                                            } else {
                                              nextOver = false;
                                              previousOver = false;
                                            }

                                            if (quesId >= 184) {
                                              nextOver = true;
                                            } else {
                                              previousOver = false;
                                              nextOver = false;
                                            }
                                          });
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          child: Text(
                                            snapshot.data!.resultList![index]
                                                    .queID
                                                    .toString() +
                                                '. ' +
                                                snapshot.data!
                                                    .resultList![index].que
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
                                            color: yellow2,
                                            offset: Offset(1.0, 1.0), //(x,y)
                                            blurRadius: 5.0,
                                          ),
                                        ],
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            yellow4,
                                            yellow5,
                                          ],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(200)),
                                  )
                                ],
                              );
                            },
                          );
                        } else {
                          return Center(
                              child: Container(
                                  child:
                                      LoadingAnimationWidget.staggeredDotsWave(
                                          color: Colors.yellow, size: 60)));
                        }
                      },
                      future: getInterviewQuestion())),
            );
          },
        ),
      );

  Future<InterviewQuestionModel> getInterviewQuestion() async {
    final response = await http.get(
        Uri.parse(
            "http://Api.aswdc.in/Api/LearnSQL/GetIntrviewQuestion/GetIntrviewQuestion/SQL"),
        headers: {"API_KEY": "1234"});
    var data = jsonDecode(response.body.toString());

    model_list_interview = InterviewQuestionModel.fromJson(data);

    return model_list_interview;
  }
}
