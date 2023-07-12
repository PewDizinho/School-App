import 'package:flutter/material.dart';
import 'package:schoolapp/pages/subPages/categories.dart';
import 'package:schoolapp/pages/subPages/profile.dart';
import 'package:schoolapp/util/PewUtil.dart';

PewUtil pu = PewUtil();
PewText pt = PewUtil().getText();

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: PewUtil()
          .getNav()
          .setPages(const [Profile(), Categories()]).setIcons(
              [Icons.person, Icons.apps, Icons.notifications]).get(context),
      backgroundColor: pu.getConfig().getBackgroundColor(),
    );
  }
}
