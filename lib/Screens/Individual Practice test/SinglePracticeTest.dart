import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learnsql/model/practice_test/model_SingleTest/SinglePracticeTestModel.dart';
import 'package:learnsql/model/practice_test/utils_Record/db_service.dart';
import 'package:learnsql/model/practice_test/utils_SingleTest/db_service_single_test.dart';
import 'package:learnsql/model/question/question_model.dart';
import 'package:learnsql/model/question/result_list.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

late double deviceH;
late double deviceW;
int queNum = 0;
int pointNum = 1;

class SinglePracticeTest extends StatefulWidget {
  final int QuizQueID;
  final int totalQuestion;
  final int? attemptedQuestion;
  final int? correctAnswer;
  final int? questionLevel;
  final String? tableName;

  SinglePracticeTest(
      {Key? key,
      required this.QuizQueID,
      required this.totalQuestion,
      this.attemptedQuestion,
      this.correctAnswer,
      this.questionLevel,
      this.tableName})
      : super(key: key) {
    // print('TestId: ' +
    //     testId.toString() +
    //     ' TotalQuestion: ' +
    //     totalQuestion.toString() +
    //     ' Easy: ' +
    //     questionLevel.toString());
  }

  @override
  State<SinglePracticeTest> createState() => _SinglePracticeTestState();
}

class _SinglePracticeTestState extends State<SinglePracticeTest> {
  bool nextOver = false;
  bool previousOver = false;
  bool btnPressedA = false;
  bool btnPressedB = false;
  bool btnPressedC = false;
  bool btnPressedD = false;

