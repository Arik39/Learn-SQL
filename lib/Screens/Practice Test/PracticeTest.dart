import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learnsql/Screens/Individual%20Practice%20test/SinglePracticeTest.dart';
import 'package:learnsql/model/practice_test/model_SingleTest/SinglePracticeTestModel.dart';
import 'package:learnsql/model/practice_test/utils_Record/db_service.dart';
import 'package:learnsql/model/practice_test/utils_SingleTest/db_helper_single_test.dart';
import 'package:learnsql/model/practice_test/utils_SingleTest/db_service_single_test.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../model/practice_test/model_Record/practiceTestModel.dart';
import '../../model/question/question_model.dart';
import '../../model/question/result_list.dart';

late double deviceH;
late double deviceW;
late String testTableName;

class PracticeTest extends StatefulWidget {
  const PracticeTest({Key? key}) : super(key: key);

  @override
  State<PracticeTest> createState() => _PracticeTestState();
}

class _PracticeTestState extends State<PracticeTest> {
  bool isCheckedEasy = false;
  bool isCheckedMedium = false;
  bool isCheckedHard = false;
  int questionLevel = 0;
  List<QuestionList> lvlOne = [];
  List<QuestionList> lvlTwo = [];
  List<QuestionList> lvlThree = [];
  int noOfQuestion = 0;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _noOfQuestionController =
      new TextEditingController();

  DBServicePT dbService = DBServicePT();
  DBServiceSPT dbServiceSPT = DBServiceSPT();
  //Add Data
  late practiceTestModel addModel;
  late singlePracticeTestModel addSModel;

  singlePracticeTestModel deleteSModel = singlePracticeTestModel();
  bool isDisableButton = true;
  //View Data
  late List<practiceTestModel> nbView = [];
  // late List<singlePracticeTestModel> nbSingleCorrect = [];
  // late List<singlePracticeTestModel> nbSingleAttempted = [];
  late int index = -1;
  Future<void> get() async {
    nbView = await dbService.getPracTest();
  }

  // Future<void> get2() async {
  //   nbSingleCorrect = await dbServiceSPT.getIsCorrect('gsgs');
  // }
  //
  // Future<void> get3() async {
  //   nbSingleAttempted = await dbServiceSPT.getIsAttempted('gsgs');
  // }

  void initState() {
    getQuestions();
    get();
    addModel = practiceTestModel(
        incorrectAnswer: 0, correctAnswer: 0, attemptedQuestion: 0);
    // get2();
    addSModel = singlePracticeTestModel();
    // get3();
  }

