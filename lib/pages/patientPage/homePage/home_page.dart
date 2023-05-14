import 'package:diabetes_care/pages/patientPage/homePage/widget/home_page_view_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        top: false,
        bottom: false,
        left: false,
        right: false,
        child: HomePageViewWidget(),
      );
  }
}
