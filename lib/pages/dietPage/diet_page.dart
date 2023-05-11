import 'package:diabetes_care/pages/dietPage/widget/diet_page_view_widget.dart';
import 'package:flutter/material.dart';

class DietPage extends StatelessWidget {
  const DietPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: Scaffold(
        body: DietPageViewWidget(),
      ),
    );
  }
}
