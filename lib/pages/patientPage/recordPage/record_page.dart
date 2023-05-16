import 'package:diabetes_care/di/injection.dart';
import 'package:diabetes_care/pages/patientPage/recordPage/bloc/record_page_bloc.dart';
import 'package:diabetes_care/pages/patientPage/recordPage/widget/record_page_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: BlocProvider(
        create: (context) => getIt<RecordPageBloc>(),
        child: const RecordPageViewWidget(),
      ),
    );
  }
}