  bool ishide = false;
  bool answered = false;
  int score = 0;
  List<QuestionList> lvlOne = [];
  List<QuestionList> lvlTwo = [];
  List<QuestionList> lvlThree = [];
  List<String> alphabet = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];
  DBServiceSPT dbServiceSPT = DBServiceSPT();
  DBServicePT dbService = DBServicePT();
  List<singlePracticeTestModel> nb = [];
  setQuesId(int a) {
    setState(() {
      queNum = a - 1;
      pointNum = a;
    });
  }

  void get() async {
    nb = await dbServiceSPT.getPracTest(widget.tableName.toString());

    setState(() {
      if (nb[queNum].selectedAns == null) {
        btnPressedA = false;
        btnPressedB = false;
        btnPressedC = false;
        btnPressedD = false;
      }

      if (nb[queNum].selectedAns == 'A') {
        btnPressedA = true;
        print('A');
      }

      if (nb[queNum].selectedAns == 'B') {
        btnPressedB = true;
        print('B');
      }
      if (nb[queNum].selectedAns == 'C') {
        btnPressedC = true;
        print('C');
      }
      if (nb[queNum].selectedAns == 'D') {
        btnPressedD = true;
        print('D');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    deviceH = MediaQuery.of(context).size.height;
    deviceW = MediaQuery.of(context).size.width;
    PreviousQuesId() {
      setState(() {
        if (queNum > 0) {
          queNum -= 1;
          pointNum -= 1;
          nextOver = false;
          btnPressedA = false;
          answered = false;
          btnPressedB = false;
          btnPressedC = false;
          btnPressedD = false;
        } else {
          previousOver = true;
        }

        if (nb[queNum].selectedAns == null) {
          btnPressedA = false;
          btnPressedB = false;
          btnPressedC = false;
          btnPressedD = false;
        }

        if (nb[queNum].selectedAns == 'A') {
          btnPressedA = true;
          print('A');
        }

        if (nb[queNum].selectedAns == 'B') {
          btnPressedB = true;
          print('B');
        }
        if (nb[queNum].selectedAns == 'C') {
          btnPressedC = true;
          print('C');
        }
        if (nb[queNum].selectedAns == 'D') {
          btnPressedD = true;
          print('C');
        }
      });
    }

    NextQuesId() {
      setState(() {
        if (queNum < nb.length - 1) {
          queNum += 1;
          pointNum += 1;
          previousOver = false;
          btnPressedA = false;
          btnPressedB = false;
          btnPressedC = false;
          btnPressedD = false;
          answered = false;
        } else {
          nextOver = true;
        }

        if (nb[queNum].selectedAns == null) {
          btnPressedA = false;
          btnPressedB = false;
          btnPressedC = false;
          btnPressedD = false;
        }

        if (nb[queNum].selectedAns == 'A') {
          btnPressedA = true;
          print('A');
        }

        if (nb[queNum].selectedAns == 'B') {
          btnPressedB = true;
          print('B');
        }
        if (nb[queNum].selectedAns == 'C') {
          btnPressedC = true;
          print('C');
        }
        if (nb[queNum].selectedAns == 'D') {
          btnPressedD = true;
          print('C');
        }
      });
    }

    return WillPopScope(
      onWillPop: () async {
        showDialog(
            context: context,
            builder: (BuildContext contex) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                titlePadding:
                    EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 0),
                contentPadding:
                    EdgeInsets.only(bottom: 10, top: 25, right: 25, left: 25),
                title: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Center(
                    child: Text(
                      "Exit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                content: Text("Are you sure you want to exit the test ?"),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          List<singlePracticeTestModel> a = await dbServiceSPT
                              .getIsAttempted(widget.tableName.toString());

                          List<singlePracticeTestModel> b = await dbServiceSPT
                              .getIsCorrect(widget.tableName.toString());

                          int attempted = a.length;
                          int notAttempted = widget.totalQuestion - attempted;
                          int correct = b.length;
                          int inCorrect = attempted - correct;

                          dbService.updatePracTestList2(widget.QuizQueID - 1,
                              correct, attempted, notAttempted, inCorrect);

                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text("Exit"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            Navigator.of(context).pop();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text("No"),
                      )
                    ],
                  )
                ],
              );
            });

        return await true;
      },
      child: SafeArea(
        child: Scaffold(
          body: FutureBuilder<QuestionModel>(
            builder: (context, snapshot) {
              if (snapshot.data != null && snapshot.data!.isResult == 1) {
                List<String> oAlphabet = [
                  nb[queNum].QuizA.toString(),
                  nb[queNum].QuizB.toString(),
                  nb[queNum].QuizC.toString(),
                  nb[queNum].QuizD.toString(),
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
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 55,
                                  ),
                                  Text(
                                    "Practice Test",
                                    style: TextStyle(
                                      color: Color.fromRGBO(107, 82, 200, 1.0),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: "Sophisto",
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext contex) {
                                            return AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              titlePadding: EdgeInsets.only(
                                                  left: 0,
                                                  right: 0,
                                                  bottom: 0,
                                                  top: 0),
                                              contentPadding: EdgeInsets.only(
                                                  bottom: 10,
                                                  top: 25,
                                                  right: 25,
                                                  left: 25),
                                              title: Container(
                                                height: 45,
                                                decoration: BoxDecoration(
                                                    color: Colors.lightBlue,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(20),
                                                            topRight:
                                                                Radius.circular(
                                                                    20))),
                                                child: Center(
                                                  child: Text(
                                                    "Exit",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                              content: Text(
                                                  "Are you sure you want to exit the test"),
                                              actions: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () async {
                                                        List<singlePracticeTestModel>
                                                            a =
                                                            await dbServiceSPT
                                                                .getIsAttempted(widget
                                                                    .tableName
                                                                    .toString());

                                                        List<singlePracticeTestModel>
                                                            b =
                                                            await dbServiceSPT
                                                                .getIsCorrect(widget
                                                                    .tableName
                                                                    .toString());

                                                        int attempted =
                                                            a.length;
                                                        int notAttempted = widget
                                                                .totalQuestion -
                                                            attempted;
                                                        int correct = b.length;
                                                        int inCorrect =
                                                            attempted - correct;

                                                        dbService
                                                            .updatePracTestList2(
                                                                widget.QuizQueID -
                                                                    1,
                                                                correct,
                                                                attempted,
                                                                notAttempted,
                                                                inCorrect);

                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Exit"),
                                                      style: ElevatedButton.styleFrom(
                                                          primary:
                                                              Colors.redAccent,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10))),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          Navigator.of(context)
                                                              .pop();
                                                        });
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                          primary:
                                                              Colors.blueGrey,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10))),
                                                      child: Text("No"),
                                                    )
                                                  ],
                                                )
                                              ],
                                            );
                                          });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromRGBO(
                                                107, 82, 200, 0.5),
                                            offset: Offset(1.0, 5.0), //(x,y)
                                            blurRadius: 10.0,
                                          ),
                                        ],
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color.fromRGBO(107, 82, 200, .4),
                                            Color.fromRGBO(107, 82, 200, .9),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Exit",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Sophisto",
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.exit_to_app_rounded,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 15,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 5),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 20,
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
                                      child: SingleChildScrollView(
                                        physics: BouncingScrollPhysics(),
                                        child: Center(
                                          child: Container(
                                            padding:
                                                EdgeInsets.only(bottom: 30),
                                            child: Column(
                                              children: [
                                                Container(
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
                                                  width: deviceW,
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
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                        Color.fromRGBO(
                                                            107, 82, 200, .4),
                                                        Color.fromRGBO(
                                                            107, 82, 200, .9),
                                                      ],
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Text(
                                                    '$pointNum. ' +
                                                        nb[queNum]
                                                            .QuizQue
                                                            .toString(),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),

                                                Column(
                                                  children: [
                                                    GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            btnPressedA = true;
                                                            btnPressedB = false;
                                                            btnPressedC = false;
                                                            btnPressedD = false;

                                                            dbServiceSPT
                                                                .updateSelectedAns(
                                                                    'A',
                                                                    nb[queNum]
                                                                        .TestID,
                                                                    widget
                                                                        .tableName
                                                                        .toString());
                                                            dbServiceSPT.updateAttempted(
                                                                1,
                                                                widget
                                                                    .QuizQueID,
                                                                nb[queNum]
                                                                    .TestID,
                                                                widget.tableName
                                                                    .toString());
                                                            //Score
                                                            if (nb[queNum]
                                                                    .QuizAns ==
                                                                'A') {
                                                              dbServiceSPT.updateScore(
                                                                  1,
                                                                  widget
                                                                      .QuizQueID,
                                                                  nb[queNum]
                                                                      .TestID,
                                                                  widget
                                                                      .tableName
                                                                      .toString());
                                                            } else {
                                                              dbServiceSPT.updateScore(
                                                                  0,
                                                                  widget
                                                                      .QuizQueID,
                                                                  nb[queNum]
                                                                      .TestID,
                                                                  widget
                                                                      .tableName
                                                                      .toString());
                                                            }
                                                          });
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 20,
                                                                  right: 20,
                                                                  top: 20,
                                                                  bottom: 20),
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 35,
                                                                  right: 30,
                                                                  top: 10),
                                                          width: deviceW,
                                                          decoration: BoxDecoration(
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
                                                              border: btnPressedA
                                                                  ? Border.all(
                                                                      color: Color.fromRGBO(
                                                                          107,
                                                                          82,
                                                                          200,
                                                                          1.0),
                                                                      width:
                                                                          1.5)
                                                                  : null),
                                                          child: Text(
                                                            oAlphabet[0],
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        107,
                                                                        82,
                                                                        200,
                                                                        1.0)),
                                                          ),
                                                        )),
                                                    GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            btnPressedA = false;
                                                            btnPressedB = true;
                                                            btnPressedC = false;
                                                            btnPressedD = false;

                                                            dbServiceSPT
                                                                .updateSelectedAns(
                                                                    'B',
                                                                    nb[queNum]
                                                                        .TestID,
                                                                    widget
                                                                        .tableName
                                                                        .toString());
                                                            dbServiceSPT.updateAttempted(
                                                                1,
                                                                widget
                                                                    .QuizQueID,
                                                                nb[queNum]
                                                                    .TestID,
                                                                widget.tableName
                                                                    .toString());
                                                            //Score
                                                            if (nb[queNum]
                                                                    .QuizAns ==
                                                                'B') {
                                                              dbServiceSPT.updateScore(
                                                                  1,
                                                                  widget
                                                                      .QuizQueID,
                                                                  nb[queNum]
                                                                      .TestID,
                                                                  widget
                                                                      .tableName
                                                                      .toString());
                                                            } else {
                                                              dbServiceSPT.updateScore(
                                                                  0,
                                                                  widget
                                                                      .QuizQueID,
                                                                  nb[queNum]
                                                                      .TestID,
                                                                  widget
                                                                      .tableName
                                                                      .toString());
                                                            }
                                                          });
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 20,
                                                                  right: 20,
                                                                  top: 20,
                                                                  bottom: 20),
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 35,
                                                                  right: 30,
                                                                  top: 10),
                                                          width: deviceW,
                                                          decoration: BoxDecoration(
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
                                                              border: btnPressedB
                                                                  ? Border.all(
                                                                      color: Color.fromRGBO(
                                                                          107,
                                                                          82,
                                                                          200,
                                                                          1.0),
                                                                      width:
                                                                          1.5)
                                                                  : null),
                                                          child: Text(
                                                            oAlphabet[1],
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        107,
                                                                        82,
                                                                        200,
                                                                        1.0)),
                                                          ),
                                                        )),
                                                    GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            btnPressedA = false;
                                                            btnPressedB = false;
                                                            btnPressedC = true;
                                                            btnPressedD = false;
                                                            dbServiceSPT
                                                                .updateSelectedAns(
                                                                    'C',
                                                                    nb[queNum]
                                                                        .TestID,
                                                                    widget
                                                                        .tableName
                                                                        .toString());
                                                            dbServiceSPT.updateAttempted(
                                                                1,
                                                                widget
                                                                    .QuizQueID,
                                                                nb[queNum]
                                                                    .TestID,
                                                                widget.tableName
                                                                    .toString());
                                                            //Score
                                                            if (nb[queNum]
                                                                    .QuizAns ==
                                                                'C') {
                                                              dbServiceSPT.updateScore(
                                                                  1,
                                                                  widget
                                                                      .QuizQueID,
                                                                  nb[queNum]
                                                                      .TestID,
                                                                  widget
                                                                      .tableName
                                                                      .toString());
                                                            } else {
                                                              dbServiceSPT.updateScore(
                                                                  0,
                                                                  widget
                                                                      .QuizQueID,
                                                                  nb[queNum]
                                                                      .TestID,
                                                                  widget
                                                                      .tableName
                                                                      .toString());
                                                            }
                                                          });
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 20,
                                                                  right: 20,
                                                                  top: 20,
                                                                  bottom: 20),
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 35,
                                                                  right: 30,
                                                                  top: 10),
                                                          width: deviceW,
                                                          decoration: BoxDecoration(
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
                                                              border: btnPressedC
                                                                  ? Border.all(
                                                                      color: Color.fromRGBO(
                                                                          107,
                                                                          82,
                                                                          200,
                                                                          1.0),
                                                                      width:
                                                                          1.5)
                                                                  : null),
                                                          child: Text(
                                                            oAlphabet[2],
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        107,
                                                                        82,
                                                                        200,
                                                                        1.0)),
                                                          ),
                                                        )),
                                                    GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            btnPressedA = false;
                                                            btnPressedB = false;
                                                            btnPressedC = false;
                                                            btnPressedD = true;

                                                            dbServiceSPT
                                                                .updateSelectedAns(
                                                                    'D',
                                                                    nb[queNum]
                                                                        .TestID,
                                                                    widget
                                                                        .tableName
                                                                        .toString());

                                                            //Attempted or not
                                                            dbServiceSPT.updateAttempted(
                                                                1,
                                                                widget
                                                                    .QuizQueID,
                                                                nb[queNum]
                                                                    .TestID,
                                                                widget.tableName
                                                                    .toString());
                                                            //Score
                                                            if (nb[queNum]
                                                                    .QuizAns ==
                                                                'D') {
                                                              dbServiceSPT.updateScore(
                                                                  1,
                                                                  widget
                                                                      .QuizQueID,
                                                                  nb[queNum]
                                                                      .TestID,
                                                                  widget
                                                                      .tableName
                                                                      .toString());
                                                            } else {
                                                              dbServiceSPT.updateScore(
                                                                  0,
                                                                  widget
                                                                      .QuizQueID,
                                                                  nb[queNum]
                                                                      .TestID,
                                                                  widget
                                                                      .tableName
                                                                      .toString());
                                                            }
                                                          });
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 20,
                                                                  right: 20,
                                                                  top: 20,
                                                                  bottom: 20),
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 35,
                                                                  right: 30,
                                                                  top: 10),
                                                          width: deviceW,
                                                          decoration: BoxDecoration(
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
                                                              border: btnPressedD
                                                                  ? Border.all(
                                                                      color: Color.fromRGBO(
                                                                          107,
                                                                          82,
                                                                          200,
                                                                          1.0),
                                                                      width:
                                                                          1.5)
                                                                  : null),
                                                          child: Text(
                                                            oAlphabet[3],
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        107,
                                                                        82,
                                                                        200,
                                                                        1.0)),
                                                          ),
                                                        )),

                                                    // child: Container(
                                                    //   padding: EdgeInsets.only(
                                                    //       left: 20,
                                                    //       right: 20,
                                                    //       top: 20,
                                                    //       bottom: 20),
                                                    //   margin: EdgeInsets.only(
                                                    //       left: 35,
                                                    //       right: 30,
                                                    //       top: 10),
                                                    //   width: deviceW,
                                                    //   decoration: btnPressed
                                                    //       ? nb[queNum]
                                                    //                   .QuizAns
                                                    //                   .toString() ==
                                                    //               alphabet[i]
                                                    //           ? BoxDecoration(
                                                    //               boxShadow: [
                                                    //                 BoxShadow(
                                                    //                   color: Color.fromRGBO(
                                                    //                       44,
                                                    //                       154,
                                                    //                       109,
                                                    //                       0.5),
                                                    //                   offset: Offset(
                                                    //                       1.0,
                                                    //                       5.0), //(x,y)
                                                    //                   blurRadius:
                                                    //                       10.0,
                                                    //                 ),
                                                    //               ],
                                                    //               gradient:
                                                    //                   LinearGradient(
                                                    //                 begin: Alignment
                                                    //                     .topCenter,
                                                    //                 end: Alignment
                                                    //                     .bottomCenter,
                                                    //                 colors: [
                                                    //                   Color.fromRGBO(
                                                    //                       44,
                                                    //                       154,
                                                    //                       109,
                                                    //                       0.5),
                                                    //                   Color.fromRGBO(
                                                    //                       44,
                                                    //                       154,
                                                    //                       109,
                                                    //                       0.5),
                                                    //                 ],
                                                    //               ),
                                                    //               borderRadius:
                                                    //                   BorderRadius
                                                    //                       .circular(
                                                    //                           20),
                                                    //             )
                                                    //           : BoxDecoration(
                                                    //               boxShadow: [
                                                    //                 BoxShadow(
                                                    //                   color: Color
                                                    //                       .fromRGBO(
                                                    //                           253,
                                                    //                           0,
                                                    //                           0,
                                                    //                           0.2),
                                                    //                   //(x,y)
                                                    //                 ),
                                                    //               ],
                                                    //               borderRadius:
                                                    //                   BorderRadius
                                                    //                       .circular(
                                                    //                           20),
                                                    //             )
                                                    //       : BoxDecoration(
                                                    //           boxShadow: [
                                                    //             BoxShadow(
                                                    //               color: Color
                                                    //                   .fromRGBO(
                                                    //                       107,
                                                    //                       82,
                                                    //                       200,
                                                    //                       0.1),
                                                    //               //(x,y)
                                                    //             ),
                                                    //           ],
                                                    //           borderRadius:
                                                    //               BorderRadius
                                                    //                   .circular(
                                                    //                       20),
                                                    //         ),
                                                    //   child: Text(
                                                    //     oAlphabet[i],
                                                    //     style: TextStyle(
                                                    //       color: !btnPressed
                                                    //           ? Color.fromRGBO(
                                                    //               107,
                                                    //               82,
                                                    //               200,
                                                    //               1.0)
                                                    //           : Colors.white,
                                                    //     ),
                                                    //   ),
                                                    // )),
                                                  ],
                                                ),

                                                // Here dumped code from bottom
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //Navigation Button
                                  Expanded(
                                    flex: 4,
                                    child: Center(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 15, right: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  PreviousQuesId();
                                                });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: !previousOver
                                                    ? BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Color.fromRGBO(
                                                                    107,
                                                                    82,
                                                                    200,
                                                                    0.5),
                                                            offset: Offset(1.0,
                                                                5.0), //(x,y)
                                                            blurRadius: 10.0,
                                                          ),
                                                        ],
                                                        gradient:
                                                            LinearGradient(
                                                          begin: Alignment
                                                              .topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                          colors: [
                                                            Color.fromRGBO(107,
                                                                82, 200, .4),
                                                            Color.fromRGBO(107,
                                                                82, 200, .9),
                                                          ],
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      )
                                                    : null,
                                                child: Icon(
                                                  Icons
                                                      .arrow_back_ios_new_rounded,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  NextQuesId();
                                                });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: !nextOver
                                                    ? BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Color.fromRGBO(
                                                                    107,
                                                                    82,
                                                                    200,
                                                                    0.5),
                                                            offset: Offset(1.0,
                                                                5.0), //(x,y)
                                                            blurRadius: 10.0,
                                                          ),
                                                        ],
                                                        gradient:
                                                            LinearGradient(
                                                          begin: Alignment
                                                              .topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                          colors: [
                                                            Color.fromRGBO(107,
                                                                82, 200, .4),
                                                            Color.fromRGBO(107,
                                                                82, 200, .9),
                                                          ],
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      )
                                                    : null,
                                                child: Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: Colors.white,
                                                ),
                                              ),
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
                                    SizedBox(
                                      height: 25,
                                      width: 25,
                                    ),
                                    Text(
                                      "Practice Test",
                                      style: TextStyle(
                                        color:
                                            Color.fromRGBO(107, 82, 200, 1.0),
                                        fontSize: 30,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: "Sophisto",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                      width: 25,
                                    ),
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
      ),
    );
  }

  late QuestionModel model;
  late QuestionModel filter;

  Future<QuestionModel> getQuestions() async {
    final response = await http.get(
        Uri.parse(
            "http://Api.aswdc.in/Api/LearnSQL/GetQuestion/GetQuestion/SQL"),
        headers: {"API_KEY": "1234"});

    var data = jsonDecode(response.body.toString());

    model = QuestionModel.fromJson(data);

    filterData(model);
    return model;
  }

  // List<Abc> easy = [];
  //List<Abc> approvedEasyList = [];

  void filterData(QuestionModel model) {
    //int prevId = 0;
    // Abc temp;
    List<QuestionList> tempList = [];

    tempList.addAll(model.resultList!);
    tempList
        .sort((a, b) => a.levelID.toString().compareTo(b.levelID.toString()));
    for (int i = 0; i < model.resultList!.length; i++) {
      if (tempList[i].levelID == 1) {
        lvlOne.add(tempList[i]);
      }
      if (tempList[i].levelID == 2) {
        lvlTwo.add(tempList[i]);
      }
      if (tempList[i].levelID == 3) {
        lvlThree.add(tempList[i]);
      }
    }
    GenerateQuestionList(totalQuestion: 20, isEasy: 1, isHard: 1, isMedium: 1);
  }

  void GenerateQuestionList(
      {required int totalQuestion,
      required int isEasy,
      required int isMedium,
      required int isHard}) {
    List<QuestionList> tempEasy = lvlOne;
    List<QuestionList> tempMedium = lvlTwo;
    List<QuestionList> tempHard = lvlThree;
    List<QuestionList> result = [];
    List<QuestionList> temp = [];
    if (isEasy == 1) {
      tempEasy.shuffle();
      temp.addAll(tempEasy);
    }
    if (isMedium == 1) {
      tempMedium.shuffle();
      temp.addAll(tempMedium);
    }
    if (isHard == 1) {
      tempHard.shuffle();
      temp.addAll(tempHard);
    }
    temp.shuffle();
    for (int i = 0; i < totalQuestion; i++) {
      result.add(temp[i]);
      // print(result[i].levelID);
    }

    // print(result.length);
  }

  // List<Abc> medium = [];
  // List<Abc> approvedMediumList = [];
  // void filterMediumData(QuestionModel model) {
  //   int prevId = 0;
  //   Abc temp;
  //   List<QuestionList> lvlOne = [];
  //   lvlOne.addAll(model.resultList!);
  //   lvlOne.sort((a, b) => a.levelID.toString().compareTo(b.levelID.toString()));
  //   for (int i = 0; i < lvlOne.length; i++) {
  //     if (prevId == lvlOne[i].levelID && lvlOne[i].levelID == 2) {
  //       medium[medium.length - 1].easyList!.add(lvlOne[i]);
  //     } else {
  //       prevId = lvlOne[i].levelID!;
  //       temp = Abc();
  //       temp.easyList = [];
  //       temp.easyList!.add(lvlOne[i]);
  //       approvedMediumList.add(temp);
  //     }
  //     print(
  //         'DEBUD:${approvedMediumList[i].easyList![i].levelID}::${approvedMediumList[i].easyList![i].question}');
  //   }
  // }
  //
  // List<Abc> hard = [];
  // List<Abc> approvedHardList = [];
  // void filterHardData(QuestionModel model) {
  //   int prevId = 0;
  //   Abc temp;
  //   List<QuestionList> lvlOne = [];
  //   lvlOne.addAll(model.resultList!);
  //   lvlOne.sort((a, b) => a.levelID.toString().compareTo(b.levelID.toString()));
  //   for (int i = 0; i < lvlOne.length; i++) {
  //     if (prevId == lvlOne[i].levelID && lvlOne[i].levelID == 3) {
  //       hard[hard.length - 1].easyList!.add(lvlOne[i]);
  //     } else {
  //       prevId = lvlOne[i].levelID!;
  //       temp = Abc();
  //       temp.easyList = [];
  //       temp.easyList!.add(lvlOne[i]);
  //       approvedHardList.add(temp);
  //     }
  //     print(
  //         'DEBUD:${approvedHardList[i].easyList![i].levelID}::${approvedHardList[i].easyList![i].question}');
  //   }
  // }
  //
  // void printList() {
  //   print('Easy ::::' + approvedEasyList.toString());
  //   print('Medium ::::' + approvedMediumList.toString());
  //   print('Hard ::::' + approvedHardList.toString());
  // }
}
//
// class Abc {
//   List<QuestionList>? easyList = [];
//   List<QuestionList>? approvedList = [];
//
//   Abc({
//     List<QuestionList>? approvedList,
//   }) {
//     this.easyList = approvedList;
//   }
// }

