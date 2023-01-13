import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learnsql/model/question/question_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

late double deviceH;
late double deviceW;
int queNum = 0;
int pointNum = 1;

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  bool nextOver = false;
  bool previousOver = false;
  bool btnPressed = false;
  bool ishide = false;
  bool answered = false;
  int score = 0;
  List<String> alphabet = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];

  final itemController = ItemScrollController();

  @override
  void initState() {
    super.initState();

    pointNum = 1;
    queNum = 0;
  }

  Future scrollToItem(int index) async {
    if (index > 0 && index < 371) {
      itemController.scrollTo(
          index: index, alignment: .4, duration: Duration(milliseconds: 200));
    }
  }

  setQuesId(int a) {
    setState(() {
      queNum = a - 1;
      pointNum = a;
    });
  }

  @override
  Widget build(BuildContext context) {
    deviceH = MediaQuery.of(context).size.height;
    deviceW = MediaQuery.of(context).size.width;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    PreviousQuesId() {
      setState(() {
        if (queNum > 0) {
          queNum -= 1;
          pointNum -= 1;

          btnPressed = false;
          answered = false;
        }

        if (queNum >= 1) {
          nextOver = false;
        } else {
          previousOver = true;
        }
      });
    }

    NextQuesId() {
      setState(() {
        if (queNum < 370) {
          queNum += 1;
          pointNum += 1;
          previousOver = false;
          btnPressed = false;
          answered = false;
        } else {
          nextOver = true;
        }
      });
    }

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<QuestionModel>(
          builder: (context, snapshot) {
            if (snapshot.data != null && snapshot.data!.isResult == 1) {
              List<String> oAlphabet = [
                snapshot.data!.resultList![queNum].optionA.toString(),
                snapshot.data!.resultList![queNum].optionB.toString(),
                snapshot.data!.resultList![queNum].optionC.toString(),
                snapshot.data!.resultList![queNum].optionD.toString(),
              ];
              return Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(107, 82, 200, .1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    height: deviceH,
                    width: deviceW,
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
                                  color: Color.fromRGBO(107, 82, 200, 1.0),
                                ),
                              ),
                              Text(
                                "Quiz",
                                style: TextStyle(
                                  color: Color.fromRGBO(107, 82, 200, 1.0),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "Sophisto",
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  openList();
                                },
                                child: Icon(
                                  Icons.view_list,
                                  color: Color.fromRGBO(107, 82, 200, 1.0),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 5),
                          child: Column(
                            children: [
                              Center(
                                child: Container(
                                  height: 68,
                                  margin: EdgeInsets.only(bottom: 20),
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
                                  child: ScrollablePositionedList.builder(
                                    physics: BouncingScrollPhysics(),
                                    itemScrollController: itemController,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        snapshot.data!.resultList!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      int Num = index + 1;

                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            pointNum = Num;
                                            queNum = Num - 1;

                                            btnPressed = false;
                                            answered = false;
                                            nextOver = false;
                                            previousOver = false;
                                          });
                                        },
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          margin: EdgeInsets.all(10),
                                          decoration: (Num == pointNum)
                                              ? BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromRGBO(
                                                          107, 82, 200, 0.5),
                                                      offset: Offset(
                                                          1.0, 5.0), //(x,y)
                                                      blurRadius: 10.0,
                                                    ),
                                                  ],
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Color.fromRGBO(
                                                          65, 64, 66, 0.4),
                                                      Color.fromRGBO(80, 80, 80,
                                                          0.9019607843137255),
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          200),
                                                )
                                              : BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromRGBO(
                                                          107, 82, 200, 0.5),
                                                      offset: Offset(
                                                          1.0, 5.0), //(x,y)
                                                      blurRadius: 10.0,
                                                    ),
                                                  ],
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Color.fromRGBO(
                                                          107, 82, 200, .4),
                                                      Color.fromRGBO(
                                                          107, 82, 200, .9),
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          200),
                                                ),
                                          child: Center(
                                            child: Text(
                                              "$Num",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  height: deviceH / 1.8,
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
                                  padding: EdgeInsets.only(bottom: 30),
                                  child: SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 20,
                                              bottom: 40),
                                          margin: EdgeInsets.only(
                                              top: 30,
                                              left: 10,
                                              bottom: 20,
                                              right: 10),
                                          width: deviceW,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromRGBO(
                                                    107, 82, 200, 0.5),
                                                offset:
                                                    Offset(1.0, 5.0), //(x,y)
                                                blurRadius: 10.0,
                                              ),
                                            ],
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color.fromRGBO(
                                                    107, 82, 200, .4),
                                                Color.fromRGBO(
                                                    107, 82, 200, .9),
                                              ],
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Text(
                                            '$pointNum. ' +
                                                snapshot
                                                    .data!
                                                    .resultList![queNum]
                                                    .question
                                                    .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),

                                        Column(
                                          children: [
                                            for (int i = 0; i < 4; i++)
                                              GestureDetector(
                                                  onTap: !answered
                                                      ? () {
                                                          if (snapshot
                                                                  .data!
                                                                  .resultList![
                                                                      queNum]
                                                                  .trueOption
                                                                  .toString() ==
                                                              alphabet[i]) {
                                                            score++;
                                                            print("yes");
                                                          } else {
                                                            print("no");
                                                          }
                                                          setState(() {
                                                            btnPressed = true;
                                                            answered = true;
                                                          });
                                                        }
                                                      : null,
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 20,
                                                        right: 20,
                                                        top: 20,
                                                        bottom: 20),
                                                    margin: EdgeInsets.only(
                                                        left: 35,
                                                        right: 30,
                                                        top: 10),
                                                    width: deviceW,
                                                    decoration: btnPressed
                                                        ? snapshot
                                                                    .data!
                                                                    .resultList![
                                                                        queNum]
                                                                    .trueOption
                                                                    .toString() ==
                                                                alphabet[i]
                                                            ? BoxDecoration(
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            44,
                                                                            154,
                                                                            109,
                                                                            0.5),
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
                                                                    Color.fromRGBO(
                                                                        44,
                                                                        154,
                                                                        109,
                                                                        0.5),
                                                                    Color.fromRGBO(
                                                                        44,
                                                                        154,
                                                                        109,
                                                                        0.5),
                                                                  ],
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              )
                                                            : BoxDecoration(
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            253,
                                                                            0,
                                                                            0,
                                                                            0.2),
                                                                    //(x,y)
                                                                  ),
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              )
                                                        : BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        107,
                                                                        82,
                                                                        200,
                                                                        0.1),
                                                                //(x,y)
                                                              ),
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                    child: Text(
                                                      oAlphabet[i],
                                                      style: TextStyle(
                                                        color: !btnPressed
                                                            ? Color.fromRGBO(
                                                                107,
                                                                82,
                                                                200,
                                                                1.0)
                                                            : Colors.white,
                                                      ),
                                                    ),
                                                  )),
                                          ],
                                        ),

                                        // Here dumped code from bottom
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          PreviousQuesId();
                                          scrollToItem(queNum);
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
                                                    color: Color.fromRGBO(
                                                        107, 82, 200, 0.5),
                                                    offset: Offset(
                                                        1.0, 5.0), //(x,y)
                                                    blurRadius: 10.0,
                                                  ),
                                                ],
                                                gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Color.fromRGBO(
                                                        107, 82, 200, .4),
                                                    Color.fromRGBO(
                                                        107, 82, 200, .9),
                                                  ],
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              )
                                            : null,
                                        child: Icon(
                                          Icons.arrow_back_ios_new_rounded,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    btnPressed
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                btnPressed = !btnPressed;
                                                answered = !answered;
                                              });
                                            },
                                            child: Container(
                                              width: 140,
                                              margin: EdgeInsets.only(top: 10),
                                              padding: EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                  top: 20,
                                                  bottom: 20),
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
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Color.fromRGBO(
                                                        75, 93, 86, 0.3),
                                                    Color.fromRGBO(
                                                        75, 93, 86, 0.6),
                                                  ],
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "Hide Answer",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                btnPressed = !btnPressed;
                                                answered = !answered;
                                              });
                                            },
                                            child: Container(
                                              width: 140,
                                              margin: EdgeInsets.only(top: 10),
                                              padding: EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                  top: 20,
                                                  bottom: 20),
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color.fromRGBO(
                                                        107, 82, 200, 0.5),
                                                    offset: Offset(
                                                        1.0, 5.0), //(x,y)
                                                    blurRadius: 10.0,
                                                  ),
                                                ],
                                                gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Color.fromRGBO(
                                                        107, 82, 200, .4),
                                                    Color.fromRGBO(
                                                        107, 82, 200, .9),
                                                  ],
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "Show Answer",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          NextQuesId();
                                          scrollToItem(queNum);
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
                                                    color: Color.fromRGBO(
                                                        107, 82, 200, 0.5),
                                                    offset: Offset(
                                                        1.0, 5.0), //(x,y)
                                                    blurRadius: 10.0,
                                                  ),
                                                ],
                                                gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Color.fromRGBO(
                                                        107, 82, 200, .4),
                                                    Color.fromRGBO(
                                                        107, 82, 200, .9),
                                                  ],
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              )
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
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(107, 82, 200, .1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    height: deviceH,
                    width: deviceW,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.arrow_back_ios_new_rounded,
                                      color: Color.fromRGBO(107, 82, 200, 1.0),
                                    ),
                                  ),
                                  Text(
                                    "Quiz",
                                    style: TextStyle(
                                      color: Color.fromRGBO(107, 82, 200, 1.0),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: "Sophisto",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  )
                                ],
                              ),
                            ),
                            Center(
                                child: Container(
                                    child: LoadingAnimationWidget
                                        .staggeredDotsWave(
                                            color: Color.fromRGBO(
                                                107, 82, 200, 1.0),
                                            size: 60)))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
          future: getQuestions(),
        ),
      ),
    );
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
                  child: FutureBuilder<QuestionModel>(
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
                                          setQuesId(int.parse(snapshot.data!
                                              .resultList![index].questionID
                                              .toString()));
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                          scrollToItem(queNum);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          child: Text(
                                            snapshot.data!.resultList![index]
                                                    .questionID
                                                    .toString() +
                                                '. ' +
                                                snapshot.data!
                                                    .resultList![index].question
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
                                                107, 82, 200, .2),
                                            offset: Offset(1.0, 1.0), //(x,y)
                                            blurRadius: 5.0,
                                          ),
                                        ],
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color.fromRGBO(107, 82, 200, .4),
                                            Color.fromRGBO(107, 82, 200, .5),
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
                          return Center(
                              child: Container(
                                  child:
                                      LoadingAnimationWidget.staggeredDotsWave(
                                          color:
                                              Color.fromRGBO(107, 82, 200, 1.0),
                                          size: 60)));
                        }
                      },
                      future: getQuestions())),
            );
          },
        ),
      );

  late QuestionModel model;

  Future<QuestionModel> getQuestions() async {
    final response = await http.get(
        Uri.parse(
            "http://Api.aswdc.in/Api/LearnSQL/GetQuestion/GetQuestion/SQL"),
        headers: {"API_KEY": "1234"});
    var data = jsonDecode(response.body.toString());

    model = QuestionModel.fromJson(data);

    return model;
  }
