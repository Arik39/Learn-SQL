import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learnsql/Screens/Interview%20Question/SingleInterviewQuestion.dart';
import 'package:learnsql/model/interview_question/interview_question_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

late InterviewQuestionModel model_list_interview;
late int quesId;
late int quesLength;

PreviousQuesId() {
  if (quesId > 1) {
    quesId -= 1;
  }
  ishide = false;
}

NextQuesId() {
  if (quesId < quesLength) {
    quesId += 1;
  }
  ishide = false;
}

class InterviewList extends StatefulWidget {
  const InterviewList({Key? key}) : super(key: key);

  @override
  State<InterviewList> createState() => _InterviewListState();
}

class _InterviewListState extends State<InterviewList> {
  // List<String> ques = [
  //   "What is DBMS",
  //   "What is RDBMS",
  //   "What is SQL",
  //   "What is a Database",
  //   "What are tables and fields?",
  //   "What is a primary key",
  //   "What is difference between unique key and primary key?",
  //   "What is a foreign key?",
  //   "What is a join in SQL?",
  // ];
  int _count = 50;

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    deviceH = MediaQuery.of(context).size.height;
    deviceW = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(227, 224, 55, .1)),
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Color.fromRGBO(227, 224, 55, 1.0),
                          ),
                        ),
                        Text(
                          "Interview Questions",
                          style: TextStyle(
                            color: Color.fromRGBO(227, 224, 55, 1.0),
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Sophisto",
                          ),
                        ),
                        SizedBox()
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: FutureBuilder<InterviewQuestionModel>(
                        builder: (context, snapshot) {
                          if (snapshot.data != null) {
                            quesLength = snapshot.data!.resultList!.length;
                            return ListView.builder(
                                physics: BouncingScrollPhysics(),
                                controller: controller,
                                scrollDirection: Axis.vertical,
                                itemCount: snapshot.data!.resultList!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quesId = int.parse(snapshot
                                            .data!.resultList![index].queID
                                            .toString());
                                      });
                                      if (controller.position ==
                                          controller.position.maxScrollExtent) {
                                        print('end');
                                      }
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SingleInterViewQuestion()));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 20,
                                          left: 20,
                                          right: 20,
                                          bottom: 0),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromRGBO(
                                                227, 224, 55, 0.7),
                                            offset: Offset(1.0, 5.0), //(x,y)
                                            blurRadius: 10.0,
                                          ),
                                        ],
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color.fromRGBO(227, 224, 55, .2),
                                            Color.fromRGBO(227, 224, 55, .4),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      padding: EdgeInsets.only(
                                          top: 20,
                                          bottom: 20,
                                          left: 10,
                                          right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            snapshot
                                                .data!.resultList![index].queID
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.white),
                                          ),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          Flexible(
                                            child: Text(
                                              snapshot
                                                  .data!.resultList![index].que
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 16,
                                              ),
                                              overflow: TextOverflow.fade,
                                              maxLines: 1,
                                              softWrap: false,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          } else {
                            return Center(
                                child: Container(
                                    child: LoadingAnimationWidget
                                        .staggeredDotsWave(
                                            color: Colors.yellow, size: 60)));
                          }
                        },
                        future: getInterviewQuestion()),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<InterviewQuestionModel> getInterviewQuestion() async {
    final response = await http.get(
        Uri.parse(
            "http://Api.aswdc.in/Api/LearnSQL/GetIntrviewQuestion/GetIntrviewQuestion/SQL"),
        headers: {"API_KEY": "1234"});
    var data = jsonDecode(response.body.toString());

    model_list_interview = InterviewQuestionModel.fromJson(data);

    return model_list_interview;

    // InterviewQuestionByIdModel model = InterviewQuestionByIdModel();
    // await ApiExecutor().callApi(
    //     context, API_GET_INT_QUESTION_BY_ID, true, true, null, (value) {
    //   model = InterviewQuestionByIdModel.fromJson(jsonDecode(value));
    // }, true);
    //
    // return model;
  }
// Future<InterviewQuestionModel> getInterviewQuestion() async {
//   InterviewQuestionModel model = InterviewQuestionModel();
//   await ApiExecutor().callApi(context, API_GET_INT_QUESTION, true, true, null,
//       (value) {
//     model = InterviewQuestionModel.fromJson(jsonDecode(value));
//   }, true);
//
//   return model;
// }
}
