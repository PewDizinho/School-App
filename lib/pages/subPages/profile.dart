import 'package:flutter/material.dart';
import 'package:schoolapp/pages/mainPage.dart';
import 'package:schoolapp/util/PewUtil.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

PewUtil pu = PewUtil();
PewText pt = PewUtil().getText();

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: PewUtil()
          .getNav()
          .setPages(const [Profile(), MainPage()]).setIcons([
        Icons.arrow_back_ios_new,
        Icons.apps,
        Icons.notifications
      ]).get(context),
      backgroundColor: pu.getConfig().getBackgroundColor(),
      body: Column(
        children: [
          Center(
            child: pt.get("PROFILE"),
          )
        ],
      ),
    );
  }
}
