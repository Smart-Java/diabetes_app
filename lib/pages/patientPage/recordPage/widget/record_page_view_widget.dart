import 'package:diabetes_care/pages/patientPage/recordPage/bloc/event/record_page_event.dart';
import 'package:diabetes_care/pages/patientPage/recordPage/bloc/record_page_bloc.dart';
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
  @override
  void initState() {
    super.initState();
    BlocProvider.of<RecordPageBloc>(context)
        .add(const GetAllRecordsRecordPageEvent());
  }

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
        )
      ],
    );
  }
}
