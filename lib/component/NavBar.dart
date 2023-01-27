import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

late double deviceH;
late double deviceW;

class NavBar extends StatefulWidget {
  int currentIndex = 0;
  PageController pageController;

  NavBar(this.currentIndex, this.pageController);

  @override
  State<NavBar> createState() => _NavBarState();
}

Color iconColor = Colors.black;

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;
  Color backgroundColor = Colors.white;
  List<NavigationItem> items = [
    NavigationItem(
      Image.asset(
        "assets/icon/NavBar/home.png",
        width: 22,
      ),
      Text(
        "Home",
        style: TextStyle(
          fontFamily: "Sophisto",
          fontWeight: FontWeight.w300,
          fontSize: 20,
          color: Color.fromRGBO(13, 204, 179, 1),
        ),
      ),
      Color.fromRGBO(13, 204, 179, .2),
      Color.fromRGBO(13, 204, 179, 1),
    ),
    NavigationItem(
        Image.asset(
          "assets/icon/NavBar/heart.png",
          width: 24,
          color: Color.fromRGBO(255, 0, 0, 1.0),
        ),
        Text(
          "Favourite",
          style: TextStyle(
            fontFamily: "Sophisto",
            fontWeight: FontWeight.w300,
            fontSize: 20,
            color: Color.fromRGBO(255, 0, 0, 1.0),
          ),
        ),
        Color.fromRGBO(255, 0, 0, .2),
        Color.fromRGBO(255, 0, 0, 1.0)),
    NavigationItem(
        Image.asset(
          "assets/icon/NavBar/search.png",
          width: 22,
          color: Color.fromRGBO(210, 154, 43, 1),
        ),
        Text(
          "Search",
          style: TextStyle(
            fontFamily: "Sophisto",
            fontWeight: FontWeight.w300,
            fontSize: 20,
            color: Color.fromRGBO(210, 154, 43, 1),
          ),
        ),
        Color.fromRGBO(210, 154, 43, .2),
        Color.fromRGBO(210, 154, 43, 1)),
    NavigationItem(
      Image.asset(
        "assets/icon/NavBar/query.png",
        width: 22,
        color: Color.fromRGBO(82, 172, 220, 1),
      ),
      Text(
        "Query",
        style: TextStyle(
          fontFamily: "Sophisto",
          fontWeight: FontWeight.w300,
          fontSize: 20,
          color: Color.fromRGBO(82, 172, 220, 1),
        ),
      ),
      Color.fromRGBO(82, 172, 220, .2),
      Color.fromRGBO(82, 172, 220, 1),
    )
  ];

  Widget _buildItem(NavigationItem item, bool isSelected) {
    return AnimatedContainer(
      alignment: Alignment.center,
      duration: Duration(milliseconds: 270),
      width: isSelected ? 120 : 50,
      height: 50,
      padding:
          isSelected ? EdgeInsets.only(left: 8, right: 8) : EdgeInsets.all(0),
      decoration: isSelected
          ? BoxDecoration(
              color: item.bgColor, borderRadius: BorderRadius.circular(30))
          : BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: item.icon.image,
            color: isSelected ? item.iconColor : Colors.black,
            width: 24,
          ),
          AnimatedContainer(
            height: 20,
            width: isSelected ? 55 : 26,
            duration: Duration(milliseconds: 270),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                isSelected
                    ? DefaultTextStyle.merge(
                        style: TextStyle(color: backgroundColor),
                        child: item.title)
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    deviceH = MediaQuery.of(context).size.height;
    deviceW = MediaQuery.of(context).size.width;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Positioned(
      bottom: 0,
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        height: isPortrait ? deviceH / 11 : deviceW / 11,
        width: deviceW,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 5, offset: Offset(1, -2))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items.map((item) {
            var itemIndex = items.indexOf(item);
            return Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                    selectedIndex = itemIndex;
                    widget.pageController.jumpToPage(itemIndex);
                  });
                  HapticFeedback.heavyImpact();
                },
                child: _buildItem(item, selectedIndex == itemIndex),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class NavigationItem {
  final Image icon;
  final Text title;
  final Color bgColor;
  final Color iconColor;

  NavigationItem(this.icon, this.title, this.bgColor, this.iconColor);
}

// BottomNavyBar(
// selectedIndex: widget.currentIndex,
// onItemSelected: (index) {
// setState(() => widget.currentIndex = index);
// widget.pageController.jumpToPage(index);
// },
// items: [
// BottomNavyBarItem(
// icon: Icon(Icons.home_outlined),
// title: Text('Home'),
// activeColor: Colors.red,
// ),
// BottomNavyBarItem(
// icon: Icon(Icons.people),
// title: Text('Users'),
// activeColor: Colors.purpleAccent),
// BottomNavyBarItem(
// icon: Icon(Icons.message),
// title: Text('Messages'),
// activeColor: Colors.pink),
// BottomNavyBarItem(
// icon: Icon(Icons.settings),
// title: Text('Settings'),
// activeColor: Colors.blue),
// ],
// )
