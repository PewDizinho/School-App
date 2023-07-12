import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:schoolapp/util/config.dart';

class PewUtil {
  PewText getText() {
    return PewText();
  }

  PewNavBar getNav() {
    return PewNavBar();
  }

  Config getConfig() {
    return Config();
  }

  PewButton getButton() {
    return PewButton();
  }
}

class PewButton {
  int iconSize = 70;
  int textSize = 20;
  IconData icon = Icons.abc;
  Widget text = PewText().get("Text");
  Function onTap = () => {};
  Widget? newRoute = null;

  PewButton setTextSize(int size) {
    textSize = size;
    return this;
  }

  PewButton setIcon(IconData iconData) {
    icon = iconData;
    return this;
  }

  PewButton setText(String texto) {
    text = PewText().get(texto);
    return this;
  }

  PewButton setOnTap(onTapEvent) {
    onTap = onTapEvent;
    return this;
  }

  PewButton setRoute(route) {
    newRoute = route;
    return this;
  }

  PewButton setIconSize(int size) {
    iconSize = size;
    return this;
  }

  Widget getButton(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.black,
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              if (newRoute != null) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => newRoute!,
                    ),
                    ModalRoute.withName('/'));
              }
              onTap();
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon,
                    size: (size.height > size.width
                            ? (size.height / size.width)
                            : (size.width / size.height)) *
                        iconSize
                    // size.aspectRatio * iconSize,
                    ),
                text
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PewNavBar {
  int tabIndex = 1;
  List listPages = [];

  List<IconData> listIcons = [];
  Function func = () => {};

  PewNavBar setOnTap(Function onTap) {
    func = onTap;
    return this;
  }

  PewNavBar setPages(List pages) {
    listPages = pages;
    return this;
  }

  PewNavBar setIcons(List<IconData> icons) {
    listIcons = icons;
    return this;
  }

  get(BuildContext context) {
    int lastIndex = 1;
    return CurvedNavigationBar(
      index: lastIndex,
      backgroundColor: Colors.transparent,
      items: <Widget>[
        Icon(listIcons[0], size: 30),
        Icon(listIcons[1], size: 30),
        Icon(listIcons[2], size: 30),
      ],
      onTap: (index) {
        if (lastIndex != index) {
          lastIndex = index;
          return;
        }
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => listPages[index],
            ),
            ModalRoute.withName('/'));
      },
      animationCurve: Curves.elasticOut,
      animationDuration: const Duration(milliseconds: 1800),
    );
  }
}

class PewText {
  Color _textColor = Colors.white;
  String _textFamily = "Roboto";
  double _textSize = 20;
  FontWeight _textWeight = FontWeight.normal;
  TextOverflow _textOverflow = TextOverflow.fade;
  List<Shadow> _textShadows = [
    const Shadow(
      blurRadius: 3.0,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    const Shadow(
      blurRadius: 8.0,
      color: Color.fromARGB(125, 0, 0, 255),
    ),
  ];
  EdgeInsetsGeometry _textPadding = const EdgeInsets.all(0);
  /* Default values */
  PewText setWeight(FontWeight weight) {
    _textWeight = weight;
    return this;
  }

  PewText isTitle() {
    _textSize = 40;
    _textPadding = const EdgeInsets.fromLTRB(0, 20, 0, 15);
    return this;
  }

  PewText setTextOverflow(TextOverflow textOverflow) {
    _textOverflow = textOverflow;
    return this;
  }

  PewText setTextShadows(List<Shadow> listShadows) {
    _textShadows = listShadows;
    return this;
  }

  PewText setEdgeInsetsGeometry(EdgeInsets edgeInsetsGeometry) {
    _textPadding = edgeInsetsGeometry;
    return this;
  }

  PewText setColor(Color color) {
    _textColor = color;
    return this;
  }

  PewText setFamily(String family) {
    _textFamily = family;
    return this;
  }

  PewText setSize(double size) {
    _textSize = size;
    return this;
  }

  Widget get(String text) {
    return Padding(
      padding: _textPadding,
      child: Text(
        text,
        textAlign: TextAlign.center,
        softWrap: true,
        style: TextStyle(
          color: _textColor,
          fontSize: _textSize,
          fontFamily: _textFamily,
          fontWeight: _textWeight,
          shadows: _textShadows,
          overflow: _textOverflow,
        ),
      ),
    );
  }
}
