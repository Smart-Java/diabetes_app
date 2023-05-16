import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/pages/patientPage/recordPage/bloc/event/record_page_event.dart';
import 'package:diabetes_care/pages/patientPage/recordPage/bloc/record_page_bloc.dart';
import 'package:diabetes_care/pages/patientPage/recordPage/bloc/state/record_page_state.dart';
import 'package:diabetes_care/pages/patientPage/recordPage/widget/editRecordWidget/edit_record_widget.dart';
import 'package:diabetes_care/pages/patientPage/recordPage/widget/record_page_list_widget.dart';
import 'package:diabetes_care/util/pageHeaderWidget/patient_page_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecordPageViewWidget extends StatefulWidget {
  const RecordPageViewWidget({Key? key}) : super(key: key);

  @override
  State<RecordPageViewWidget> createState() => _RecordPageViewWidgetState();
}

class _RecordPageViewWidgetState extends State<RecordPageViewWidget> {
  bool showUpdateButton = false;

  String cholesterolLevelValue = '';
  String medicationsValue = '';
  String weightValue = '';
  String heightValue = '';
  String physicalActivitiesValue = '';
  String insulinUsageValue = '';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<RecordPageBloc>(context)
        .add(const GetAllRecordsRecordPageEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RecordPageBloc, RecordPageState>(
      listener: (context, state) {
        if (state.isLoading == false) {
          setState(() {
            showUpdateButton = true;
          });
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
      },
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: PatientPageHeaderWidget(
              childWidget: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Record',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 150.0,
              left: 10.0,
              right: 10.0,
            ),
            child: RecordPageListWidget(),
          ),
          showUpdateButton == false
              ? Container()
              : Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () async {
                        await showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return EditRecordWidegt(
                              cholesterolLevel: cholesterolLevelValue,
                              height: heightValue,
                              insulinUsage: insulinUsageValue,
                              medications: medicationsValue,
                              physicalActivities: physicalActivitiesValue,
                              weight: weightValue,
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            'Edit',
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
