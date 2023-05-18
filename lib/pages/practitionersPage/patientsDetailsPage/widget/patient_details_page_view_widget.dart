import 'dart:async';

import 'package:diabetes_care/pages/practitionersPage/patientsDetailsPage/bloc/event/patients_details_page_event.dart';
import 'package:diabetes_care/pages/practitionersPage/patientsDetailsPage/bloc/patients_details_page_bloc.dart';
import 'package:diabetes_care/pages/practitionersPage/patientsDetailsPage/bloc/state/patients_details_page_state.dart';
import 'package:diabetes_care/pages/practitionersPage/patientsDetailsPage/widget/patient_dashboard_details_view_widget.dart';
import 'package:diabetes_care/util/pageHeaderWidget/practitioner_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientDetailsPageViewWidget extends StatefulWidget {
  final String patientName;
  final String patientEmail;
  final String patientAccessCode;
  final bool isItForCareGiver;
  final bool isItForDietitian;
  const PatientDetailsPageViewWidget({
    Key? key,
    required this.patientEmail,
    required this.patientName,
    required this.isItForCareGiver,
    required this.isItForDietitian,
    required this.patientAccessCode,
  }) : super(key: key);

  @override
  State<PatientDetailsPageViewWidget> createState() =>
      _PatientDetailsPageViewWidgetState();
}

class _PatientDetailsPageViewWidgetState
    extends State<PatientDetailsPageViewWidget> {
  late Timer updateTimer;

  String name = '';
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PatientsDetailsPageBloc>(context)
        .add(const GetPractitionerFullnameDetailsPageEvent());
    BlocProvider.of<PatientsDetailsPageBloc>(context).add(
        GetGlucoseReadingPatientsDetailsPageEvent(
            isItForUpdate: false, patientEmail: widget.patientEmail));
    BlocProvider.of<PatientsDetailsPageBloc>(context).add(
        GetLastTwoWeeksReadingPatientsDetailsPageEvent(
            isItForUpdate: false, patientEmail: widget.patientEmail));
    updateReadingListings();
  }

  void updateReadingListings() {
    updateTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      BlocProvider.of<PatientsDetailsPageBloc>(context).add(
          GetGlucoseReadingPatientsDetailsPageEvent(
              isItForUpdate: true, patientEmail: widget.patientEmail));
      BlocProvider.of<PatientsDetailsPageBloc>(context).add(
          GetLastTwoWeeksReadingPatientsDetailsPageEvent(
              isItForUpdate: true, patientEmail: widget.patientEmail));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientsDetailsPageBloc, PatientsDetailsPageState>(
      listener: (context, state) {
        if (state.partitionerName != null &&
            state.partitionerName!.isNotEmpty) {
          setState(() {
            name = state.partitionerName!;
          });
        }
      },
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {},
          child: Scaffold(
            body: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: PractitionerHeaderWidget(
                    childWidget: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        widget.isItForCareGiver == true
                            ? 'Good morning\n$name'
                            : widget.patientName,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: PatientDashboardDetailsViewWidget(
                    patientEmail: widget.patientEmail,
                    isItForDietitian: widget.isItForDietitian,
                    patientAccessCode: widget.patientAccessCode,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    updateTimer.cancel();
  }
}
