import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/config/appShimmerEffect/app_shimmer_effect.dart';
import 'package:diabetes_care/pages/patientPage/recordPage/bloc/record_page_bloc.dart';
import 'package:diabetes_care/pages/patientPage/recordPage/bloc/state/record_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecordPageListWidget extends StatefulWidget {
  const RecordPageListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<RecordPageListWidget> createState() => _RecordPageListWidgetState();
}

class _RecordPageListWidgetState extends State<RecordPageListWidget> {
  String cholesterolLevelValue = '10';
  String medicationsValue = '10';
  String weightValue = '10';
  String heightValue = '10';
  String physicalActivitiesValue = '10';
  String insulinUsageValue = '10';

  bool loadShimmer = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecordPageBloc, RecordPageState>(
        builder: (context, state) {
      return loadShimmer == true
          ? ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  child: const AppShimmerEffect.rectangular(
                    height: 70,
                    width: double.infinity,
                  ),
                );
              })
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    recordTitleValueWidget(
                      context: context,
                      title: 'Cholesterol Level',
                      value: cholesterolLevelValue,
                    ),
                    recordTitleValueWidget(
                      context: context,
                      title: 'Medications',
                      value: medicationsValue,
                    ),
                    recordTitleValueWidget(
                      context: context,
                      title: 'Height',
                      value: heightValue,
                    ),
                    recordTitleValueWidget(
                      context: context,
                      title: 'Weight',
                      value: weightValue,
                    ),
                    recordTitleValueWidget(
                      context: context,
                      title: 'Physical Activities',
                      value: physicalActivitiesValue,
                    ),
                    recordTitleValueWidget(
                      context: context,
                      title: 'Insulin Usage',
                      value: insulinUsageValue,
                    ),
                  ],
                ),
              ),
            );
    }, listener: (context, state) {
      if (state.isLoading == true) {
      } else {
        if (state.isLoading == true) {}
      }

      if (state.recordDataList != null && state.recordDataList!.isNotEmpty) {
        Map data = state.recordDataList!;
        setState(() {
          cholesterolLevelValue = data['cholesterolLevel'];
          medicationsValue = data['medications'];
          weightValue = data['weight'];
          heightValue = data['height'];
          physicalActivitiesValue = data['physicalActivities'];
          insulinUsageValue = data['insulinUsage'];
        });
      } else {
        setState(() {
          cholesterolLevelValue = '';
          medicationsValue = '';
          weightValue = '';
          heightValue = '';
          physicalActivitiesValue = '';
          insulinUsageValue = '';
        });
      }
    });
  }

  Widget recordTitleValueWidget({
    required BuildContext context,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 45.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Text(
                      value,
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: AppColors.dividerColor,
            height: 2.0,
            thickness: 1.5,
          )
        ],
      ),
    );
  }
}
