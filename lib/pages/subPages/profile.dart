import 'package:flutter/material.dart';
import 'package:schoolapp/pages/mainPage.dart';
import 'package:schoolapp/pages/subPages/categories.dart';
import 'package:schoolapp/pages/subPages/createProfile.dart';
import 'package:schoolapp/util/PewUtil.dart';
import 'package:schoolapp/util/StudentModel.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

PewUtil pu = PewUtil();
PewText pt = pu.getText();
Student stu = Student();
Map data = {
  "name": "null",
  "escola": "null",
  "media": "null",
  "sala": "null",
  "ano": "null"
};

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    stu.init();
    if (!stu.isSaved()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const CreateProfile(),
          ),
          (route) => false,
        );
      });
    } else {
      data = stu.toJson();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: PewUtil()
          .getNav()
          .setPages(const [MainPage(), Categories()]).setIcons([
        Icons.arrow_back_ios_new,
        Icons.apps,
        Icons.notifications
      ]).get(context),
      backgroundColor: pu.getConfig().getBackgroundColor(),
      body: Column(
        children: [
          Center(
            child: pt.isTitle().get("PERFIl"),
          ),
          pt.get("Nome: ${data['name']}"),
          pt.get("Escola: ${data['escola']}"),
          pt.get("Media: ${data['media']}"),
          pt.get("Sala: ${data['sala']}"),
          pt.get("Ano: ${data['ano']}"),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 15,
            child: IconButton(
              icon: Icon(
                Icons.refresh,
                size: 15,
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateProfile(),
                  ),
                  ModalRoute.withName('/'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
