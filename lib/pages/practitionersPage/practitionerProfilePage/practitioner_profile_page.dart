import 'package:diabetes_care/pages/profilePage/profile_page.dart';
import 'package:flutter/material.dart';

class PractitionerProfilePage extends StatelessWidget {
  const PractitionerProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: ProfilePage(
        isItAPatient: false,
      ),
    );
  }
}