  @override
  Widget build(BuildContext context) {
    deviceH = MediaQuery.of(context).size.height;
    deviceW = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: deviceH,
          width: deviceW,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(30.0),
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
                        color: Color.fromRGBO(13, 204, 179, 1.0),
                      ),
                    ),
                    Text(
                      "Practice Test",
                      style: TextStyle(
                        color: Color.fromRGBO(13, 204, 179, 1.0),
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
              Expanded(
                child: _fetchData(),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              openDialoage();
            });
          },
        ),
      ),
    );
  }

  _fetchData() {
    return FutureBuilder<List<practiceTestModel>>(
        future: dbService.getPracTest(),
        builder: (BuildContext context,
            AsyncSnapshot<List<practiceTestModel>> user) {
          if (user.hasData) {
            return _buildDataTable(user.data!);
          }
          return Center(
              child: Center(
                  child: Container(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                          color: Color.fromRGBO(13, 204, 179, 1.0),
                          size: 60))));
        });
  }

  _buildDataTable(List<practiceTestModel> user) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: (MediaQuery.of(context).size.height),
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: nbView.length,
          padding: EdgeInsets.only(bottom: 100),
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            this.index = index;

            return Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
              child: SizedBox(
                width: double.infinity,
                child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(13, 204, 179, 0.3),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(13, 204, 179, 0.6),
                          offset: Offset(1.0, 5.0), //(x,y)
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      splashColor: Colors.black54,
                      onTap: () {
                        queNum = 0;
                        pointNum = 1;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SinglePracticeTest(
                                      QuizQueID: int.parse(
                                              nbView[index].testId.toString()) +
                                          1,
                                      totalQuestion: int.parse(nbView[index]
                                          .totalQuestion
                                          .toString()),
                                      questionLevel: questionLevel,
                                      tableName: nbView[index].testName,
                                    ))).then((value) {
                          setState(() {
                            get();
                          });
                        });
                      },
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 10, top: 10),
                            child: Container(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext contex) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
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
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20))),
                                            child: Center(
                                              child: Text(
                                                "Delete",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          content: Text(
                                              "Do you want to delete this test ?"),
                                          actions: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      deleteSModel.TestName =
                                                          nbView[index]
                                                              .testName;

                                                      dbServiceSPT
                                                          .deletePracTestList(
                                                              deleteSModel);
                                                      dbService
                                                          .deletePracTestList(
                                                              nbView[index]);
                                                      Navigator.pop(context);
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                PracticeTest(),
                                                          ));
                                                    });
                                                  },
                                                  child: Text("Delete"),
                                                  style: ElevatedButton.styleFrom(
                                                      primary: Colors.redAccent,
                                                      shape:
                                                          RoundedRectangleBorder(
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
                                                      primary: Colors.blueGrey,
                                                      shape:
                                                          RoundedRectangleBorder(
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
                                child: Icon(
                                  Icons.delete_rounded,
                                  color: Colors.redAccent,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(right: 10, top: 10, bottom: 10),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(0),
                                  child: Text(
                                    nbView[index].testName.toString(),
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontFamily: 'Gilroy-Semibold',
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 120,
                                            child: CircularPercentIndicator(
                                                radius: 50,
                                                lineWidth: 15,
                                                animation: true,
                                                animationDuration: 1500,
                                                percent: (((nbView[index]
                                                        .attemptedQuestion!) /
                                                    (nbView[index]
                                                        .totalQuestion!
                                                        .toInt()))),
                                                // percent: (int.parse(
                                                //         nbSingleAttempted.length
                                                //             .toString()) /
                                                //     int.parse(nbView[index]
                                                //         .totalQuestion
                                                //         .toString())),
                                                circularStrokeCap:
                                                    CircularStrokeCap.round,
                                                center: Text(
                                                  /*     ((int.parse(nbSingleAttempted
                                                                      .length
                                                                      .toString()) /
                                                                  int.parse(nbView[
                                                                          index]
                                                                      .totalQuestion
                                                                      .toString())) *
                                                              100)
                                                          .toInt()
                                                          .toString() +*/

                                                  (((nbView[index].attemptedQuestion!) /
                                                                  (nbView[index]
                                                                      .totalQuestion!)) *
                                                              100)
                                                          .toStringAsFixed(1) +
                                                      " %",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w100,
                                                      fontFamily: "Sophisto"),
                                                ),
                                                progressColor: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 120,
                                        child: ListView(
                                          physics: BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Total Question : \t",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                        fontFamily:
                                                            'Gilroy-Light',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(
                                                      nbView[index]
                                                          .totalQuestion
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 0.6),
                                                        fontFamily:
                                                            'Gilroy-Light',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Attempted \t",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                        fontFamily:
                                                            'Gilroy-Light',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(
                                                      nbView[index]
                                                          .attemptedQuestion
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 0.6),
                                                        fontFamily:
                                                            'Gilroy-Light',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Correct : \t",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                        fontFamily:
                                                            'Gilroy-Light',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(
                                                      /*nbSingleCorrect.length
                                                          .toString()*/
                                                      nbView[index]
                                                          .correctAnswer
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 0.6),
                                                        fontFamily:
                                                            'Gilroy-Light',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Incorrect : \t",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                        fontFamily:
                                                            'Gilroy-Light',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(
                                                      /*(nbSingleAttempted
                                                                  .length -
                                                              nbSingleCorrect
                                                                  .length)
                                                          .toString()*/
                                                      nbView[index]
                                                          .incorrectAnswer
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 0.6),
                                                        fontFamily:
                                                            'Gilroy-Light',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Not Attempted : \t",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                        fontFamily:
                                                            'Gilroy-Light',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(
                                                      /*(nbView[index]
                                                                  .totalQuestion! -
                                                              nbSingleAttempted
                                                                  .length)
                                                          .toString()*/
                                                      nbView[index]
                                                          .notAttemptedQuestion
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 0.6),
                                                        fontFamily:
                                                            'Gilroy-Light',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                // Container(
                                //   margin: EdgeInsets.only(top: 10, left: 5),
                                //   child: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceEvenly,
                                //     children: [
                                //       ElevatedButton(
                                //         onPressed: () {},
                                //         child: Text("Review"),
                                //         style: ElevatedButton.styleFrom(
                                //           primary: Colors.orangeAccent,
                                //           shadowColor: Colors.black,
                                //           shape: RoundedRectangleBorder(
                                //               borderRadius:
                                //                   BorderRadius.circular(10)),
                                //         ),
                                //       ),
                                //       ElevatedButton(
                                //         onPressed: () {},
                                //         child: Text("Resume"),
                                //         style: ElevatedButton.styleFrom(
                                //           primary: Colors.green,
                                //           shadowColor: Colors.black,
                                //           shape: RoundedRectangleBorder(
                                //               borderRadius:
                                //                   BorderRadius.circular(10)),
                                //         ),
                                //       ),
                                //       ElevatedButton(
                                //         onPressed: () {},
                                //         child: Text("Retest"),
                                //         style: ElevatedButton.styleFrom(
                                //           primary: Colors.blueGrey,
                                //           shadowColor: Colors.black,
                                //           shape: RoundedRectangleBorder(
                                //               borderRadius:
                                //                   BorderRadius.circular(10)),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            );
          }),
    );
  }

  String? validationName(String? value) {
    if (value!.isEmpty || value == null) {
      return 'Enter Test Name';
    }

    for (int i = 0; i < nbView.length; i++) {
      if (value.compareTo(nbView[i].testName.toString()) == 0) {
        return 'Name of the test must be different';
      }
    }
  }

  String? validateNoOfQuestion(String? value) {
    if (value!.isEmpty || value == null) {
      return 'Enter No of Question(s)';
    }

    int totalQues = 0;

    if (isCheckedEasy) {
      totalQues = totalQues + lvlOne.length;
      print(totalQues);
    }
    if (isCheckedMedium) {
      totalQues = totalQues + lvlTwo.length;
      print(totalQues);
    }
    if (isCheckedHard) {
      totalQues = totalQues + lvlThree.length;
      print(totalQues);
    }

    if (totalQues == 0) {
      return 'Please Select the level';
    }
    if (int.parse(value) > totalQues) {
      return 'Enter between 0 and $totalQues';
    }
  }

  openDialoage() => showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              actions: [
                Container(
                  margin: EdgeInsets.only(right: 50, top: 0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isCheckedEasy = false;
                        isCheckedMedium = false;
                        isCheckedHard = false;
                        _nameController.text = "";
                        _noOfQuestionController.text = "";

                        Navigator.pop(context);
                      });
                    },
                    child: Text("Cancel"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                      shadowColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _submit();
                  },
                  child: Text("Generate Test"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    shadowColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              titlePadding:
                  EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 0),
              title: Container(
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Center(
                  child: Text(
                    "Generate Practice Test",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              contentPadding:
                  EdgeInsets.only(bottom: 10, top: 25, right: 25, left: 25),
              content: Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        validator: validationName,
                        decoration: InputDecoration(
                          isDense: true,
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.redAccent,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Test Name',
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.redAccent,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Colors.black,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black12,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: const Icon(
                            Icons.edit,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                        onChanged: (value) {
                          addModel.testName = value;
                          testTableName = value;
                        },
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 15, bottom: 5),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Select level",
                            style: TextStyle(fontSize: 13),
                          )),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 24.0,
                                  width: 24.0,
                                  child: Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    value: isCheckedEasy,
                                    onChanged: (bool? value) {
                                      if (isCheckedEasy) {
                                        questionLevel = 1;
                                        addModel.levelEasy = 1;
                                      } else {
                                        addModel.levelEasy = 0;
                                      }

                                      setState(() {
                                        isCheckedEasy = value!;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  "Easy",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 24.0,
                                  width: 24.0,
                                  child: Checkbox(
                                    activeColor: Colors.yellow,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    checkColor: Colors.white,
                                    value: isCheckedMedium,
                                    onChanged: (bool? value) {
                                      if (isCheckedMedium) {
                                        addModel.levelMedium = 1;
                                        questionLevel = 2;
                                      } else {
                                        addModel.levelMedium = 0;
                                      }

                                      setState(() {
                                        isCheckedMedium = value!;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  "Medium",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 24.0,
                                  width: 24.0,
                                  child: Checkbox(
                                    activeColor: Colors.redAccent,
                                    checkColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    value: isCheckedHard,
                                    onChanged: (bool? value) {
                                      if (isCheckedHard) {
                                        addModel.levelHard = 1;
                                        questionLevel = 3;
                                      } else {
                                        addModel.levelHard = 0;
                                      }

                                      setState(() {
                                        isCheckedHard = value!;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  "Hard",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        controller: _noOfQuestionController,
                        validator: validateNoOfQuestion,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          isDense: true,
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.redAccent,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.redAccent,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Number of Question(s)',
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Colors.black,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black12,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: const Icon(
                            Icons.question_answer_rounded,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                        onChanged: (value) {
                          addModel.totalQuestion = int.parse(value);
                          addModel.notAttemptedQuestion = int.parse(value);
                          noOfQuestion = int.parse(value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );

  void _submit() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        dbService.addPracTestList(addModel);
        GenerateQuestionList(
            totalQuestion: noOfQuestion,
            isEasy: isCheckedEasy,
            isMedium: isCheckedMedium,
            isHard: isCheckedHard);
      });
      Navigator.pop(context);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PracticeTest(),
          ));
    }
  }

  late QuestionModel model;
  late QuestionModel filter;
  Future<void> GenerateQuestionList(
      {required int totalQuestion,
      required bool isEasy,
      required bool isMedium,
      required bool isHard}) async {
    List<QuestionList> tempEasy = lvlOne;
    List<QuestionList> tempMedium = lvlTwo;
    List<QuestionList> tempHard = lvlThree;
    List<QuestionList> result = [];
    List<QuestionList> temp = [];
    if (isEasy) {
      tempEasy.shuffle();
      temp.addAll(tempEasy);
      addModel.levelEasy = 1;
    }
    if (isMedium) {
      tempMedium.shuffle();
      temp.addAll(tempMedium);
      addModel.levelMedium = 1;
    }
    if (isHard) {
      tempHard.shuffle();
      temp.addAll(tempHard);
      addModel.levelHard = 1;
    }
    temp.shuffle();
    for (int i = 0; i < totalQuestion; i++) {
      result.add(temp[i]);
    }

    for (int i = 0; i < totalQuestion; i++) {
      DBhelperSPT.tableName = testTableName;
      addSModel.QuizQue = result[i].question;
      addSModel.QuizAns = result[i].trueOption;
      addSModel.QuizA = result[i].optionA;
      addSModel.QuizB = result[i].optionB;
      addSModel.QuizC = result[i].optionC;
      addSModel.QuizD = result[i].optionD;
      addSModel.TestName = testTableName;
      addSModel.isCorrect = 0;
      addSModel.isAttempted = 0;
      addSModel.isAttempted = 0;
      addSModel.Difficulty = result[i].levelID.toString();
      addSModel.QuizQueID = (index != -1 ? (nbView[index].testId!) : 0 + 1);
      await dbServiceSPT.addPracTestList(addSModel);
    }
  }

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
  }
}
