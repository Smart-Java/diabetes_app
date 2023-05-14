import 'package:diabetes_care/pages/profilePage/widget/profile_page_form_widget.dart';
import 'package:diabetes_care/pages/profilePage/widget/profile_page_image_widget.dart';
import 'package:diabetes_care/util/pageHeaderWidget/patient_page_header_widget.dart';
import 'package:flutter/material.dart';

class ProfilePageViewWidget extends StatelessWidget {
  const ProfilePageViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: PatientPageHeaderWidget(
            childWidget: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Profile',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 180.0,
            right: 5.0,
            left: 5.0,
          ),
          child: Column(
            children: const [
              ProfilePageImageWidget(),
              ProfilePageFormWidget(),
            ],
          ),
        )
      ],
    );
  }
}
