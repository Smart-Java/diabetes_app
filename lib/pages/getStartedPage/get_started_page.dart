import 'package:diabetes_care/pages/getStartedPage/widget/get_started_page_scaffold_widget.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: GetStartedPageScaffoldWidget(),
    );
  }
}
