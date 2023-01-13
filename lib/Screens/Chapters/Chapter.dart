import 'dart:convert';

import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:learnsql/model/chapter/database/model/chapterListModel.dart';
import 'package:learnsql/model/chapter/database/util/db_service.dart';
import 'package:learnsql/model/favourite/model/favListModel.dart';
import 'package:learnsql/model/favourite/utils/db_service.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../model/topicHeadings/topic_headings.dart';
import 'Chapters_list.dart';

late TopicHeadings topic_headings;
late int InitialPostion;
late int currentPostion;
late int topicIdtemp;
bool isFavEnable = true;

bool onpagechange = false;

class Chapter extends StatefulWidget {
  Chapter(int a, int topicId, bool favEnable, {Key? key, this.model})
      : super(key: key) {
    InitialPostion = a;
    topicIdtemp = topicId;
    isFavEnable = favEnable;
  }
  final favListModel? model;

  @override
  State<Chapter> createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> with WidgetsBindingObserver {
  late List<favListModel> nb = [];
  late List<chapterListModel> nbChapter = [];

  late DBService dbService;
  List<chapterListModel> isFav = [];
  DBChapterService dbChapterService = DBChapterService();

  void get() async {
    nb = await dbService.getFav();
    isFav = await dbChapterService.getSingleChapterDetail(topicIdtemp);
    onpagechange = false;
  }

  @override
  void initState() {
    onpagechange = false;
    super.initState();
    dbService = DBService();
    get();
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller =
        PageController(initialPage: InitialPostion);

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, 1);
        return await true;
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(13, 204, 179, .1)),
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: FutureBuilder<TopicHeadings>(
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return Column(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context, 1);
                                    },
                                    child: Icon(
                                      Icons.arrow_back_ios_new_rounded,
                                      color: Color.fromRGBO(13, 204, 179, 1),
                                    ),
                                  ),
                                  Text(
                                    "Chapter",
                                    style: TextStyle(
                                      color: Color.fromRGBO(13, 204, 179, 1),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: "Sophisto",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  )
                                ],
                              ),
                            )),
                        Expanded(
                          flex: 16,
                          child: PageView.builder(
                            physics: BouncingScrollPhysics(),
                            controller: controller,
                            onPageChanged: (page) {
                              currentPostion = page;
                              onpagechange = true;

                              dbChapterService.setRead(
                                  1,
                                  int.parse(snapshot
                                      .data!.resultList![page].topicID
                                      .toString()));
                              add() async {
                                isFav = await dbChapterService
                                    .getSingleChapterDetail(int.parse((snapshot
                                        .data!.resultList![0].categoryID
                                        .toString())));
                                for (int i = 0; i <= isFav.length; i++) {
                                  print(isFav[i].topicName);
                                  print(isFav[i].isFavourite);
                                }
                              }

                              add();
                            },
                            itemCount: snapshot.data!.resultList!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
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
                                  child: Container(
                                    margin: EdgeInsets.all(20),
                                    child: InteractiveViewer(
                                      child: SingleChildScrollView(
                                        physics: BouncingScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        child: SingleChildScrollView(
                                          physics: BouncingScrollPhysics(),
                                          child: Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Flexible(
                                                    flex: 5,
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          bottom: 15),
                                                      child: Text(
                                                        snapshot
                                                            .data!
                                                            .resultList![index]
                                                            .topicName
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ),
                                                  isFavEnable
                                                      ? Flexible(
                                                          flex: 2,
                                                          child: Container(
                                                            child:
                                                                FavoriteButton(
                                                              isFavorite:
                                                                  isFav[index].isFavourite ==
                                                                          1
                                                                      ? true
                                                                      : false,
                                                              valueChanged:
                                                                  (favbutton) async {
                                                                if (favbutton ==
                                                                    true) {
                                                                  dbChapterService.setFav(
                                                                      1,
                                                                      int.parse(snapshot
                                                                          .data!
                                                                          .resultList![
                                                                              index]
                                                                          .topicID
                                                                          .toString()));

                                                                  dbService.setFav(
                                                                      1,
                                                                      int.parse(snapshot
                                                                          .data!
                                                                          .resultList![
                                                                              index]
                                                                          .topicID
                                                                          .toString()));
                                                                }
                                                                if (favbutton ==
                                                                    false) {
                                                                  dbChapterService.setFav(
                                                                      0,
                                                                      int.parse(snapshot
                                                                          .data!
                                                                          .resultList![
                                                                              index]
                                                                          .topicID
                                                                          .toString()));
                                                                  dbService.setFav(
                                                                      0,
                                                                      int.parse(snapshot
                                                                          .data!
                                                                          .resultList![
                                                                              index]
                                                                          .topicID
                                                                          .toString()));
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        )
                                                      : Flexible(
                                                          child: Container(),
                                                        ),
                                                ],
                                              ),
                                              Container(
                                                  width: double.infinity,
                                                  height: 1.5,
                                                  color: Colors.black12,
                                                  child: VerticalDivider()),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 15,
                                                    left: 10,
                                                    right: 10,
                                                    bottom: 20),
                                                child: Html(
                                                  customRender: {
                                                    "table": (context, child) {
                                                      return SingleChildScrollView(
                                                        physics:
                                                            BouncingScrollPhysics(),
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: (context.tree
                                                                as TableLayoutElement)
                                                            .toWidget(context),
                                                      );
                                                    },
                                                    "bird":
                                                        (RenderContext context,
                                                            Widget child) {
                                                      return TextSpan(
                                                          text: "🐦");
                                                    },
                                                    "flutter":
                                                        (RenderContext context,
                                                            Widget child) {
                                                      return FlutterLogo(
                                                        style: (context
                                                                        .tree
                                                                        .element!
                                                                        .attributes[
                                                                    'horizontal'] !=
                                                                null)
                                                            ? FlutterLogoStyle
                                                                .horizontal
                                                            : FlutterLogoStyle
                                                                .markOnly,
                                                        textColor: context
                                                            .style.color!,
                                                        size: context
                                                                .style
                                                                .fontSize!
                                                                .size! *
                                                            5,
                                                      );
                                                    },
                                                  },
                                                  data: snapshot
                                                      .data!
                                                      .resultList![index]
                                                      .topicWEB,
                                                  onLinkTap:
                                                      (url, _, __, ___) async {
                                                    print("Opening $url...");
                                                  },
                                                  onCssParseError:
                                                      (css, messages) {
                                                    print(
                                                        "css that errored: $css");
                                                    print("error messages:");
                                                    messages.forEach((element) {
                                                      print(element);
                                                    });
                                                  },
                                                ),
                                                /*Html(
                                                    data: snapshot
                                                        .data!
                                                        .resultList![index]
                                                        .topicWEB,
                                                  ),*/
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    );
                  } else {
                    return Center(
                        child: Container(
                            child: LoadingAnimationWidget.staggeredDotsWave(
                                color: Color.fromRGBO(13, 204, 179, 1),
                                size: 60)));
                  }
                },
                future: getTopicHeadings(),
              ),
            ),
          ),
        ),
      ),
    );
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
