import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerHomePage/widget/practitioner_details_list_widget.dart';
import 'package:diabetes_care/util/pageHeaderWidget/patient_page_header_widget.dart';
import 'package:flutter/material.dart';

class PractitionerHomePageViewWidget extends StatelessWidget {
  const PractitionerHomePageViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: PatientPageHeaderWidget(
            childWidget: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5.0,
                    right: 5.0,
                  ),
                  child: Container(
                    height: 30.0,
                    width: 31.0,
                    decoration: const BoxDecoration(
                      color: AppColors.whiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                Text(
                  'Good Afternoon John',
                  style: Theme.of(context).textTheme.headlineLarge,
                )
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 180.0),
          child: PractitionerDetailsListWidget(),
        )
      ],
    );
  }
}
