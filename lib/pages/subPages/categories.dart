import 'package:flutter/material.dart';
import 'package:schoolapp/pages/mainPage.dart';
import '../../util/PewUtil.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

PewUtil pu = PewUtil();
PewText pt = PewUtil().getText();

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pu.getConfig().getBackgroundColor(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pt.isTitle().get("Categorias"),
            const Spacer(
              flex: 5,
            ),
            Row(
              children: [
                const Spacer(
                  flex: 2,
                ),
                pu.getButton().getButton(context),
                const Spacer(
                  flex: 1,
                ),
                pu.getButton().getButton(context),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            Row(
              children: [
                const Spacer(
                  flex: 2,
                ),
                pu.getButton().getButton(context),
                const Spacer(
                  flex: 1,
                ),
                pu.getButton().getButton(context),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            pu
                .getButton()
                .setIcon(Icons.home)
                .setText("Home")
                .setRoute(const MainPage())
                .getButton(context),
            const Spacer(
              flex: 6,
            ),
          ],
        ),
      ),
    );
  }
}
