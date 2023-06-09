import 'package:diabetes_care/di/injection.dart';
import 'package:diabetes_care/pages/profilePage/bloc/profile_page_bloc.dart';
import 'package:diabetes_care/pages/profilePage/widget/profile_page_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  final bool isItAPatient;
  const ProfilePage({
    Key? key,
    required this.isItAPatient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: BlocProvider(
        create: (context) => getIt<ProfilePageBloc>(),
        child: isItAPatient == true
            ? ProfilePageViewWidget(
                isItAPatient: isItAPatient,
              )
            : Scaffold(
                body: ProfilePageViewWidget(
                  isItAPatient: isItAPatient,
                ),
              ),
      ),
    );
  }
}
