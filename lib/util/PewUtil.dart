import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schoolapp/util/StudentModel.dart';
import 'package:schoolapp/util/config.dart';

class PewUtil {
  PewText getText() {
    return PewText();
  }

  PewInput getInput() {
    return PewInput();
  }

  Student getStudent() {
    return Student();
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

class PewInput {
  String label = "Insira aqui seu texto!";
  String hintText = "Você devia colocar um texto aqui";
  String? errText;
  TextInputType inputType = TextInputType.text;
  TextEditingController controller = TextEditingController();

  PewInput setLabel(String v) {
    label = v;
    return this;
  }

  PewInput setHintText(String v) {
    hintText = v;
    return this;
  }

  PewInput setErrorText(String? v) {
    errText = v;
    return this;
  }

  PewInput setInputType(TextInputType v) {
    inputType = v;
    return this;
  }

  PewInput setTextController(TextEditingController v) {
    controller = v;
    return this;
  }

  Widget get() {
    return TextField(
      keyboardType: inputType,
      controller: controller,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        hintText: 'Ex: $hintText',
        hintStyle: const TextStyle(
          color: Color.fromARGB(88, 255, 255, 255),
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(
            color: Colors.blueGrey,
          ),
        ),
        errorText: errText,
        errorStyle: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w500,
        ),
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
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

  PewButton setText(String? texto) {
    if (texto == null) {
      text = Container();
    } else {
      text = PewText().get(texto);
    }
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
