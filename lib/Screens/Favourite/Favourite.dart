import 'package:flutter/material.dart';
import 'package:learnsql/Screens/Chapters/Chapter.dart';
import 'package:learnsql/Screens/Chapters/Chapters_list.dart';
import 'package:learnsql/Screens/DashBoard/DashBoard.dart';
import 'package:learnsql/model/chapter/database/model/chapterListModel.dart';
import 'package:learnsql/model/chapter/database/util/db_service.dart';
import 'package:learnsql/model/favourite/model/favListModel.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key, this.model}) : super(key: key);
  final favListModel? model;
  @override
  State<Favourite> createState() => _FavouriteState();
}

late double deviceH;
late double deviceW;

class _FavouriteState extends State<Favourite> {
  List<chapterListModel> nb = [];

  DBChapterService dbService = DBChapterService();

  void get() async {
    nb = await dbService.getFavList();
  }

  void initState() {
    get();
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
            color: Color.fromRGBO(255, 0, 0, 0.1),
          ),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
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
                            "Favourite",
                            style: TextStyle(
                              color: Colors.red,
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
                      height: MediaQuery.of(context).size.height - 230,
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      // child: ListView.builder(
                      //   itemCount: nb.length,
                      //   itemBuilder: (BuildContext context, int index) {
                      //     return Padding(
                      //       padding: const EdgeInsets.only(
                      //           left: 20, right: 20, top: 10, bottom: 10),
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           InkWell(
                      //             splashColor: Colors.grey,
                      //             onTap: () {
                      //               topicId = int.parse(
                      //                   (nb[index].topicId).toString());
                      //               Navigator.push(
                      //                   context,
                      //                   MaterialPageRoute(
                      //                       builder: (context) => Chapter(
                      //                           int.parse((nb[index].categoryId)
                      //                               .toString()))));
                      //             },
                      //             child: Container(
                      //               margin: EdgeInsets.only(bottom: 10),
                      //               child: Row(
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.spaceBetween,
                      //                 children: [
                      //                   Expanded(
                      //                     flex: 5,
                      //                     child: Row(
                      //                       mainAxisAlignment:
                      //                           MainAxisAlignment.start,
                      //                       children: [
                      //                         Container(
                      //                           margin:
                      //                               EdgeInsets.only(left: 20),
                      //                           child: Text(
                      //                             (index + 1).toString(),
                      //                             style: TextStyle(
                      //                                 color: Color.fromRGBO(
                      //                                     255, 0, 0, .7),
                      //                                 fontWeight:
                      //                                     FontWeight.w600,
                      //                                 fontSize: 25),
                      //                           ),
                      //                         ),
                      //                         Container(
                      //                           margin:
                      //                               EdgeInsets.only(left: 30),
                      //                           child: Column(
                      //                             crossAxisAlignment:
                      //                                 CrossAxisAlignment.start,
                      //                             children: [
                      //                               /*Container(
                      //                                   width: isPortrait
                      //                                       ? deviceW - 220
                      //                                       : deviceH,
                      //                                   child: Text(
                      //                                     DemoFavChp[index],
                      //                                     overflow:
                      //                                         TextOverflow.fade,
                      //                                     maxLines: 1,
                      //                                     softWrap: false,
                      //                                     style: TextStyle(
                      //                                       fontWeight:
                      //                                           FontWeight.w500,
                      //                                       fontSize: 14,
                      //                                       color:
                      //                                           Color.fromRGBO(
                      //                                               255,
                      //                                               0,
                      //                                               0,
                      //                                               .8),
                      //                                     ),
                      //                                   )),*/
                      //                               Container(
                      //                                   width: isPortrait
                      //                                       ? deviceW - 220
                      //                                       : deviceH,
                      //                                   child: Text(
                      //                                     nb[index]
                      //                                         .topicName
                      //                                         .toString(),
                      //                                     overflow:
                      //                                         TextOverflow.fade,
                      //                                     maxLines: 1,
                      //                                     softWrap: false,
                      //                                     style: TextStyle(
                      //                                         fontSize: 20,
                      //                                         fontWeight:
                      //                                             FontWeight
                      //                                                 .w700,
                      //                                         color:
                      //                                             Colors.grey),
                      //                                   )),
                      //                             ],
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                   Expanded(
                      //                       flex: 1,
                      //                       child: Icon(
                      //                         Icons.arrow_forward_ios_rounded,
                      //                         color: Colors.grey.shade300,
                      //                       ))
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //           Container(
                      //             height: 5,
                      //             width: double.infinity,
                      //             decoration: BoxDecoration(
                      //                 boxShadow: [
                      //                   BoxShadow(
                      //                     color: Color.fromRGBO(255, 0, 0, 0.5),
                      //                     offset: Offset(1.0, 5.0), //(x,y)
                      //                     blurRadius: 5.0,
                      //                   ),
                      //                 ],
                      //                 gradient: LinearGradient(
                      //                   begin: Alignment.topCenter,
                      //                   end: Alignment.bottomCenter,
                      //                   colors: [
                      //                     Color.fromRGBO(255, 0, 0, 0.4),
                      //                     Color.fromRGBO(255, 0, 0, .5),
                      //                   ],
                      //                 ),
                      //                 borderRadius: BorderRadius.circular(30)),
                      //           )
                      //         ],
                      //       ),
                      //     );
                      //   },
                      // ),
                      child: _fetchData(),
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

  _fetchData() {
    return FutureBuilder<List<chapterListModel>>(
        future: dbService.getFavList(),
        builder:
            (BuildContext context, AsyncSnapshot<List<chapterListModel>> user) {
          if (user.hasData) {
            return _buildDataTable(user.data!);
          } else {
            return Center(
                child: Center(
                    child: Container(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                            color: Colors.red, size: 60))));
          }
        });
  }

  _buildDataTable(List<chapterListModel> user) {
    if (nb.length != 0) {
      return Container(
        padding: EdgeInsets.only(bottom: 30),
        height: (MediaQuery.of(context).size.height),
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: nb.length,
            padding: EdgeInsets.only(bottom: 100),
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
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
                          topicId =
                              int.parse((nb[index].categoryId).toString());
                        });

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Chapter(
                                  int.parse((nb[index].topicIndex).toString()),
                                  int.parse(nb[index].categoryId.toString()),
                                  true)),
                        ).then((value) {
                          setState(() {
                            get();
                          });
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Text(
                                        (index + 1).toString(),
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(255, 0, 0, .7),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 25),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          /*Container(
                                                          width: isPortrait
                                                              ? deviceW - 220
                                                              : deviceH,
                                                          child: Text(
                                                            DemoFavChp[index],
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
                                                                      255,
                                                                      0,
                                                                      0,
                                                                      .8),
                                                            ),
                                                          )),*/
                                          Container(
                                              width: isPortrait
                                                  ? deviceW - 220
                                                  : deviceH,
                                              child: Text(
                                                nb[index].topicName.toString(),
                                                overflow: TextOverflow.fade,
                                                maxLines: 1,
                                                softWrap: false,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.grey),
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
                              color: Color.fromRGBO(255, 0, 0, 0.5),
                              offset: Offset(1.0, 5.0), //(x,y)
                              blurRadius: 5.0,
                            ),
                          ],
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(255, 0, 0, 0.4),
                              Color.fromRGBO(255, 0, 0, .5),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30)),
                    )
                  ],
                ),
              );
            }),
      );
    } else
      return Column(
        children: [
          Container(
            padding:
                EdgeInsets.only(top: 100, bottom: 10, left: 100, right: 100),
            child: Image.asset("assets/images/noFav.png"),
          ),
          Text(
            "No Favourite Found !",
            style: TextStyle(
              color: Colors.red.shade200,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "Quicksand",
            ),
          ),
        ],
      );
  }
}