// Future<QuestionModel> getQuestions() async {
//   QuestionModel model = QuestionModel();
//   await ApiExecutor().callApi(context, API_GET_QUESTION, true, true, null,
//       (value) {
//     model = QuestionModel.fromJson(jsonDecode(value));
//   }, true);
//   return model;
// }
}

/*ListView.builder(
                                            itemCount: 4,
                                            itemBuilder: (context, index) {
                                              return ;
                                            },
                                          )*/
// Column(
//   children: [
//     Container(
//       padding: EdgeInsets.only(
//           left: 20,
//           right: 20,
//           top: 20,
//           bottom: 20),
//       margin: EdgeInsets.only(
//           left: 35, right: 30),
//       width: deviceW,
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: Color.fromRGBO(
//                 44, 154, 109, 0.5),
//             offset: Offset(
//                 1.0, 5.0), //(x,y)
//             blurRadius: 10.0,
//           ),
//         ],
//         gradient: LinearGradient(
//           begin:
//               Alignment.topCenter,
//           end: Alignment
//               .bottomCenter,
//           colors: [
//             Color.fromRGBO(
//                 44, 154, 109, 0.5),
//             Color.fromRGBO(
//                 44, 154, 109, 0.5),
//           ],
//         ),
//         borderRadius:
//             BorderRadius.circular(
//                 20),
//       ),
//       child: Row(
//         mainAxisAlignment:
//             MainAxisAlignment
//                 .spaceBetween,
//         children: [
//           Flexible(
//             child: Text(
//               snapshot
//                   .data!
//                   .resultList![
//                       queNum]
//                   .optionA
//                   .toString(),
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           Icon(Icons.check_rounded,
//               color: Colors.white,
//               size: 30)
//         ],
//       ),
//     ),
//     Container(
//       padding: EdgeInsets.only(
//           left: 20,
//           right: 20,
//           top: 20,
//           bottom: 20),
//       margin: EdgeInsets.only(
//           left: 35,
//           right: 30,
//           top: 10),
//       width: deviceW,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin:
//               Alignment.topCenter,
//           end: Alignment
//               .bottomCenter,
//           colors: [
//             Color.fromRGBO(
//                 225, 220, 243, 1),
//             Color.fromRGBO(
//                 225, 220, 243, 1),
//           ],
//         ),
//         borderRadius:
//             BorderRadius.circular(
//                 20),
//       ),
//       child: Text(
//         snapshot
//             .data!
//             .resultList![queNum]
//             .optionB
//             .toString(),
//         style: TextStyle(
//           color: Color.fromRGBO(
//               107, 82, 200, 1.0),
//         ),
//       ),
//     ),
//     Container(
//       padding: EdgeInsets.only(
//           left: 20,
//           right: 20,
//           top: 20,
//           bottom: 20),
//       margin: EdgeInsets.only(
//           left: 35,
//           right: 30,
//           top: 10),
//       width: deviceW,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin:
//               Alignment.topCenter,
//           end: Alignment
//               .bottomCenter,
//           colors: [
//             Color.fromRGBO(
//                 225, 220, 243, 1),
//             Color.fromRGBO(
//                 225, 220, 243, 1),
//           ],
//         ),
//         borderRadius:
//             BorderRadius.circular(
//                 20),
//       ),
//       child: Text(
//         snapshot
//             .data!
//             .resultList![queNum]
//             .optionC
//             .toString(),
//         style: TextStyle(
//           color: Color.fromRGBO(
//               107, 82, 200, 1.0),
//         ),
//       ),
//     ),
//     Container(
//       padding: EdgeInsets.only(
//           left: 20,
//           right: 20,
//           top: 20,
//           bottom: 20),
//       margin: EdgeInsets.only(
//           left: 35,
//           right: 30,
//           top: 10),
//       width: deviceW,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin:
//               Alignment.topCenter,
//           end: Alignment
//               .bottomCenter,
//           colors: [
//             Color.fromRGBO(
//                 225, 220, 243, 1),
//             Color.fromRGBO(
//                 225, 220, 243, 1),
//           ],
//         ),
//         borderRadius:
//             BorderRadius.circular(
//                 20),
//       ),
//       child: Text(
//         snapshot
//             .data!
//             .resultList![queNum]
//             .optionD
//             .toString(),
//         style: TextStyle(
//           color: Color.fromRGBO(
//               107, 82, 200, 1.0),
//         ),
//       ),
//     ),
//   ],
// ),
