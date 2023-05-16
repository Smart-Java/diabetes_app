import 'package:diabetes_care/pages/patientPage/dietPage/bloc/diet_page_bloc.dart';
import 'package:diabetes_care/pages/patientPage/dietPage/bloc/event/diet_page_event.dart';
import 'package:diabetes_care/pages/patientPage/dietPage/widget/diet_list_widget.dart';
import 'package:diabetes_care/util/pageHeaderWidget/patient_page_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DietPageViewWidget extends StatefulWidget {
  const DietPageViewWidget({Key? key}) : super(key: key);

  @override
  State<DietPageViewWidget> createState() => _DietPageViewWidgetState();
}

class _DietPageViewWidgetState extends State<DietPageViewWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DietPageBloc>(context).add(const GetAllDietDietPageEvent());
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
                'Diet',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 150.0,
            right: 5.0,
            left: 5.0,
          ),
          child: DietListWidet(),
        )
      ],
    );
  }
}
