import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learnsql/model/topicHeadings/topic_headings.dart';
import 'package:learnsql/model/topic_name/topic_name_model.dart';

import '../Chapters/Chapter.dart';
import '../Chapters/Chapters_list.dart';
import '../DashBoard/DashBoard.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var tempTopicName = ["Basic Terms"];

  var temp4 = [
    {1: 2}
  ];
  List<String> categoryNameList = <String>["Basic Terms"];
  List<String> tempCNList = <String>[];
  Map<String, Map<int, int>> temp = {};
  TextEditingController myController = TextEditingController();
  bool isLoading = false;

  int ToInteger(String a) {
    int b = int.parse(a);
    return b;
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 7; i++) {
      getTopicHeadings(i);
    }
    getTopic();
  }

  @override
  Widget build(BuildContext context) {
    deviceH = MediaQuery.of(context).size.height;
    deviceW = MediaQuery.of(context).size.width;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    List DemoFavChp = [
      "Basic Term",
      "Tools of SQL",
      "Tools Of SQL",
      "Data Type",
      "Data Type"
    ];

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(210, 154, 43, .1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 25,
                            height: 25,
                          ),
                          Text(
                            "Search",
                            style: TextStyle(
                              color: Color.fromRGBO(210, 154, 43, 1),
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
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: TextField(
                        onChanged: (text) {
                          _filterDogList(text);
                        },
                        controller: myController,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                              onDoubleTap: () {
                                _filterDogList("");
                                myController.clear();
                                FocusScope.of(context).unfocus();
                              },
                              onTap: () {
                                _filterDogList("");
                                myController.clear();
                              },
                              child: Icon(
                                Icons.cancel_outlined,
                                color: Color.fromRGBO(210, 154, 43, 1),
                                size: 20,
                              )),
                          labelText: 'Search  Topic',
                          labelStyle: const TextStyle(
                            fontFamily: 'Gilroy-ExtraBold',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color.fromRGBO(210, 154, 43, 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(210, 154, 43, 1),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(210, 154, 43, 1),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color.fromRGBO(210, 154, 43, 1),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height - 300,
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: tempTopicName.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  splashColor: Colors.grey,
                                  onTap: () {
                                    setState(() {
                                      topicId = (temp4[index].keys.toList()[0]);
                                    });
                                    print(temp4[index].keys.toList()[0]);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Chapter(
                                                temp4[index].values.toList()[0],
                                                temp4[index].keys.toList()[0],
                                                false)));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 7,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(left: 20),
                                                  child: Text(
                                                    (index + 1).toString(),
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            210, 154, 43, .7),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 25),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 7,
                                                child: Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      /*Container(
                                                          width: isPortrait
                                                              ? deviceW - 220
                                                              : deviceH,
                                                          child: Text(
                                                            categoryNameList[temp4
                                                                        .length ==
                                                                    0
                                                                ? 0
                                                                : ((temp4[index]
                                                                            .keys
                                                                            .toList()[
                                                                        0]) -
                                                                    1)],
                                                            overflow:
                                                                TextOverflow.fade,
                                                            maxLines: 1,
                                                            softWrap: false,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              fontSize: 14,
                                                              color:
                                                                  Color.fromRGBO(
                                                                      210,
                                                                      154,
                                                                      43,
                                                                      .8),
                                                            ),
                                                          )),*/
                                                      Container(
                                                          width: isPortrait
                                                              ? deviceW - 220
                                                              : deviceH,
                                                          child: Text(
                                                            tempTopicName[index]
                                                                .toString(),
                                                            overflow:
                                                                TextOverflow
                                                                    .fade,
                                                            maxLines: 1,
                                                            softWrap: false,
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .grey),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: Colors.grey.shade300,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 5,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Color.fromRGBO(210, 154, 43, .5),
                                          offset: Offset(1.0, 5.0), //(x,y)
                                          blurRadius: 5.0,
                                        ),
                                      ],
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color.fromRGBO(210, 154, 43, .4),
                                          Color.fromRGBO(210, 154, 43, .5),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _filterDogList(String text) {
    if (text.isEmpty) {
      setState(() {
        tempTopicName = temp.keys.toList();
      });
    } else {
      var temp2;
      setState(() {
        temp2 = Map.fromEntries(temp.entries.where((entry) =>
            entry.key.toUpperCase().contains(text.toString().toUpperCase())));
        tempTopicName = temp2.keys.toList();
        temp4 = temp2.values.toList();
      });
    }
  }

  /*_fetchDogsBreed() async {
    setState(() {
      isLoading = true;
    });

    setState(() {
      topicNameList = tempTNList;
      isLoading = false;
    });
    print(topicNameList);
  }*/

  Future<TopicHeadings> getTopicHeadings(a) async {
    final response = await http.get(
        Uri.parse(
            "http://Api.aswdc.in/Api/LearnSQL/GetTopicListByCategoryID/GetTopicListByCategoryID/$a/SQL"),
        headers: {"API_KEY": "1234"});
    var data = jsonDecode(response.body.toString());

    topic_headings = TopicHeadings.fromJson(data);
    for (int i = 0; i < topic_headings.resultList!.length.toInt(); i++) {
      temp.addAll({
        topic_headings.resultList![i].topicName.toString(): {
          topic_headings.resultList![i].categoryID as int: i
        }
      });
      // print(temp);
    }

    setState(() {
      isLoading = true;
    });

    setState(() {
      tempTopicName = temp.keys.toList();
      temp4 = temp.values.toList();
      isLoading = false;
    });

    return topic_headings;
  }

  late TopicNameModel model;

  Future<TopicNameModel> getTopic() async {
    final response = await http.get(
        Uri.parse(
            "http://Api.aswdc.in/Api/LearnSQL/GetCategoryList/GetCategoryList/SQL"),
        headers: {"API_KEY": "1234"});
    var data = jsonDecode(response.body.toString());

    model = TopicNameModel.fromJson(data);
    for (int i = 0; i < model.resultList!.length; i++) {
      tempCNList.add(model.resultList![i].categoryName.toString());
    }

    setState(() {
      categoryNameList = tempCNList;
    });
    print(categoryNameList);
    return model;
  }
}