// void normaliseApprovedDetail(LeaveApplicationModel model) {
//   String? previousDate = "";
//   LeaveApplicationApprovedModel semModel;
//   List<LeaveApplicationListItem> attendanceDetailList = [];
//   attendanceDetailList.addAll(model.resultList!);
//   attendanceDetailList.sort((a, b) => DateTime.parse(b.fromDate.toString())
//       .compareTo(DateTime.parse(a.fromDate.toString())));
//   for (int i = 0; i < attendanceDetailList.length; i++) {
//     if (previousDate ==
//             DateTime.parse(attendanceDetailList[i].fromDate.toString())
//                 .formatDate() &&
//         attendanceDetailList[i].statusMessage.toString().toLowerCase() ==
//             "approved") {
//       approvedList[approvedList.length - 1]
//           .approvedList!
//           .add(attendanceDetailList[i]);
//     } else {
//       if (attendanceDetailList[i].statusMessage.toString().toLowerCase() ==
//           "approved") {
//         previousDate =
//             DateTime.parse(attendanceDetailList[i].fromDate.toString())
//                 .formatDate();
//         semModel = LeaveApplicationApprovedModel();
//         semModel.month = attendanceDetailList[i].fromDate;
//         semModel.approvedList = [];
//         semModel.approvedList!.add(attendanceDetailList[i]);
//         approvedList.add(semModel);
//       }
//     }
//   }
// }
