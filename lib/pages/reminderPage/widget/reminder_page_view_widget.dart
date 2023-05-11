import 'package:diabetes_care/util/pageHeaderWidget/page_header_widget.dart';
import 'package:flutter/material.dart';

class ReminderPageViewWidget extends StatelessWidget {
  const ReminderPageViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: PageHeaderWidget(
            childWidget: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Reminder',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
